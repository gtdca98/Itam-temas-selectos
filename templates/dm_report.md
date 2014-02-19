

Reporte de Proyecto de Minería de Datos
=====================================================

**Adolfo De Unánue Tiscareño**



## Introducción
Una descripción breve del proyecto (uno o dos párrafos)

## Problema de Negocio
Describir las discusiones con el cliente (*business owner*), sobre todo **registra** las decisiones tomadas
y el entendimiento *acordado* del problema de negocio. 

Incluye aquí también un diccionario de términos, descripción del proceso, etc.

## Fuentes de Datos
Los datos a utilizar provendrán de varias fuentes, es necesario identificarlas y discutir los accesos 
con los dueños de las mismas (*data owners*). 

Documentar en esta sección las fuentes de datos, su integridad, tamaño, fechas de vigencia, etc.

## Preparación de los Datos
Subir los datos a `R` u otro ambiente equivalente, realizar las operaciones necesarias para preparar
los datos (*data munging*, *data wrangling*) para poder generar modelos. 

Describir los pasos realizados, hacer referencia a los distintos `scripts` utilizados. 


## Exploración de datos
Debemos de entender los datos y esto se realiza explorando los datos y reportando sus características: dimensiones, 
estructura, análisis categórico, análisis numérico univariado, rangos, mínimos, faltantes (`missing analysis`), gráficas. Análisis estadístico
por grupos, etc.

  - Tamaño del ds
  - Número de variables categóricas y numéricas
  - Lista de variables en formato (para copy/paste)
  - Porcentaje de NAs por variable
  - Diagrama de cada variable ¿Cuál es su forma?
  - ¿Cósas inesperadas (por variable)?
  - ¿Hay codificación (NAs, blancos, 9999) ?¿Qué significan?
  - Determinar cuáles son decimales, enteros, fechas (repetir para estas variables)
  - ¿Outliners?


¿Se generaron nuevas variables? ¿Se seleccionaon variables?

## Construcción del Modelo

Modelos que se intentaron, racional detrás de la selección de estos modelos predictivos. Incluir las evaluaciones
y codigo `R` (o similar).

## Despliegue del modelo
Se elige un modelo, se exporta a `PMML` o se definen sus parámetros para que sean agregado al *pipe* de 
manipulación de datos. Si requiere cambios arquitectónicos, hacer referencia al documento técnico donde se describan.

Hacer referencia a la presentación ejecutiva.
