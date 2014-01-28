Enchúlame el Zeitgeist 
========================================================
- **Equipo:** Kael Huerta | Marcos Chávez | David Lampón
- **Objetivo:** Determinar la relación entre los *trending topics* de Twitter y las búsquedas de Google contextualizadas con gráficos en una aplicación web.
- **Hipótesis:** Las búsquedas de Google complementan los *trending topics* dada una relación lineal de ocurrencia de eventos desfasada en el tiempo.


Maqueta de visualización
-------------------------------------------------------
![maqueta] (https://www.dropbox.com/s/j2bw8zessmcfvv0/maqueta.pdf)

Descripción de las fuentes de datos
--------------------------------------------------------
- **Twitter** https://dev.twitter.com/docs/api/1.1
*Trends*
With so many tweets from so many users, themes are bound to arise from the zeitgeist. The Trends methods allow you to explore what's trending on Twitter.

	 
**Resource:** GET trends/place	 
**Description:** Returns the top 10 trending topics for a specific WOEID, if trending information is available for it. The response is an array of "trend" objects that encode the name of the trending topic, the query parameter that can be used to search for the topic on Twitter Search, and the Twitter Search URL....

**Resource:** GET trends/available	 
**Description:** Returns the locations that Twitter has trending topic information for. The response is an array of "locations" that encode the location's WOEID and some other human-readable information such as a canonical name and country the location belongs in. A WOEID is a Yahoo! Where On Earth ID.

**Resource:** GET trends/closest	 
**Description:** Returns the locations that Twitter has trending topic information for, closest to a specified location. The response is an array of "locations" that encode the location's WOEID and some other human-readable information such as a canonical name and country the location belongs in. A WOEID is a Yahoo... 

- **Google Web Search** https://developers.google.com/web-search/

The API consists of JavaScript and associated service protocols that enable You to display results from Google searches, including text and URL results from Google Web Search and results from searches on other Google services ("Google Search Results") on your website, in your application, or in your other product expressly authorized in writing by Google (each, a "Property"), subject to the limitations and conditions described below. You are allowed to use the API only to display, and to make such uses as are necessary for You to display, Google Search Results on your Property. The API does not provide You with the ability to access, and You are not allowed to access, other underlying Google Services or data. Subject to the limitations and conditions described below, You may use the API to enable end users of your Property to designate Google Search Results for You to display in conjunction with other information that they upload or post to your Property. 

- **Google Image Search API** https://developers.google.com/image-search/

The Google Image Search JavaScript API is a JavaScript library that allows you to embed Google Image Search in your web pages and other web applications. For Flash, and other non-JavaScript environments, the API exposes a raw interface that returns JSON-encoded results that are easily processed by most languages and runtimes.

Prototipo de arquitectura
-------------------------------------------------------
![maqueta] (https://www.dropbox.com/s/j2bw8zessmcfvv0/maqueta.pdf)

Base de datos orientada a documentos (MongoDB)
-------------------------------------------------------
Instalación:

- Importar llave pública de MongoDB
~~~~~
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
~~~~~

- Crear el archivo descargable
~~~~
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
~~~~

- Actualizar el repositorio de paquetes
~~~~
sudo apt-get update
~~~~

- Instalar el paquete
~~~~
sudo apt-get install mongodb-10gen
~~~~

- Iniciar o parar
~~~~
sudo service mongodb start
sudo service mongodb stop
~~~~

- Conectar con MongoDB 
~~~~
mongo
~~~~
