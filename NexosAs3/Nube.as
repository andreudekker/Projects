package com.nexos
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Nube extends MovieClip
	{
		var textoMarco = "marco.png";

		public var numero:Number = 0;
		public var imagen:Number = 0;
		public var urlReq:URLRequest;
		public var loadMarco:Loader = new Loader();
		public var loadImagen:Loader = new Loader();
		public var numeroTipo:Number = 0;
		public var urlImagen:String;
		public var tipoNube:Number;
		public var seleccionado:Boolean = false;

		var animacionTiempo:Timer = new Timer(150,1);

		public function Nube()
		{
			animacionTiempo.addEventListener(TimerEvent.TIMER,mostrarImagen);
		}

		public function agregarImagen(imagen:String)
		{
			this.play();
			animacionTiempo.start();
		}

		function mostrarImagen(evento:TimerEvent)
		{
			urlReq = new URLRequest(urlImagen);
			loadImagen.load(urlReq);
			urlReq = new URLRequest(textoMarco);
			loadMarco.load(urlReq);
			loadMarco.x = -60;
			loadMarco.y = -60;
			addChild(loadImagen);
			addChild(loadMarco);
			seleccionado = true;
		}

		public function quitarImagen()
		{
			this.play();
			removeChild(loadImagen);
			removeChild(loadMarco);
			seleccionado = false;
		}

	}
}