Especificaciones
===============================

- Se montó un servidor Linux con las siguientes características
  - 8 GB RAM
  - 1 TB en disco
  - 1 procesador AMD
  - 6 cores
- Se accede via IP pública, para lo cual se redireccionaron los puertos del *router*.
- Instalaciones:
  - **Servidor Web Apache 2:** ...
  ~~~{bash}
  sudo apt-get install apache2
  ~~~
  - **MongoDB 2.4.9:** Base de datos orientada a documentos (JSON).
    - Importar llave pública de MongoDB
      ~~~~~{bash}
      sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
      ~~~~~
    - Crear el archivo descargable
      ~~~~{bash}
      echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee      /etc/apt/sources.list.d/mongodb.list
      ~~~~
    - Actualizar el repositorio de paquetes
      ~~~~{bash}
      sudo apt-get update
      ~~~~
    - Instalar el paquete
      ~~~~{bash}
      sudo apt-get install mongodb-10gen
      ~~~~
    - Iniciar o parar 
      ~~~~{bash}
      sudo service mongodb start
      sudo service mongodb stop
      ~~~~
    - Conectar con MongoDB 
      ~~~~{bash}
      mongo
      ~~~~
  - **R 3.0.2 y RStudio:** Lenguaje para hacer minería de textos y modelos de Machine Learning. Con el IDE en versión servidor
    - Añade al archivo `/etc/apt/sources.list file` la entrada 
      ~~~{bash}
      deb http://<tu.cran.favorito>/bin/linux/ubuntu saucy/
      ~~~
    - Instalación precompilada de R
      ~~~{bash}
      sudo apt-get update
      sudo apt-get install r-base r-base-dev r-recommended
      ~~~    
    - Instalación RStudio (server)
      ~~~{bash}
      sudo apt-get install gdebi-core
      sudo apt-get install libapparmor1  # Required only for Ubuntu, not Debian
      wget http://download2.rstudio.org/rstudio-server-0.98.501-amd64.deb
      sudo gdebi rstudio-server-0.98.501-amd64.deb
      ~~~
    - Para levantar el servicio
      ~~~{bash}
      sudo rstudio-server start
      ~~~

  - **Python 2.7**





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

