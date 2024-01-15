#!/bin/bash

# Usuarios de la base de datos
DB_USER=""
DB_PASS=""

echo "LOGIN COMMENT_MANAGER"
echo "user:"
read $DB_USER
read "password:"
read $DB_PASS

if [ "$DB_USER" != comentarios ]
then
    echo "Usuario no valido para el gestor, saliendo del programa..."
    wait 1
    clear
    exit 1
fi
clear

DB_NAME="faryadventures"

echo "Bienvenido al gestor de commentarios de la base de datos Faryadventures"
echo "Seleccione que accion deseas realizar:"
echo "1. Leer comentarios existentes"
echo "2. Insertar comentarios"

read $SELECCION

if [ "$SELECCION" == "1" ]
then

    SQL_QUERY="SELECT * FROM comments;"

    mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "$SQL_QUERY"
fi

if [ "$SELECCION" == "2" ]
then 
    echo "Escriba el comentario a insertar:"
    read $COMENTARIO

    SQL_QUERY="INSERT INTO comments (comment) VALUES ("$COMENTARIO") "

    mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "$SQL_QUERY"
    wait 1
    echo "Commentario añadido exitosamente"
fi
exit 0