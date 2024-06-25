# Zapateria
Proyecto de Zapateria, proyecto para una zapateria.

# Instalación
* Clonar repositorio en una carpeta en htdocs o www segun el servidor web
* Instalar composer [https://getcomposer.org]
* Instalar las dependencias en la misma carpeta donde esta composer.json <code>php composer.phar install</code> <code>composer install</code>
* Copiar el archivo <code>renameTo_parameters.env</code> a <code>parameters.env</code> y actualizar los valores segun sus parámetros
* En un navegar ir al proyecto con <code>index.php?page=index</code>
* Para generar

# Pasos
1. Crear en <code>src>Controllers</code> dos archivos de <code>Entidad.php</code> extendiento la clase de <code>PublicController</code>

2. Crear en la carpeta <code>src>Views</code> dos archivos de <code>Entidad.view.tpl</code>

3. Crear en la carpeta <code>src>Dao</code> un archivo <code>Entidad.php</code> que extienda la clase <code>Table.php</code> donde elaborará la manipulación de la tabla.
