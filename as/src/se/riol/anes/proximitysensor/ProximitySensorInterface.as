package se.riol.anes.proximitysensor
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class ProximitySensorInterface extends EventDispatcher
	{
		private var _context : ExtensionContext;
		
		public function ProximitySensorInterface()
		{
			if (!_context) {
				_context = ExtensionContext.createExtensionContext("se.riol.anes.proximitysensor", null);
				_context.addEventListener(StatusEvent.STATUS, _handleContextStatus);
				_context.call('init');
			}
		}
		
		public function start() : void
		{
			if (_context)
				_context.call("start");
		}
		
		
		public function stop() : void
		{
			if (_context)
				_context.call("stop");
		}
		
		
		private function _handleContextStatus(ev : StatusEvent) : void
		{
			this.dispatchEvent(ev.clone());
		}
	}
}