package se.riol.anes.proximitysensor
{
	import flash.events.EventDispatcher;

	public class ProximitySensorInterface extends EventDispatcher
	{
		public function ProximitySensorInterface()
		{
		}
		
		
		public function init() : void
		{
			trace('dummy prox sensor init');
		}
		
		
		public function start() : void
		{
			trace('dummy prox sensor start');
		}
		
		
		public function stop() : void
		{
			trace('dummy prox sensor stop');
		}
	}
}