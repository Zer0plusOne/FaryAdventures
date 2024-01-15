#!/bin/bash

DB_USER="comentar"
DB_NAME="faryadventures"

echo "Bienvenido al gestor de comentarios de la base de datos Faryadventures"
echo "Seleccione qué acción desea realizar:"
echo "1. Leer comentarios existentes"
echo "2. Insertar comentarios"

read SELECCION

if [ "$SELECCION" == "1" ]; then
    SQL_QUERY="SELECT * FROM comments;"
    mysql -u "$DB_USER" -D "$DB_NAME" -e "$SQL_QUERY"
fi

if [ "$SELECCION" == "2" ]; then 
    echo "Escriba el comentario a insertar:"
    read COMENTARIO

    SQL_QUERY="INSERT INTO comments (comment) VALUES ('$COMENTARIO');"
    mysql -u "$DB_USER" -D "$DB_NAME" -e "$SQL_QUERY"
    echo "Comentario añadido exitosamente"
fi

exit 0
