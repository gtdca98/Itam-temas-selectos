*Disclaimer*: Esta guía está pensada para correr desde MAC OS X (Mavericks) 

### Descarga del *dump* de Dbpedia

Se crea primero un directorio donde se van a recibir los datos. También se crea un directorio para poder descargar la información en paralelo.

```{bash}
mkdir -p ~/Dbpedia/Esp
cd ~/Dbpedia/Esp
cat urls | parallel curl -O
```

Una vez con los datos descargados podemos efectuar el siguiente código para descomprimir cada uno de los archivos
```{bash}
ls *.bz2 | parallel -j +0 --eta 'bzcat {}  > {.}'
```

### Preparar el ambiente para `Neo4j`

Para cargar la base `Neo4j` hay que primero preparar el ambiente `Java` para hacerlo. `Neo4j` y ejecutable de carga no son compatibles con la versión 1.6. Para esto hay que descargar la versión más reciente de `Java` de la página de Oracle. No interesa la version 1.7 jdk. Una vez instalada hay que checar en qué directorio se encuentra. Para esto ejecutamos el siguiente comenado en terminal

```bash
/usr/libexec/java_home -v 1.7
```
Con dicha ruta podemos crear la variable de ambiente `JAVA_HOME` y podemos configurar `Maven` para compilar los *scripts* de carga. Estos *scripts* se pueden descargar del siguiente repositorio de `Git`.

```bash
git clone https://github.com/oleiade/dbpedia4neo.git
cd dbpedia4neo
```

Dentro de la carpeta de `dbpedia4neo` hay que actualizar el `pom.xml`. Para esto todos las versiones TinkerPop Blueprints tienen que tener versión actualizada. Simplemente es cambiar las versiones de `0.6` a `0.9` o posterior en la sección de dependencias. Despúes hay que agregar en la lista de repositorios 

```xml
<repository>
  <id>sonatype-nexus-snapshots</id>
  <name>Sonatype Nexus Snapshots</name>
  <url>https://oss.sonatype.org/content/repositories/releases</url>
</repository>
```

Una vez listo el `pom` hay que actualizarlo vía `Maven`. (Recordemos que seguimos en la carpeta de `dbpedia4neo`). 

```bash
mvn clean install
```


### Referencias

http://stackoverflow.com/questions/12212015/how-to-setup-neo4j-with-dbpedia-ontop-of-ruby-on-rails-application
