"""Flask application that manages Box SA sales orders (Ordenes de Venta)."""
from __future__ import annotations

from datetime import date, datetime
from typing import List, Optional

from flask import Flask, flash, jsonify, redirect, render_template, request, url_for

import db
from db import StockException

app = Flask(__name__)
app.secret_key = "boxsa-secret-key"


@app.context_processor
def inject_globals():
    return {"current_year": datetime.now().year}


@app.template_filter("datevalue")
def _datevalue(value: Optional[date]) -> str:
    if isinstance(value, (date, datetime)):
        return value.strftime("%Y-%m-%d")
    return ""


@app.route("/")
def index() -> str:
    orders = db.list_orders()
    return render_template("orders_list.html", orders=orders)


@app.route("/api/clients/<int:client_id>/products")
def api_client_products(client_id: int):
    products = db.list_products_for_client(client_id)
    for product in products:
        price = product.get("PUnitario")
        product["PUnitario"] = float(price) if price is not None else None
    return jsonify(products)


@app.route("/api/products/<int:product_id>/bom")
def api_product_bom(product_id: int):
    bom = db.get_bom_for_product(product_id)
    formatted = [
        {
            "articulo": component["ArtDet"],
            "cantidad": float(component["Qty"]),
            "stock": float(component["Stock"]),
            "unidad": component["UMComp"],
        }
        for component in bom
    ]
    return jsonify(formatted)


def _parse_order_form() -> Optional[dict]:
    cliente_id = request.form.get("cliente_id")
    if not cliente_id:
        flash("Debe seleccionar un cliente.", "error")
        return None
    productos = request.form.getlist("producto_id")
    cantidades = request.form.getlist("cantidad")
    precios = request.form.getlist("precio_unitario")
    descuentos = request.form.getlist("descuento_porcentaje")
    detalles: List[dict] = []
    for index, producto_id in enumerate(productos):
        if not producto_id:
            continue
        cantidad = cantidades[index]
        precio = precios[index]
        descuento = descuentos[index] if index < len(descuentos) else "0"
        if not cantidad:
            flash("Debe indicar la cantidad para cada producto seleccionado.", "error")
            return None
        if not precio:
            product = db.get_product(int(producto_id))
            precio = product.get("PUnitario") if product else 0
        detalles.append(
            {
                "producto_id": int(producto_id),
                "cantidad": float(cantidad),
                "precio_unitario": float(precio),
                "descuento_porcentaje": float(descuento or 0),
            }
        )
    if not detalles:
        flash("Debe agregar al menos un producto a la orden.", "error")
        return None

    fecha_emision = request.form.get("fecha_emision") or date.today().isoformat()
    fecha_entrega = request.form.get("fecha_entrega") or date.today().isoformat()
    tipo_pago_id = request.form.get("tipo_pago_id") or None
    tipo_entrega_id = request.form.get("tipo_entrega_id") or None

    return {
        "cliente_id": int(cliente_id),
        "fecha_emision": date.fromisoformat(fecha_emision),
        "fecha_entrega": date.fromisoformat(fecha_entrega),
        "tipo_pago_id": int(tipo_pago_id) if tipo_pago_id else None,
        "tipo_entrega_id": int(tipo_entrega_id) if tipo_entrega_id else None,
        "detalles": detalles,
    }


@app.route("/order/new", methods=["GET", "POST"])
def new_order():
    clients = db.list_clients()
    if request.method == "POST":
        parsed = _parse_order_form()
        if parsed is None:
            return render_template("order_form.html", clients=clients, order=None, is_edit=False)
        try:
            order_id, numero_orden = db.create_sales_order(
                cliente_id=parsed["cliente_id"],
                vendedor_id=1,
                fecha_emision=parsed["fecha_emision"],
                fecha_entrega=parsed["fecha_entrega"],
                tipo_pago_id=parsed["tipo_pago_id"],
                tipo_entrega_id=parsed["tipo_entrega_id"],
                detalles=parsed["detalles"],
            )
            flash(f"Orden de venta {numero_orden} creada correctamente.", "success")
            return redirect(url_for("order_detail", order_id=order_id))
        except StockException as exc:
            for shortage in exc.shortages:
                flash(
                    "Sin stock suficiente para {componente} (producto {producto_codigo}). "
                    "Disponible: {cantidad_disponible}, requerido: {cantidad_requerida}.".format(**shortage),
                    "error",
                )
        except Exception as exc:
            flash(f"No fue posible crear la orden: {exc}", "error")
    return render_template("order_form.html", clients=clients, order=None, is_edit=False)


@app.route("/order/<int:order_id>")
def order_detail(order_id: int):
    order = db.get_order(order_id)
    if not order:
        flash("La orden solicitada no existe.", "error")
        return redirect(url_for("index"))
    return render_template("order_detail.html", order=order)


@app.route("/order/<int:order_id>/edit", methods=["GET", "POST"])
def edit_order(order_id: int):
    order = db.get_order(order_id)
    if not order:
        flash("La orden solicitada no existe.", "error")
        return redirect(url_for("index"))
    clients = db.list_clients()
    if request.method == "POST":
        parsed = _parse_order_form()
        if parsed is None:
            return render_template(
                "order_form.html",
                clients=clients,
                order=order,
                is_edit=True,
                order_id=order_id,
            )
        try:
            numero_orden = db.update_sales_order(
                order_id,
                fecha_emision=parsed["fecha_emision"],
                fecha_entrega=parsed["fecha_entrega"],
                tipo_pago_id=parsed["tipo_pago_id"],
                tipo_entrega_id=parsed["tipo_entrega_id"],
                detalles=parsed["detalles"],
            )
            flash(f"Orden de venta {numero_orden} actualizada correctamente.", "success")
            return redirect(url_for("order_detail", order_id=order_id))
        except StockException as exc:
            for shortage in exc.shortages:
                flash(
                    "Sin stock suficiente para {componente} (producto {producto_codigo}). "
                    "Disponible: {cantidad_disponible}, requerido: {cantidad_requerida}.".format(**shortage),
                    "error",
                )
        except Exception as exc:
            flash(f"No fue posible actualizar la orden: {exc}", "error")
    return render_template("order_form.html", clients=clients, order=order, is_edit=True, order_id=order_id)


@app.route("/order/<int:order_id>/delete", methods=["POST"])
def delete_order(order_id: int):
    try:
        db.delete_sales_order(order_id)
        flash("La orden fue eliminada correctamente.", "success")
    except Exception as exc:
        flash(f"No fue posible eliminar la orden: {exc}", "error")
    return redirect(url_for("index"))


if __name__ == "__main__":
    app.run(debug=True)
