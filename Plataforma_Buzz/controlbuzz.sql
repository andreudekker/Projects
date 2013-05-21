-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-03-2012 a las 08:53:43
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `controlbuzz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `Idadmin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usuarioa` varchar(10) NOT NULL,
  `Clave` varchar(10) NOT NULL,
  `Rol` varchar(10) NOT NULL,
  PRIMARY KEY (`Idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `Idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(10) NOT NULL,
  `Clave` varchar(10) NOT NULL,
  `Correo` varchar(10) NOT NULL,
  `Rol` varchar(5) NOT NULL,
  PRIMARY KEY (`Idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Idusuario`, `Usuario`, `Clave`, `Correo`, `Rol`) VALUES
(4, 'andres', '123', 'andres@hot', 'admin'),
(5, 'daniel', '963', 'daniel@hot', 'usu'),
(6, 'catalina', '741', 'catalina@h', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
