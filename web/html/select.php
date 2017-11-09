<?php
 $con = new PDO('mysql:host=192.168.130.130;dbname=my_database;charset=utf8mb4', 'usuario', 'password');
 if (!$con)
   {
   die('Could not connect!');
   }
 echo "<br />";
 echo "Numero Curso  |  Nombre del Curso  |  Docente  |  Intensidad  |  Horario  |  Salon";
 echo "<br /><br />";

 foreach($con->query('SELECT * FROM curso') as $row) {
     echo $row['numero_curso'].'  |  '.$row['nombre_curso'].'  |  '.$row['profesor'].'  |  '.$row['intensidad'].'  |  '.$row['horario'].'  |  '.$row['salon'];
     echo "<br />";
 }
?>
