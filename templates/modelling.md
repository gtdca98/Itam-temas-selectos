Proceso de Construcción de Modelos
========================================================

Los pasos para construir un modelo son:

1. Cargar los datos limpios
2. Dividir en test y train el ds
3. Entrenar un modelo  (usar cross-validation, o repetir varias veces el sampleo)
4. Evaluar
5. Guardar el modelo
6. Comparar con otros modelos

Este último paso quizá se tenga que hacer en otro archivo


```r

# Modelos a probar (si el ds es muy grande, dividir en archivos)
library(rpart)
...
library(randomForest)

# Para evaluación
library(ROCR)
library(pROC)
# Para gráficas de evaluación 
library(rattle)

ds <- readRDS("-clean.rds")
load("metadata")

form <- formula(paste(target, "~ .")) # Todas las variables  
# Si hay que hacer feature selection o engineering, hacerlo en otro archivo


# Los siguientes pasos quizá deban de ejecutarse varias veces y obtener un promedio
# Habrá que modificar el código para esto

seed <- sample(1:1000000, 1)
seed
set.seed(seed)

# Conjunto de datos
# Si los conjuntos son grandes, procesar y samplear  en la BD o usar dplyr conectado a la base de datos
train <- sample(nobs, 0.7*nobs)
test <- setdiff(seq_len(nobs), train)
actual <- ds[test, target]

# Modelo
params.control <- c()
m <- # Invocación del modelo
tipo.modelo <- ""  # Nombre del modelo: rpart, randomForest. svm
model <- m

# Revisar el modelo

# Evaluar el modelo


classes <- predict(model, ds[test, vars], type="class")
# Matriz de confusión
round(table(actual, classes, dnn=c("Actual", "Predicted"))/length(actual), 2)

# Accuracy
(acc <- sum(classes == actual, na.rm=TRUE)/length(actual))

# Error rate
(err <- sum(classes != actual, na.rm=TRUE)/length(actual))

# ROC
predicted <- predict(model, ds[test, vars], type="prob")[,2]
pred <- prediction(predicted, ds[test, target])
(ate <- attr(performance(pred, "auc"), "y.values")[[1]])

riskchart(predicted, actual, risks)
psfchart(predicted, actual)


# Guardar el modelo
dir_name <- "models"
if (! file.exists(dir_name)) dir.create(dir_name)
time.stamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
fstem <- paste(dsname, mtype, time.stamp, sep="_")
(file_name <- file.path(dname, sprintf("%s.RData", fstem)))

save(ds, dsname, vars, target, risk, inputs, ignore, form, nobs, seed, train, test, model, mtype, pr, 
     file=fname)

```

