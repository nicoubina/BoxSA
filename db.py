
"""Data access layer for the Box SA sales order management application."""
from __future__ import annotations

from datetime import date
from typing import Dict, List, Optional, Sequence, Tuple

import pymysql

from connect import get_connection


class StockException(RuntimeError):
    """Raised when there is insufficient stock for one or more components."""

    def __init__(self, shortages: Sequence[Dict[str, object]]):
        super().__init__("Insufficient stock for one or more components")
        self.shortages = list(shortages)


def ensure_reservation_table() -> None:
    """Ensure that the reservation table exists in the database."""
    ddl = """
        CREATE TABLE IF NOT EXISTS orden_venta_reserva_componentes (
            reserva_id INT NOT NULL AUTO_INCREMENT,
            orden_id INT NOT NULL,
            articulo_id INT NOT NULL,
            cantidad_reservada DECIMAL(12,2) NOT NULL,
            fecha_reserva DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (reserva_id),
            KEY orden_id_idx (orden_id),
            KEY articulo_id_idx (articulo_id),
            CONSTRAINT fk_reserva_orden
                FOREIGN KEY (orden_id) REFERENCES orden_venta_cabecera (orden_id)
                ON DELETE CASCADE,
            CONSTRAINT fk_reserva_articulo
                FOREIGN KEY (articulo_id) REFERENCES articulos (articulo_id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
    """
    with get_connection(autocommit=True) as conn:
        with conn.cursor() as cursor:
            cursor.execute(ddl)


def _get_next_order_number(cursor: pymysql.cursors.Cursor) -> str:
    cursor.execute(
        "SELECT numero_orden FROM orden_venta_cabecera ORDER BY orden_id DESC LIMIT 1"
    )
    row = cursor.fetchone()
    if not row or not row["numero_orden"]:
        return "OV-0001"
    last_number = row["numero_orden"]
    try:
        prefix, numeric = last_number.split("-")
        next_value = int(numeric) + 1
    except ValueError:
        prefix = "OV"
        next_value = 1
    return f"{prefix}-{next_value:04d}"


def list_clients() -> List[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(
                "SELECT cliente_id, razon_social, Marca FROM clientes ORDER BY razon_social"
            )
            return list(cursor.fetchall())


def list_products_for_client(client_id: int) -> List[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(
                """
                SELECT producto_id, idProducto, ProdDetalle, PUnitario
                FROM productos
                WHERE idCliente = %s AND Estado = 'A'
                ORDER BY ProdDetalle
                """,
                (client_id,),
            )
            return list(cursor.fetchall())


def get_product(product_id: int) -> Optional[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(
                """
                SELECT producto_id, idProducto, idCliente, ProdDetalle, PUnitario
                FROM productos
                WHERE producto_id = %s
                """,
                (product_id,),
            )
            return cursor.fetchone()


def _get_bom_for_product(cursor: pymysql.cursors.Cursor, product_id: int) -> List[Dict[str, object]]:
    cursor.execute(
        """
        SELECT rm.IdArt, rm.Qty, rm.IdProducto, rm.UMComp, a.articulo_id, a.ArtDet, a.Stock
        FROM rec_materiales rm
        JOIN productos p ON p.idProducto = rm.IdProducto
        JOIN articulos a ON a.idArt = rm.IdArt
        WHERE p.producto_id = %s
        ORDER BY rm.Seq
        """,
        (product_id,),
    )
    return list(cursor.fetchall())


def get_bom_for_product(product_id: int) -> List[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            return _get_bom_for_product(cursor, product_id)


def _check_component_stock(
    cursor: pymysql.cursors.Cursor,
    items: Sequence[Dict[str, object]],
) -> List[Dict[str, object]]:
    shortages: List[Dict[str, object]] = []
    for item in items:
        product_id = int(item["producto_id"])
        quantity = float(item["cantidad"])
        bom = _get_bom_for_product(cursor, product_id)
        for component in bom:
            required = float(component["Qty"]) * quantity
            available = float(component["Stock"])
            if available < required:
                shortages.append(
                    {
                        "producto_id": product_id,
                        "producto_codigo": component["IdProducto"],
                        "componente": component["ArtDet"],
                        "id_articulo": component["articulo_id"],
                        "cantidad_requerida": required,
                        "cantidad_disponible": available,
                    }
                )
    return shortages


def _reserve_components(
    cursor: pymysql.cursors.Cursor,
    order_id: int,
    items: Sequence[Dict[str, object]],
) -> None:
    for item in items:
        product_id = int(item["producto_id"])
        quantity = float(item["cantidad"])
        bom = _get_bom_for_product(cursor, product_id)
        for component in bom:
            required = float(component["Qty"]) * quantity
            articulo_id = int(component["articulo_id"])
            cursor.execute(
                "UPDATE articulos SET Stock = Stock - %s WHERE articulo_id = %s",
                (required, articulo_id),
            )
            cursor.execute(
                """
                INSERT INTO orden_venta_reserva_componentes (
                    orden_id, articulo_id, cantidad_reservada
                ) VALUES (%s, %s, %s)
                """,
                (order_id, articulo_id, required),
            )


def _release_components(cursor: pymysql.cursors.Cursor, order_id: int) -> None:
    cursor.execute(
        """
        SELECT articulo_id, cantidad_reservada
        FROM orden_venta_reserva_componentes
        WHERE orden_id = %s
        """,
        (order_id,),
    )
    reservations = cursor.fetchall()
    for reservation in reservations:
        cursor.execute(
            "UPDATE articulos SET Stock = Stock + %s WHERE articulo_id = %s",
            (reservation["cantidad_reservada"], reservation["articulo_id"]),
        )
    cursor.execute(
        "DELETE FROM orden_venta_reserva_componentes WHERE orden_id = %s",
        (order_id,),
    )


def list_orders() -> List[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(
                """
                SELECT ov.orden_id, ov.numero_orden, ov.fecha_emision, ov.fecha_entrega,
                       c.razon_social AS cliente
                FROM orden_venta_cabecera ov
                JOIN clientes c ON c.cliente_id = ov.cliente_id
                ORDER BY ov.fecha_emision DESC, ov.orden_id DESC
                """
            )
            return list(cursor.fetchall())


def get_order(order_id: int) -> Optional[Dict[str, object]]:
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(
                """
                SELECT ov.*, c.razon_social
                FROM orden_venta_cabecera ov
                JOIN clientes c ON c.cliente_id = ov.cliente_id
                WHERE ov.orden_id = %s
                """,
                (order_id,),
            )
            header = cursor.fetchone()
            if not header:
                return None
            cursor.execute(
                """
                SELECT d.detalle_id, d.producto_id, d.cantidad, d.precio_unitario,
                       d.descuento_porcentaje, p.ProdDetalle, p.idProducto
                FROM orden_venta_detalle d
                JOIN productos p ON p.producto_id = d.producto_id
                WHERE d.orden_id = %s
                ORDER BY d.detalle_id
                """,
                (order_id,),
            )
            header["detalles"] = list(cursor.fetchall())
            return header


def create_sales_order(
    *,
    cliente_id: int,
    vendedor_id: int,
    fecha_emision: date,
    fecha_entrega: date,
    tipo_pago_id: Optional[int],
    tipo_entrega_id: Optional[int],
    detalles: Sequence[Dict[str, object]],
) -> Tuple[int, str]:
    ensure_reservation_table()
    with get_connection() as conn:
        try:
            cursor = conn.cursor()
            shortages = _check_component_stock(cursor, detalles)
            if shortages:
                raise StockException(shortages)
            numero_orden = _get_next_order_number(cursor)
            cursor.execute(
                """
                INSERT INTO orden_venta_cabecera (
                    numero_orden, fecha_emision, fecha_entrega, cliente_id,
                    vendedor_id, tipo_pago_id, tipo_entrega_id
                ) VALUES (%s, %s, %s, %s, %s, %s, %s)
                """,
                (
                    numero_orden,
                    fecha_emision,
                    fecha_entrega,
                    cliente_id,
                    vendedor_id,
                    tipo_pago_id,
                    tipo_entrega_id,
                ),
            )
            order_id = cursor.lastrowid
            for detalle in detalles:
                cursor.execute(
                    """
                    INSERT INTO orden_venta_detalle (
                        orden_id, producto_id, cantidad, precio_unitario,
                        descuento_porcentaje
                    ) VALUES (%s, %s, %s, %s, %s)
                    """,
                    (
                        order_id,
                        detalle["producto_id"],
                        detalle["cantidad"],
                        detalle["precio_unitario"],
                        detalle.get("descuento_porcentaje", 0) or 0,
                    ),
                )
            _reserve_components(cursor, order_id, detalles)
            conn.commit()
            return order_id, numero_orden
        except Exception:
            conn.rollback()
            raise
        finally:
            cursor.close()


def update_sales_order(
    order_id: int,
    *,
    fecha_emision: date,
    fecha_entrega: date,
    tipo_pago_id: Optional[int],
    tipo_entrega_id: Optional[int],
    detalles: Sequence[Dict[str, object]],
) -> str:
    ensure_reservation_table()
    with get_connection() as conn:
        try:
            cursor = conn.cursor()
            shortages = _check_component_stock(cursor, detalles)
            if shortages:
                raise StockException(shortages)
            _release_components(cursor, order_id)
            cursor.execute(
                """
                UPDATE orden_venta_cabecera
                SET fecha_emision = %s,
                    fecha_entrega = %s,
                    tipo_pago_id = %s,
                    tipo_entrega_id = %s
                WHERE orden_id = %s
                """,
                (
                    fecha_emision,
                    fecha_entrega,
                    tipo_pago_id,
                    tipo_entrega_id,
                    order_id,
                ),
            )
            cursor.execute(
                "DELETE FROM orden_venta_detalle WHERE orden_id = %s",
                (order_id,),
            )
            for detalle in detalles:
                cursor.execute(
                    """
                    INSERT INTO orden_venta_detalle (
                        orden_id, producto_id, cantidad, precio_unitario,
                        descuento_porcentaje
                    ) VALUES (%s, %s, %s, %s, %s)
                    """,
                    (
                        order_id,
                        detalle["producto_id"],
                        detalle["cantidad"],
                        detalle["precio_unitario"],
                        detalle.get("descuento_porcentaje", 0) or 0,
                    ),
                )
            _reserve_components(cursor, order_id, detalles)
            cursor.execute(
                "SELECT numero_orden FROM orden_venta_cabecera WHERE orden_id = %s",
                (order_id,),
            )
            numero_orden = cursor.fetchone()["numero_orden"]
            conn.commit()
            return numero_orden
        except Exception:
            conn.rollback()
            raise
        finally:
            cursor.close()


def delete_sales_order(order_id: int) -> None:
    ensure_reservation_table()
    with get_connection() as conn:
        try:
            cursor = conn.cursor()
            _release_components(cursor, order_id)
            cursor.execute(
                "DELETE FROM orden_venta_detalle WHERE orden_id = %s",
                (order_id,),
            )
            cursor.execute(
                "DELETE FROM orden_venta_cabecera WHERE orden_id = %s",
                (order_id,),
            )
            conn.commit()
        except Exception:
            conn.rollback()
            raise
        finally:
            cursor.close()
