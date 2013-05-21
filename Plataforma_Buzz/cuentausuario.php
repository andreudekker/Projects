<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Buzz Online</title>
    <link rel="stylesheet" 	type="text/css" href="css/reset.css"  media="all"/>
    <link rel="stylesheet" 	type="text/css" href="css/text.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/960.css"    media="all"/>
    <link rel="stylesheet"  type="text/css" href="css/demo.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/CuentaUsuario.css" media="all" />
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
        		background-image: url(img/Buzz.png);
        		background-repeat:no-repeat;
             a:link { text-decoration:none; color:black }
		a:hover { text-decoration:underline; color:#FF0000; font-weight:bold}
		a:active { text-decoration:underline; color:white }
		a:visited { text-decoration:underline; color:#F60 }
			
			}
</style>
 <script type="text/javascript">
    $(function() {
             $('#galeria a').lightBox();
    });
	</script>
<?php
if (!isset($_SESSION)) {
  session_start();
}
$MM_authorizedUsers = "";
$MM_donotCheckaccess = "true";


function isAuthorized($strUsers, $strGroups, $UserName, $UserGroup) { 
 
  $isValid = False; 

  
  if (!empty($UserName)) { 
 
    $arrUsers = Explode(",", $strUsers); 
    $arrGroups = Explode(",", $strGroups); 
    if (in_array($UserName, $arrUsers)) { 
      $isValid = true; 
    } 

    if (in_array($UserGroup, $arrGroups)) { 
      $isValid = true; 
    } 
    if (($strUsers == "") && true) { 
      $isValid = true; 
    } 
  } 
  return $isValid; 
}

$MM_restrictGoTo = "noregistro.php";
if (!((isset($_SESSION['MM_Username'])) && (isAuthorized("",$MM_authorizedUsers, $_SESSION['MM_Username'], $_SESSION['MM_UserGroup'])))) {   
  $MM_qsChar = "?";
  $MM_referrer = $_SERVER['PHP_SELF'];
  if (strpos($MM_restrictGoTo, "?")) $MM_qsChar = "&";
  if (isset($_SERVER['QUERY_STRING']) && strlen($_SERVER['QUERY_STRING']) > 0) 
  $MM_referrer .= "?" . $_SERVER['QUERY_STRING'];
  $MM_restrictGoTo = $MM_restrictGoTo. $MM_qsChar . "accesscheck=" . urlencode($MM_referrer);
  header("Location: ". $MM_restrictGoTo); 
  exit;
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
  <div class="grid_6">
    <div class="clear"></div>
    <div class="grid_6">
      <div id="contenedor_login">
        <div id="Olvide">Descarga tu aplicacion movil para tu celular NOKIA</div>
        <div id="Usuario">
          <label for="textfield"></label>
          <div id="Botonir"><a href="Aplicacion/Buzz.wgz">descarga</a></div> 
        </div>
        <div id="IniciarSesion">Bienvenido,</div>
      </div>
    </div>
    <div class="clear"></div>
    <br/>
    <div class="grid_6">
      <div id="Contenido_buzz">
        <div id="textos">
          <div id="BarraNoticias">Noticias</div>
          <div id="lineaTextouno">Juega gratis</div>
          <div id="LineaTextodos">Descarga wallpapers por tu inscripcion</div>
          <div id="Lineatextotres">Version gratuita para tu movil (nokia)</div>
          <div id="LineaTextoCuatro">Todo esto y mucho mas tan solo  por registrarte : D        </div>
        </div>
        <div id="galeria">
      <div id="imagen1">
        <a href="img/image1.jpg"  title="Papel tapiz gratis Registrate!! "> <img src="img/thumb_image1.jpg" width="72" height="72" alt="peter Touch" />  </a>  <a href="img/image1.jpg">descarga</a>
        </div>
        <div id="imagen2">
         <a href="img/image2.jpg" title="Papel Tapiz Gratis.  Registrate!! ;"> <img src="img/thumb_image2.jpg" width="72" height="72" alt="Buzz" />  descarga</a>
     </div>
     
     <div id="imagen3">
  <a href="img/image3.jpg"  title="Papel tapiz gratis.  Registrate!! ;"> <img src="img/thumb_image3.jpg" alt="bu" width="72" height="72" align="absmiddle" />  descarga</a>  
  </div>     
       </div>
      </div>
    </div>
  </div>
  <div class="grid_6 push_1" >
    <div id="Contenedor_registro">
      <div id="registrate">Juega Buzz Online</div>
      <div id="Contenedor_fecha_BotonJugar">
        <form id="form1" name="form1" method="post" action="">
        </form>
        <div id="TerminosCondiciones">Al dar click registrarse y jugar, Usted<br />
          esta indicando  que leyo y esta de acuerdo <br />
        con los terminos de servicio  de este software <a href="TerminosyC.php">(+)terminos Condiciones</a></div>
<div id="jugar_ahora">
  <div id="JugarahoraTitulo"><a href="juego.php">Jugar Ahora</a></div>
</div>
      </div>
    </div>
  </div>
  <div class="clear"></div>
  <br/>
  <div class="grid_12">
   
    <p id="menufinal"><div style="background-color:#cccccc; text-align:center; opacity:50%; 
	-moz-opacity:50%;
    background-color: rgb(100, 100, 100);  
    background-color: rgba(100, 100, 100, .75);
    width:850px;
	
	
	">
<p><a href="index.php">inicio</a> | <a href="juego.php">juego</a> | <a href="olvidocontrasena.php">olvido contraseña</a> 

        | <a href="TerminosyC.php">Terminosycondiciones</a> | </p>

      

        
</div>
  </div>

   
   
    <p id="footer">Todos los derechos reservados © Ideas4ever 2012  :: Bogotá D.C, Colombia </p>
  </div>
</div>
</body>
</div>
</html>
