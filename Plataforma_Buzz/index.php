<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Buzz Online</title>
    <link rel="stylesheet" 	type="text/css" href="css/reset.css"  media="all"/>
    <link rel="stylesheet" 	type="text/css" href="css/text.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/960.css"    media="all"/>
    <link rel="stylesheet"  type="text/css" href="css/demo.css"   media="all" />
    <link rel="stylesheet"  type="text/css" href="css/estiloCss.css" media="all" />
    <link rel="stylesheet" 	type="text/css" href="css/jquery.lightbox-0.5.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/fuentes.css" media="all"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
    <script type="text/javascript">
    $(function() {
             $('#galeria a').lightBox();
    });
	</script>
		<style type="text/css">
    	body {
        		background-image: url(img/BuzzFinal2.png);
				background-position:center top;
        		background-repeat:no-repeat;
             }
		
        a:link { text-decoration:none; color:black }
		a:hover { text-decoration:underline; color:#FF0000; font-weight:bold}
		a:active { text-decoration:underline; color:white }
		a:visited { text-decoration:underline; color:#F60 }
        
        </style>

		<script type="text/javascript">

function validar (forma)

{
	error=0;
msg="";
	if(forma.Usuario.value=="")
	{
		msg=msg+"Digite un usuario.//";
		error=1;
	}
      if (forma.Clave.value =="")
	  {
		  msg=msg+"Digite una clave";
		  error=1;
	  }
	if(error ==0) 
	{
		return true;
	}
	else
	{
		alert (msg); return false;
	}
}
</script>		
		<script type="text/javascript">
		function limpia(elemento){
			elemento.value="";
			}
         function verifica(elemento){
			 
			if (elemento.value)
			elemento.value="usuario";
			 }
        </script>
		
		<?php require_once('Connections/userconect.php'); ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "formulario1")) {
  $insertSQL = sprintf("INSERT INTO usuarios (Usuario, Clave) VALUES (%s, %s)",
                       GetSQLValueString($_POST['Usuario'], "text"),
                       GetSQLValueString($_POST['Clave'], "text"));

  mysql_select_db($database_userconect, $userconect);
  $Result1 = mysql_query($insertSQL, $userconect) or die(mysql_error());

  $insertGoTo = "index.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}
if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
  $insertSQL = sprintf("INSERT INTO usuarios (Usuario, Clave, Correo) VALUES (%s, %s, %s)",
                       GetSQLValueString($_POST['Usuario'], "text"),
                       GetSQLValueString($_POST['Clave'], "text"),
                       GetSQLValueString($_POST['Correo'], "text"));

  mysql_select_db($database_userconect, $userconect);
  $Result1 = mysql_query($insertSQL, $userconect) or die(mysql_error());

  $insertGoTo = "index.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}
?>



<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}
?>
<?php

if (!isset($_SESSION)) {
  session_start();
}

$loginFormAction = $_SERVER['PHP_SELF'];
if (isset($_GET['accesscheck'])) {
  $_SESSION['PrevUrl'] = $_GET['accesscheck'];
}

if (isset($_POST['Usuario'])) {
  $loginUsername=$_POST['Usuario'];
  $password=$_POST['Clave'];
  $MM_fldUserAuthorization = "";
  $MM_redirectLoginSuccess = "cuentausuario.php";
  $MM_redirectLoginFailed = "noregistro.php";
  $MM_redirecttoReferrer = false;
  mysql_select_db($database_userconect, $userconect);
  
  $LoginRS__query=sprintf("SELECT Usuario, Clave FROM usuarios WHERE Usuario=%s AND Clave=%s",
    GetSQLValueString($loginUsername, "text"), GetSQLValueString($password, "text")); 
   
  $LoginRS = mysql_query($LoginRS__query, $userconect) or die(mysql_error());
  $loginFoundUser = mysql_num_rows($LoginRS);
  if ($loginFoundUser) {
     $loginStrGroup = "";
    
	if (PHP_VERSION >= 5.1) {session_regenerate_id(true);} else {session_regenerate_id();}
   
    $_SESSION['MM_Username'] = $loginUsername;
    $_SESSION['MM_UserGroup'] = $loginStrGroup;	      

    if (isset($_SESSION['PrevUrl']) && false) {
      $MM_redirectLoginSuccess = $_SESSION['PrevUrl'];	
    }
    header("Location: " . $MM_redirectLoginSuccess );
  }
  else {
    header("Location: ". $MM_redirectLoginFailed );
  }
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
    
        <form name="formulario1" action="<?php echo $loginFormAction; ?>" method="POST" onsubmit="return validar(this)">
       
        	<div id="Usuario1">
         	 <label for="Usuario"></label>
          	<input type="text" name="Usuario" id="Usuario" value="usuario"  >
          <div id="Clave1">
            <label for="Clave"></label>
            <input type="password" name="Clave" id="Clave" value="contrasena" >
          </div>
          <div id="Botonir"><input type="submit" name="button" id="button"  class="Botonir" value="Enviar"></div>
          </div>
        <div id="IniciarSesion">Iniciar Sesion</div>
        <div id="Olvidemiclave"><a href="olvidocontrasena.php">Olvide mi clave</a></div>
        <input type="hidden" name="MM_insert" value="formulario1">
     </form> 
     
     
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
          <div id="LineaTextoCuatro">Todo esto y mucho mas tan solo  por registrarte : D  </div>
        </div>
        <div id="galeria">
      <div id="imagen1">
        <a href="img/image1.jpg"  title="Papel tapiz gratis Registrate!! "> <img src="img/thumb_image1.jpg" width="72" height="72" alt="peter Touch" /> </a>
        </div>
        <div id="imagen2">
         <a href="img/image2.jpg" title="Papel Tapiz Gratis.  Registrate!! ;"> <img src="img/thumb_image2.jpg" width="72" height="72" alt="Buzz" /> </a>
     </div>
     
     <div id="imagen3">
  <a href="img/image3.jpg"  title="Papel tapiz gratis.  Registrate!! ;"> <img src="img/thumb_image3.jpg" alt="bu" width="72" height="72" align="absmiddle" /> </a>       
       </div>
       
        
      	
        
        </div>
      </div>
    </div>
  </div>
  <div class="grid_6 push_1" >
    <div id="Contenedor_registro">
      <div id="registrate">Registrate      </div>
      <div id="Contenedor_fecha_BotonJugar">
       
       
        <form id="form1" name="form1" onsubmit="return validar(this)" method="post" action="<?php echo $editFormAction; ?>">
          <div id="Usuario_reg">
            <label for="textfield2"></label>
            <input type="text" name="Usuario" id="textfield2" value="Usuario" />
          </div>
       
        <div id="TerminosCondiciones">Al dar click registrarse y jugar, Usted<br />
          esta indicando  que leyo y esta de acuerdo <br />
        con los terminos de servicio  de este software <a href="TerminosyC.php">(+)terminos Condiciones</a></div>
		<div id="jugar_ahora">
 		 <div id="JugarahoraTitulo"><a href="juego.php">Jugar Ahora</a></div>
		</div>
        <div id="Contenedor_reg">
        <input name="enviar" type="submit" id="enviar" value="Crear una cuenta" class="Contenedor_reg">
        </div>
        
        <div id="clave_r">
          <label for="textfield4"></label>
          <input type="text" name="Correo" id="textfield4"  value="Correo" ">
        </div>
        <div id="correo">
          <label for="textfield3"></label>
          <input type="password" name="Clave" id="textfield3" value="Contraseña" />
            <input type="hidden" name="MM_insert" value="form1">
       </form>
      
      
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


  <div class="grid_12">
    <p id="footer">Todos los derechos reservados © Ideas4ever 2012  :: Bogotá D.C, Colombia </p>
  </div>
</div>
</body>
</div>
</html>
