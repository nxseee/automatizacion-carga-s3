#!/bin/bash

# Variables
BUCKET_NAME="dataops-test-edhu"
FILE_NAME="dataset.csv"
S3_PATH="s3://$BUCKET_NAME/$FILE_NAME"

echo "Descargando dataset..."
wget -O $FILE_NAME "https://people.sc.fsu.edu/~jburkardt/data/csv/airtravel.csv"

if [ -f "$FILE_NAME" ]; then
    echo "Subiendo $FILE_NAME a S3..."
    aws s3 cp $FILE_NAME $S3_PATH

    if [ $? -eq 0 ]; then
        echo "Archivo subido exitosamente a $S3_PATH"
    else
        echo "Error en la subida del archivo"
        exit 1
    fi
else
    echo "Error: No se pudo descargar el dataset"
    exit 1
fi

