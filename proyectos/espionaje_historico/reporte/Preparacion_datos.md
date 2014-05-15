Proceso de preparación de datos
========================================================

El proceso de preparación de la fuente de datos debería de ser:

1. Carga del archivo original.
2. Normalización de los nombres de columnas.
3. Identificación de los registros.
4. Estructura, dimensión, resúmen estadístico.
5. Remover columnas inservibles.
6. Análisis de faltantes.
7. Imputar (opcional).
8. Remover registros inservibles  (opcional)
9. Extraer metadata de la fuente de datos.
10. Guardar el archivo limpio, con  sufijo  `_clean`.*timestamp*`.rds`
11. Guardar la metadata (terminación `.RData`)
12. Presentarlo (ver el `dm_report`)

Las siguientes líneas de código son sugerencias sobre como implementar los pasos
recién descritos. Este código debería de ir en un archivo llamado `clean.r`.


```r

# Preparación de los datos
ds.path <- ""  # Variable que incluye el path donde está la fuente de datos (ds)
ds.name <- ""  # Nombre de la fuente de datos
ds <- get(ds.name)  # De esta manera quedan genéricos los pasos

# Normaliza (estandariza) los nombres a minúsculas, separadas por '_', o'.'
# Si es necesario, pon nombres que tengan más sentido
names(ds) <- c()


vars <- names(ds)  # Nombres de las variables
target <- ""  # Si el proyecto es de predicción, el nombre de la variable a predecir
id <- c()  # Vector con las variables que forman el ID del registro


# Sumario de los datos
dim(ds)
names(ds)
head(ds)
tail(ds)
# Si se usa dplyr, no son necesarios los cuatro pasos anteriores, solo con
# la impresión a pantalla del ds bastaría
ds[sample(nrow(ds), 6)]
str(ds)
summary(ds)

# Variables a ignorar
vars.ignorar <- c(id)  # Identificador

mvc <- sapply(ds[vars], function(x) sum(is.na(x)))  # Conteo de valores faltantes
mvn <- names(ds)[(which(mvc == nrow(ds)))]  # Nombre de las variables con todas faltantes
ignore <- union(ignore, mvn)

# Otra alternativa es eliminar los que tienen más del 70% de faltantes No
# recomendado sin hacer análisis de missings mvn <- names(which(mvc >=
# 0.7*nrow(ds))) ignore <- union(ignore, mvn)


# Ignoramos las variables con muchos niveles Por ejemplo el randomForest no
# puede con variables categóricas de más de 32 niveles.  Es más recomendable
# recodificar en menos niveles
factors <- which(sapply(ds[vars], is.factor))
lvls <- sapply(factors, function(x) length(levels(ds[[x]])))
(many <- names(which(lvls > 20)))
ignore <- union(ignore, many)

# Ignoramos variables con valores constantes
(constants <- names(which(sapply(ds[vars], function(x) all(x == x[1L])))))
ignore <- union(ignore, constants)

# Eliminamos las variables a ignorar
vars <- setdiff(vars, ignore)

# Es mucho sabio tener una función de imputación especial No se recomienda
# imputar sin saber el comportamiento de los missings


# Normalizar los factores
factores <- which(sapply(ds[vars], is.factor))
for (f in factores) levels(ds[[f]]) <- c()


# Eliminar los registros que no tienen valor a predecir
ds <- ds[!is.na(ds[target]), ]

# Si la tarea es clasificar, la variable target debe de ser categórica
ds[target] <- as.factor(ds[target])
inputs <- setdiff(vars, target)
nobs <- nrow(ds)
