"""Database connection utilities for the Box SA sales order application."""
from __future__ import annotations

import os
from typing import Optional

import pymysql

from dotenv import load_dotenv
load_dotenv()

def get_connection(*, autocommit: bool = False) -> pymysql.connections.Connection:
    """Return a new PyMySQL connection using environment aware configuration.

    Connection parameters are read from environment variables so the
    application can be configured without code changes:

    ``BOXSA_DB_HOST`` (default ``localhost``)
    ``BOXSA_DB_PORT`` (default ``3306``)
    ``BOXSA_DB_USER`` (default ``root``)
    ``BOXSA_DB_PASSWORD`` (default empty string)
    ``BOXSA_DB_NAME`` (default ``boxsa``)

    Args:
        autocommit: When ``True`` the returned connection runs in autocommit
            mode. The application typically manages transactions manually so
            the default is ``False``.

    Returns:
        A configured ``pymysql`` connection instance.
    """

    host = os.getenv("BOXSA_DB_HOST", "localhost")
    port = int(os.getenv("BOXSA_DB_PORT", "3306"))
    user = os.getenv("BOXSA_DB_USER", "root")
    password = os.getenv("BOXSA_DB_PASSWORD", "")
    database = os.getenv("BOXSA_DB_NAME", "boxsa")
    charset = os.getenv("BOXSA_DB_CHARSET", "utf8mb4")

    return pymysql.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        database=database,
        charset=charset,
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=autocommit,
    )
