package com.nexos
{
	import com.nexos.Nube;

	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.text.AntiAliasType;
	import flash.system.fscommand;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class Nexos3 extends MovieClip
	{
		var textoCarpeta:String = "imagenes/";
		var textoTipo:String = "tipo";
		var textoImagen:String = "imagen";
		var textoExtension:String = ".jpg";

		var numero:Number = 0;
		var urlReq:URLRequest;
		var loadNube:Loader = new Loader();
		var loadImagen:Loader = new Loader();
		var numeroTipo:Number = 0;
		var urlImagen:String;
		var tipoNube:Number;
		var seleccionado:Boolean = false;

		var numeroTipos:Number = 24;
		var numeroImagenes:Number = 5;

		var numeroNubes:Number = 0;
		var tiposNivel:Number = 0;
		var imagenesNivel:Number = 0;
		var numeroFilas:Number = 0;
		var numeroColumnas:Number = 0;
		var escalaNivel:Number = 0;

		var anchoTotal:Number = 800;
		var alturaTotal:Number = 600;
		var espacioX:Number = 0;
		var espacioY:Number = 0;
		var espacioAlrededorX:Number = 100;
		var espacioAlrededorY:Number = 150;

		var listaNubes:Array = new Array();
		var listaTipos:Array = new Array();
		var listaImagenes:Array = new Array();
		var listaDirecciones:Array = new Array();

		var tipo:Number;
		var imagen:Number;

		var seleccion:Number;
		var antiguaSeleccion:Number;
		var dosAntiguaSeleccion:Number;
		var tresAntiguaSeleccion:Number;
		var cuatroAntiguaSeleccion:Number;

		var primerTipo:Number = 0;
		var segundoTipo:Number = 0;
		var tercerTipo:Number = 0;
		var cuartoTipo:Number = 0;
		var quintoTipo:Number = 0;

		var tiempoMostrar = 3000;
		var espacioTiempo:Timer = new Timer(tiempoMostrar,1);
		var espacioTiempoDos:Timer = new Timer(tiempoMostrar,1);
		var espacioTiempoTres:Timer = new Timer(tiempoMostrar,1);
		var espacioTiempoCuatro:Timer = new Timer(tiempoMostrar,1);

		var fuentePrincipal:Font = new FuentePrincipal();
		var fuenteSecundaria:Font = new FuenteSecundaria();

		var formatoPuntaje:TextFormat = new TextFormat();
		var formatoNombres:TextFormat = new TextFormat();

		var textoJugador1:TextField = new TextField();
		var textoJugador2:TextField = new TextField();
		var textoTitulo:TextField = new TextField();
		var turnoJugador:TextField = new TextField();
		var textoVictoria:TextField = new TextField();

		var numeroJugadores:Number = 2;
		var jugadorActual:Number = 1;
		var parejasJugador1:Number = 0;
		var parejasJugador2:Number = 0;
		var tiposIguales:Number = 0;
		var contadorIguales:Number = 0;

		var nivelActual:Number = 1;

		var botonSon:Sound = new BotonSonido();
		var botonChannel:SoundChannel = new SoundChannel();

		var nubeSon:Sound = new NubeSonido();
		var nubeChannel:SoundChannel = new SoundChannel();

		var inicioSon:Sound = new InicioSonido();
		var inicioChannel:SoundChannel = new SoundChannel();

		var vueltaSon:Sound = new VueltaSonido();
		var vueltaChannel:SoundChannel = new SoundChannel();

		public function Nexos3()
		{
			inicioChannel = inicioSon.play();
			inicioChannel.addEventListener(Event.SOUND_COMPLETE,sonidoInicio);
			function sonidoInicio(evento:Event)
			{
				inicioChannel = inicioSon.play();
			}
			btnJugar.addEventListener(MouseEvent.CLICK,irSeleccion);
			btnSalir.addEventListener(MouseEvent.CLICK,salir);

			espacioTiempo.addEventListener(TimerEvent.TIMER,esperarTiempo);
		}

		public function irSeleccion(evento:MouseEvent)
		{
			gotoAndPlay("SeleccionJugadores");

			botonChannel = botonSon.play();

			btnJugadores1.addEventListener(MouseEvent.CLICK,unJugador);
			btnJugadores2.addEventListener(MouseEvent.CLICK,dosJugadores);

			function unJugador()
			{
				botonChannel = botonSon.play();
				numeroJugadores = 1;
				mostrarHistoria();
			}

			function dosJugadores()
			{
				botonChannel = botonSon.play();
				numeroJugadores = 2;
				mostrarHistoria();
			}
		}

		public function nivelUno()
		{
			numeroNubes = 10;
			tiposNivel = 5;
			imagenesNivel = 2;
			numeroFilas = 3;
			numeroColumnas = 4;
			escalaNivel = 0.20;
		}

		public function nivelDos()
		{
			numeroNubes = 15;
			tiposNivel = 5;
			imagenesNivel = 3;
			numeroFilas = 4;
			numeroColumnas = 4;
			escalaNivel = 0.15;
		}

		public function nivelTres()
		{
			numeroNubes = 20;
			tiposNivel = 5;
			imagenesNivel = 4;
			numeroFilas = 5;
			numeroColumnas = 4;
			escalaNivel = 0.12;
		}

		public function nivelCuatro()
		{
			numeroNubes = 25;
			tiposNivel = 5;
			imagenesNivel = 5;
			numeroFilas = 5;
			numeroColumnas = 5;
			escalaNivel = 0.15;
		}

		public function mostrarHistoria()
		{
			textoVictoria.visible = false;
			switch (nivelActual)
			{
				case 1 :
					gotoAndPlay("Historia1");
					break;
				case 2 :
					gotoAndPlay("Historia2");
					break;
				case 3 :
					gotoAndPlay("Historia3");
					break;
				case 4 :
					gotoAndPlay("Historia4");
					break;
				case 5 :
					gotoAndPlay("Historia1");
					nivelActual = 1;
					break;
			}

			btnContinuar.addEventListener(MouseEvent.CLICK,irJuego);
		}

		public function irJuego(evento:MouseEvent)
		{
			botonChannel = botonSon.play();

			textoTitulo.visible = true;
			textoJugador1.visible = true;
			textoJugador2.visible = true;
			turnoJugador.visible = true;
			textoVictoria.visible = false;

			gotoAndStop("Juego");

			juego();
		}

		public function salir(evento:MouseEvent)
		{
			fscommand("quit");
		}

		public function juego()
		{
			inicioChannel.stop();

			switch (nivelActual)
			{
				case 1 :
					nivelUno();
					break;

				case 2 :
					nivelDos();
					break;

				case 3 :
					nivelTres();
					break;

				case 4 :
					nivelCuatro();
					break;
			}

			generarNubes();
			desordenarNubes();
			generarArrays();
			desordenarTipos();
			desordenarImagenes();
			crearDirecciones();
			unirNubesDirecciones();
			generarTexto();
		}

		public function generarTexto()
		{
			formatoPuntaje.size = 30;
			formatoPuntaje.color = 0xFFFFFF;
			formatoPuntaje.font = fuentePrincipal.fontName;
			formatoPuntaje.align = "center";

			formatoNombres.size = 30;
			formatoNombres.color = 0xFFFFFF;
			formatoNombres.font = fuenteSecundaria.fontName;
			formatoNombres.align = "center";

			textoTitulo.defaultTextFormat = formatoPuntaje;
			textoTitulo.text = "NEXOS";
			textoTitulo.width = anchoTotal;
			textoTitulo.height = 40;
			textoTitulo.x = 0;
			textoTitulo.y = 10;
			textoTitulo.embedFonts = true;
			textoTitulo.antiAliasType = AntiAliasType.ADVANCED;

			textoJugador1.defaultTextFormat = formatoNombres;
			textoJugador1.text = "JUGADOR 1... " + parejasJugador1;
			textoJugador1.width = 300;
			textoJugador1.height = 40;
			textoJugador1.embedFonts = true;
			textoJugador1.antiAliasType = AntiAliasType.ADVANCED;

			textoJugador2.defaultTextFormat = formatoNombres;
			textoJugador2.text = "JUGADOR 2... " + parejasJugador2;
			textoJugador2.width = 300;
			textoJugador2.height = 40;
			textoJugador2.embedFonts = true;
			textoJugador2.antiAliasType = AntiAliasType.ADVANCED;

			turnoJugador.defaultTextFormat = formatoNombres;
			turnoJugador.width = anchoTotal / 2;
			turnoJugador.height = 80;
			turnoJugador.x = anchoTotal / 2;
			turnoJugador.y = alturaTotal - (espacioAlrededorY / 2);
			turnoJugador.text = "TURNO DEL JUGADOR " + jugadorActual;
			turnoJugador.embedFonts = true;
			turnoJugador.antiAliasType = AntiAliasType.ADVANCED;

			textoVictoria.defaultTextFormat = formatoNombres;
			textoVictoria.width = anchoTotal;
			textoVictoria.height = 160;
			textoVictoria.x = 0;
			textoVictoria.y = alturaTotal / 2;
			textoVictoria.embedFonts = true;
			textoVictoria.antiAliasType = AntiAliasType.ADVANCED;

			if (numeroJugadores == 1)
			{
				textoJugador1.x = espacioAlrededorX / 2;
				textoJugador1.y = alturaTotal - (espacioAlrededorY / 2);
				addChild(textoJugador1);
			}

			if (numeroJugadores == 2)
			{
				textoJugador1.x = espacioAlrededorX / 2;
				textoJugador1.y = alturaTotal - (espacioAlrededorY / 2) - 20;
				textoJugador2.x = espacioAlrededorX / 2;
				textoJugador2.y = alturaTotal - (espacioAlrededorY / 2) + 20;
				addChild(textoJugador1);
				addChild(textoJugador2);
			}
			addChild(textoTitulo);
			addChild(turnoJugador);
		}

		public function generarArrays()
		{
			for (var i:Number = 0; i < numeroTipos; i++)
			{
				listaTipos.push(i);
			}
			for (var j:Number = 0; j < numeroImagenes; j++)
			{
				listaImagenes.push(j);
			}
		}

		public function desordenarTipos()
		{
			for (var i:Number = 0; i < (listaTipos.length); i++)
			{
				var posic = (Math.round(Math.random()*((listaTipos.length-1)-i)))+i;
				listaTipos.splice(i, 0, listaTipos[posic]);
				listaTipos.splice(posic+1, 1);
			}
		}

		public function desordenarImagenes()
		{
			for (var i:Number = 0; i < (listaImagenes.length); i++)
			{
				var posic = (Math.round(Math.random()*((listaImagenes.length-1)-i)))+i;
				listaImagenes.splice(i, 0, listaImagenes[posic]);
				listaImagenes.splice(posic+1, 1);
			}
		}

		public function desordenarNubes()
		{
			for (var i:Number = 0; i < (listaNubes.length); i++)
			{
				var posic = (Math.round(Math.random()*((listaNubes.length-1)-i)))+i;
				listaNubes.splice(i, 0, listaNubes[posic]);
				listaNubes.splice(posic+1, 1);
			}



			function agregarListeners(item: * ,index:Number,array:Array)
			{
				item.addEventListener(MouseEvent.CLICK,asignarSeleccion);

				function asignarSeleccion()
				{
					if (espacioTiempo.running != true)
					{
						if (listaNubes[index].seleccionado == false)
						{
							trace(index);
							listaNubes[index].agregarImagen(listaNubes[index].urlImagen);

							trace("SELECCION");

							vueltaChannel = vueltaSon.play();

							cuatroAntiguaSeleccion = tresAntiguaSeleccion;
							tresAntiguaSeleccion = dosAntiguaSeleccion;
							dosAntiguaSeleccion = antiguaSeleccion;
							antiguaSeleccion = seleccion;
							seleccion = index;

							if (primerTipo == 0)
							{
								primerTipo = listaNubes[seleccion].tipoNube;
							}
							else
							{
								segundoTipo = listaNubes[seleccion].tipoNube;
							}

							if (primerTipo != 0 && segundoTipo != 0)
							{
								compararTipos();
							}
						}
					}
				}
			}
			listaNubes.forEach(agregarListeners);
		}

		public function compararTipos()
		{
			trace("COMPARAR");

			trace(primerTipo,segundoTipo);
			trace(seleccion,antiguaSeleccion);

			if (primerTipo == segundoTipo)
			{
				if (antiguaSeleccion != seleccion)
				{
					contadorIguales +=  1;

					if (contadorIguales == nivelActual)
					{
						tiposIguales = 1;
						espacioTiempo.start();
					}
				}
			}
			else
			{
				tiposIguales = 0;
				espacioTiempo.start();
			}
		}

		function esperarTiempo(evento:TimerEvent)
		{
			trace("ESPERAR");

			if (tiposIguales == 1)
			{
				nubeChannel = nubeSon.play();

				if (jugadorActual == 1)
				{
					parejasJugador1 +=  1;
					textoJugador1.text = "JUGADOR 1... " + parejasJugador1;
				}
				else if (jugadorActual == 2)
				{
					parejasJugador2 +=  1;
					textoJugador2.text = "JUGADOR 2... " + parejasJugador2;
				}

				if (nivelActual == 1)
				{
					removeChild(listaNubes[antiguaSeleccion]);
					removeChild(listaNubes[seleccion]);
				}

				if (nivelActual == 2)
				{
					removeChild(listaNubes[dosAntiguaSeleccion]);
					removeChild(listaNubes[antiguaSeleccion]);
					removeChild(listaNubes[seleccion]);
				}

				if (nivelActual == 3)
				{
					removeChild(listaNubes[tresAntiguaSeleccion]);
					removeChild(listaNubes[dosAntiguaSeleccion]);
					removeChild(listaNubes[antiguaSeleccion]);
					removeChild(listaNubes[seleccion]);
				}

				if (nivelActual == 4)
				{
					removeChild(listaNubes[cuatroAntiguaSeleccion]);
					removeChild(listaNubes[tresAntiguaSeleccion]);
					removeChild(listaNubes[dosAntiguaSeleccion]);
					removeChild(listaNubes[antiguaSeleccion]);
					removeChild(listaNubes[seleccion]);
				}

				contadorIguales = 0;

				if ((parejasJugador1 + parejasJugador2) == tiposNivel)
				{
					irGanar();
				}
			}
			else
			{
				if (numeroJugadores != 1)
				{
					if (jugadorActual == 1)
					{
						jugadorActual = 2;
						turnoJugador.text = "TURNO DEL JUGADOR " + jugadorActual;
					}
					else if (jugadorActual == 2)
					{
						jugadorActual = 1;
						turnoJugador.text = "TURNO DEL JUGADOR " + jugadorActual;
					}
				}

				vueltaChannel = vueltaSon.play();

				if (nivelActual == 1)
				{
					listaNubes[antiguaSeleccion].quitarImagen();
					listaNubes[seleccion].quitarImagen();
				}

				if (nivelActual == 2)
				{
					if (contadorIguales == 0)
					{
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 1)
					{
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
				}

				if (nivelActual == 3)
				{
					if (contadorIguales == 0)
					{
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 1)
					{
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 2)
					{
						listaNubes[tresAntiguaSeleccion].quitarImagen();
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
				}

				if (nivelActual == 4)
				{
					if (contadorIguales == 0)
					{
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 1)
					{
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 2)
					{
						listaNubes[tresAntiguaSeleccion].quitarImagen();
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
					if (contadorIguales == 3)
					{
						listaNubes[cuatroAntiguaSeleccion].quitarImagen();
						listaNubes[tresAntiguaSeleccion].quitarImagen();
						listaNubes[dosAntiguaSeleccion].quitarImagen();
						listaNubes[antiguaSeleccion].quitarImagen();
						listaNubes[seleccion].quitarImagen();
					}
				}

				contadorIguales = 0;
			}
			primerTipo = 0;
			segundoTipo = 0;
			seleccion = 0;
			antiguaSeleccion = 0;
			tiposIguales = 0;
		}

		public function irGanar()
		{
			primerTipo = 0;
			segundoTipo = 0;
			tercerTipo = 0;
			cuartoTipo = 0;
			quintoTipo = 0;

			seleccion = 0;
			antiguaSeleccion = 0;
			dosAntiguaSeleccion = 0;
			tresAntiguaSeleccion = 0;
			cuatroAntiguaSeleccion = 0;

			listaNubes = new Array();
			listaTipos = new Array();
			listaImagenes = new Array();
			listaDirecciones = new Array();

			textoTitulo.visible = false;
			textoJugador1.visible = false;
			textoJugador2.visible = false;
			turnoJugador.visible = false;
			textoVictoria.visible = true;

			if (parejasJugador1 > parejasJugador2)
			{
				textoVictoria.text = "El jugador 1 ha ganado FELICITACIONES";
			}
			else
			{
				textoVictoria.text = "El jugador 2 ha ganado FELICITACIONES";
			}

			jugadorActual = 1;
			parejasJugador1 = 0;
			parejasJugador2 = 0;

			gotoAndPlay("Ganar");

			inicioChannel = inicioSon.play();

			addChild(textoVictoria);
			nivelActual +=  1;
			btnContinuarHistoria.addEventListener(MouseEvent.CLICK, irHistoria);
		}

		public function irHistoria(evento:MouseEvent)
		{
			botonChannel = botonSon.play();
			mostrarHistoria();
		}

		public function crearDirecciones()
		{
			var cantidad:Number = 0;

			for (var i:Number = 0; i < tiposNivel; i++)
			{
				for (var j:Number = 0; j < imagenesNivel; j++)
				{
					tipo = listaTipos[i] + 1;
					imagen = listaImagenes[j] + 1;
					listaNubes[cantidad].tipoNube = tipo;
					listaDirecciones.push(textoCarpeta + textoTipo + tipo + textoImagen + imagen + textoExtension);
					cantidad +=  1;
				}
			}
		}

		public function unirNubesDirecciones()
		{
			for (var i:Number = 0; i < numeroNubes; i++)
			{
				listaNubes[i].urlImagen = listaDirecciones[i];
			}
		}

		public function generarNubes()
		{
			var aleatorioMayor:Number;
			var aleatorioMenor:Number;

			if (nivelActual < 3)
			{
				aleatorioMayor = 20;
				aleatorioMenor = -20;
			}
			else
			{
				aleatorioMayor = 10;
				aleatorioMenor = -10;
			}

			var distanciaX:Number = (anchoTotal - espacioAlrededorX) / numeroColumnas;
			var distanciaY:Number = (alturaTotal - espacioAlrededorY) / numeroFilas;
			var posX:Number = espacioAlrededorX / 2;
			var posY:Number = espacioAlrededorY / 2;
			var cantidad:Number = 0;
			for (var i:Number = 1; i <= numeroFilas; i++)
			{
				for (var j:Number = 1; j <= numeroColumnas && cantidad < numeroNubes; j++)
				{
					listaNubes.push(new Nube  );
					listaNubes[cantidad].numero = cantidad;
					listaNubes[cantidad].scaleX = escalaNivel;
					listaNubes[cantidad].scaleY = escalaNivel;
					listaNubes[cantidad].x = posX + (Math.round(Math.random()*(aleatorioMayor - aleatorioMenor))) + aleatorioMayor;
					listaNubes[cantidad].y = posY + (Math.round(Math.random()*(aleatorioMayor - aleatorioMenor))) + aleatorioMayor;
					posX = distanciaX + posX;
					addChild(listaNubes[cantidad]);
					cantidad +=  1;
				}
				posY = distanciaY + posY;
				posX = espacioAlrededorX / 2;
			}
		}
	}
}