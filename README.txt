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


