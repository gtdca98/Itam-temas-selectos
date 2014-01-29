Espionaje histórico
========================================================
- Proponente: Adolfo De Unánue
- Author: Gabriel del Campo, Alfredo Garbuno, JI García
- Avances: 29 de Enero, 2014

Tres direcciones de avance
========================================================
- ¿Cómo está estructurada la DBpedia?
- ¿Cómo podemos trabajar localmente?
- ¿Cómo podemos aprovechar ofertas IaaS?

Recursos IaaS
========================================================
* **Amazon Web Services (AWS)**: Amazon es _host_ de cuatro datasets públicos relacionados con el proyecto. En [esta liga](http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtAWSDBpedia38) se describe cómo configurar una máquina virtual que accese los datos de DBpedia residentes en AWS.

  * [Wikipedia XML (wikipedia puro)](http://aws.amazon.com/datasets/2506)
  * [Wikipedia WEX (wikipedia procesado, sólo inglés)](http://aws.amazon.com/datasets/2345)
  * [DBpedia](http://aws.amazon.com/datasets/2319)
  * [Freebase](http://aws.amazon.com/datasets/2320)

* Todos los archivos tienen una antigüedad mayor a 3 años. Si bien esto quita actualidad al modelo, también abre una ventana de tiempo para validar pronósticos. 

* **Google Cloud Platform (GCE)**: En el 2010 Google adquirió Freebase, una base de conocimiento en parte derivada de Wikipedia. Tiene APIs e integración con GCE, según se puede comprobar en [este ejemplo](https://www.youtube.com/watch?v=se9vV8eIZME), donde configuran un cluster Hadoop en GCE para calcular frecuencias de términos en Freebase. Los resultados se obtienen en minutos. 
* Existen protocolos (como MQL) para consultar redes de asociaciones de personajes en Freebase.  

Consulta MQL (ejemplo)
========================================================
`{
  "*": null,
  "name": "Jimi Hendrix",
  "type": "/music/artist"
}`

[Resultados](http://tinyurl.com/bg7xclc)

Precios
========================================================


IaaS    | Consumo mínimo | Modalidad de cobro | Tipo de sistema | Precio (US$ x hr) 
--------| -------------- | ------------------ | --------------- |------------------
**AWS** | ninguno        | x hora (rha)       | (4 núcleos, 15 GB) - (16 núcleos, 122 GB) | $0.480 - $3.410
**GCE** | 10 minutos     | x minuto (rha)     | (2 núcleos, 13 GB) - (16 núcleos, 104 GB) | $0.244 - $1.951
rha=fracciones redondean hacia arriba

* En ambos casos aplican cobros adicionales.
* AWS ofrece una variedad de configuraciones más amplia que va desde máquinas virtuales de un solo núcleo con menos de 1GB de RAM ($0.02 x hr) hasta máquinas con 32 núcleos y 224GB ($6.820 x hr). Los rangos de arriba ofrecen una comparación más informativa con GCE. 


