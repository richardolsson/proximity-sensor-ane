This is a so called Native Extension for Adobe AIR 3, which will allow you
to read the output of the proximity sensor on devices which have one. 

Both Android and iOS are supported, as well as a "default" implementation
which will never dispatch any events (necessary to run app in the simulator
on desktop.) 

The "android" and "ios" contain the native libraries for Android (java) and
iOS (C/ObjC) respectively. The "default" folder contains the dummy AS3
implementation, and the "as" folder contains the AS3 library interface.

For more information on Native Extensions, see the page at the following URL:
http://www.adobe.com/devnet/air/native-extensions-for-air.html

# How to use
In the bin folder you will find both an ANE file and a SWC file. Configure 
your IDE (e.g. Flash Builder 4.6) to use the ANE file while packaging, and
add the SWC file to your SWC path. That should be enough to set it up.

The class to use is called `ProximitySensorInterface` and resides in the 
`se.riol.anes.proximitysensor package`. It has a `start()` and a `stop()`
method to start and stop proximity sensor polling respectively. When the 
sensor detects a change in proximity, a `StatusEvent` will be dispatched.

Here's some very basic sample code, in lieu of a proper example:

import se.riol.anes.proximitysensor.ProximitySensorInterface;

    var proximity : ProximitySensorInterface;
    proximity = new ProximitySensorInterface();
    proximity.addEventListener(StatusEvent.STATUS, handleProximity);
    proximity.start();
    
    function handleProximity(ev : StatusEvent) : void
    {
        trace('proximity: '+ev.level);
    }


# How to help develop
See README files in the folders for the respective platforms/targets.


# TODO:
- Clean up interface (possibly rename main class)
- Replace with better event type than the standard ANE StatusEvent
- Write build instructions for all platforms.
