<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Buzz Online</title>
    <link rel="stylesheet" 	type="text/css" href="css/reset.css"  media="all"/>
    <link rel="stylesheet" 	type="text/css" href="css/text.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/960.css"    media="all"/>
    <link rel="stylesheet"  type="text/css" href="css/demo.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/Olvidocontrasena.css" media="all" />
    <link rel="stylesheet" 	type="text/css" href="css/jquery.lightbox-0.5.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/fuentes.css" media="all"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
    <script type="text/javascript">
    $(function() {
            $("#imagen1").lightBox(); 	
            $("#imagen2").lightBox();
            $("#imagen3").lightBox();
    });
	</script>
<style type="text/css">
    	body {
        		background-image: url(img/buzz.png);
        		background-repeat:no-repeat;
            	background-position:center top;
			}



</style>

<?php
function genera_clave(){
	$arreglo=array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
	$llave="";
	for($i=0;$i<=25;$i++){
	$numero=rand(0,25);
	$letra=$arreglo[$numero];
	if(rand(0,25)%2==0){
	    $letra=strtoupper($letra);
	}
	$llave.=$letra;
	}
   return $llave;
}


?>
</head>

<body>
<div id="page">
<div class="container_12" > 
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  <div class="grid_12">
   
  </div>
  <div class="clear"></div>
    <div class="clear"></div>
    <div class="grid_9" align="right">
      <div id="contenedor_login">
      <div id="contenido">
     <form action="" method="post">
     
<table width="400" border="1" align="center">
  <tr>
    <td colspan="3">He olvidado mi contraseña.<br>
      Para restablecer tu contraseña, introduce el nombre de usuario que utilices para iniciar sesión en Google. Puede ser tu dirección de Gmail u otra dirección de correo electrónico que hayas asociado a tu cuenta.
     </td>
  </tr>
  <tr>
    <td>Correo</td>
    <td><label for="textfield"></label>
    <input type="text" name="textfield" id="textfield"></td>
    <td><input type="submit" name="button" id="button" value="Enviar"></td>
  </tr>
</table>


     
     
     </form>
     
        
        
        
       
      </div>
    </div>
    <div class="clear"></div>
    <br/>
    
  <div class="clear"></div>
  <br/>
  <div class="grid_12">
    <p id="footer">Todos los derechos reservados © Ideas4ever 2012  :: Bogotá D.C, Colombia </p>
  </div>
</div>
</body>
</div>
</html>
