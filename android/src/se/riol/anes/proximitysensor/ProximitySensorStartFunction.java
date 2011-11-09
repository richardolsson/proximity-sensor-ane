package se.riol.anes.proximitysensor;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class ProximitySensorStartFunction implements FREFunction {

	public FREObject call(FREContext context, FREObject[] args) {
		Log.d("se.riol.anes.proximitysensor", "ProximitySensorStartFunction.call()");
		ProximitySensorContext psContext = (ProximitySensorContext)context;
		psContext.startListening();
		return null;
	}

}
