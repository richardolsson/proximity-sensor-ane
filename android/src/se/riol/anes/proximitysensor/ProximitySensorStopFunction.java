package se.riol.anes.proximitysensor;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class ProximitySensorStopFunction implements FREFunction {

	public FREObject call(FREContext context, FREObject[] args) {
		ProximitySensorContext psContext = (ProximitySensorContext)context;
		psContext.stopListening();
		return null;
	}

}
