Servidor
===============================

- Se montó un servidor Linux con las siguientes características
  - 8 GB RAM
  - 1 TB en disco
  - 1 procesador AMD
  - 6 cores
- Se accede via IP pública, para lo cual se redireccionaron los puertos del *router*  





Conexión R - Mongo [Ubuntu]
=================================================




Ejemplo de juguete en Mongo
-----------------------------------------------
Ejecutar este script en Python para empezar a jugar con Mongo
~~~{python}
if __name__ == "__main__":
  con = Connection()
else:
  print "Conexión no exitosa"
db = con.db_pba
coleccion = db.coleccion
coleccion.insert({"nombre":"David","color":"rojo"})
coleccion.insert({"nombre":"Kael","color":"verde","equipo":"cruz azul"})
coleccion.insert({"nombre":"Marcos","color":"azul"})
coleccion.insert({"nombre":"Antonio","color":"negro","cal":7,"equipo":"america"})
prueba = coleccion.find()
for pba in prueba:
print pba
~~~


Librerías de R
------------------------------------------------------------------------------

Para instalar la librería de RMongo se requiere rJava, desde terminal ejecutar lo siguiente
~~~
$sudo apt-get install "openjdk-7-*"
$sudo R CMD javareconf
~~~
Fuente: http://stackoverflow.com/questions/16438073/unable-to-install-rjava-in-r-3-0-in-ubuntu-13-04


Después en R
~~~
>install.packages("rJava")
>install.packages("RMongo")

