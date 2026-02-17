PRÁCTICA 1 29-01-2026

Hemos utilizado comandos básicos en el terminal WSL para crear la carptea del cuaderno "bioinf" y su estructura, además hemos usado comandos como cd, cp, mv y rm para moverse entre directorios y mover 
archivos o directorios, copiarlos a otras carpetas o eiminarlos.

Adicionalmente los objetivos eran usar WATER (local) y NEEDLE (global) para alinear 2 secuencias. Se ha realizado a 04/02/2026, se ha obtenido un primer alineamiento con needle del fragmento del 
cromosoma 17 humano con el gen humano SMARCD2, luego se ha hecho ese mismo alineamiento pero usando Water, un alineamiento local mas correcto para este caso, después se utilizó de nuevo water para 
alinear el mismo fragmento de cromosoma (esta vez de chimpancé) con su gen correspondiente (de chimpancé), por último se han alineado ambos cromosomas (humano y chimpancé) con needle, ya que en este 
caso un alineamiento global sí que tenía sentido.

También se ha tratado de alinear el mismo DNA (solo el caso de gen humano SMARCD2 y el fragmento del chr 17 sin intrones mediante EXONERATE, en él se ha utilizado ">" para obtener un ouput en formato 
archivo y no un print.

Finalmente, para alineamientos con mutliples secuencias se usa popularmente MUSCLE, una vez hecho el alineamiento se puede mostrar si en R pasamos el archivo a un HTML


PRÁCTICA 2 03-02-2026

Primero se ha creado una carpeta .git en el directorio principal de bioinf que se encargará de tomar nota de los estados de la carpeta de trabajo durante todas las prácticas, git add … añade los 
archivos y los prepara para ser guardados, después con git commit -m "..." se confirma todo lo que se ha añadido en git add y además hay que añadir entre las comillas un mensaje que describa lo que 
estas modificando y guardando.

Se puede también crear un archivo .gitignore donde se deben poner en cada linea de texto los archivos que se quiere que GIT ignore, además se puede acceder a él en el terminal mediante nano .gitignore, 
modificarlo y salir con "ctrl x".

Luego se creó un repositorio en GITHUB, se crearon las dos claves SSH, y finalmente se relacionaron los repositorios local (portátil) y remoto (GitHub) para poder actualizarlos en cada práctica.


PRÁCTICA 3 10-02-2026

Primero descargamos mediante wget las lecturas y el genoma de referencia de la práctica, para leer archivos comprimidos usamos "gunzip", "less" y "wc". Los archivos "DRR025089_1.fastq.gz" y 
"DRR025089_2.fastq.gz" tienen un total de 1646728 líneas, cada secuencia está compuesta por 4 lineas. El archivo del genoma de referencia tiene 167052 lineas, pero son solo 3 secuencias, cada secuencia 
está iniciada por un ">". 

Luego, mediante "fastp" se hace un control de calidad, las opciones -i, -o, -I, -O sirven para introducir los archivos de INPUT (las lecturas) y OUTPUT (archivos fastq con el control hecho), y -merge y 
-mergeout sirven para activar el modo merge, que une las dos lecturas si estan superpuestas, y da un control de calidad como output. 

Además de los archivos ".fastq" el programa da como output un archivo html que en el cual hay redactado un informe, en ese informe se da información de longitud de secuencia, calidad general de las 
secuencias, las lecturas totales, porcentaje de GC, en general da un montón de información de la secuencia y de las lecturas antes y después de un "filtro" que hará el programa fastq. 


PRÁCTICA 4 17-02-2026

Habiendo descargado los paquetes necesarios y los archivos datasets y dataformats de NCBI (https://www.ncbi.nlm.nih.gov/datasets/docs/v2/command-line-tools/download-and-install/), queremos descargar un 
genoma de referencia de cualquier especie de un género, en este caso de Trypanosoma, para ello primero accedemos a una tabla que nos da todas las opciones disponibles, R nos permite ejecutar un código 
que nos da una tabla en HTML con las opciones disponibles. En esa tabla las líneas 7 y 8 se diferencian únicamente en el nombre, la 7 contiene "GCF_003719485.1" mientras que la octava es 
"GCA_003719485.1". Para asegurarse, se ven cuantos duplicados hay con "duplicated()", se concluye que no hay ninguna fila duplicada.

Una vez se tiene esa tabla podemos ordenarla por cualquier columna que queramos en orden ascendente con order(), en este caso se ordena por la fecha de lanzamiento de la secuencia. Por otra parte se 
puede hacer que R lea una determinada columna como "fecha" en lugar de como un texto, para ello se utiliza as.Date(), y una vez hecho esto ya se puede crear una tabla o una grafica que tome esos 
valores de fecha como un numero y no una linea de texto.

Una vez decidida la secuencia que se va a instalar se hace en el terminal mediante los archivos datasets anteriores, se descargará un zip que debemos descomprimir con zless o gunzip. La carpeta 
contiene un archivo JSON y un jsonlines, el segundo contiene la información del primero en una sola línea, esto agiliza el análisis de los datos.

Ya descargados los datos, podemos leerlos en una tabla con read.table(), algo importante en esta función es el argumento "quote" en el que se le puede decir a la función que va a utilizar como 
separador de columnas, ahí debe haber un tabulador, de la siguiente manera "quote = ' '" o "quote = '\t'". Con el dataframe del genoma podemos jugar para ver que solo hay 5 valores de la variable type, 
crear 5 objetos, uno para cada valor, que serán dataframes con los datos solo de ese valor, en ellos podemos escoger los valores que se repiten continuamente en las filas y eliminarlos.
