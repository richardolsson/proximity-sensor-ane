package se.riol.anes.proximitysensor;

import android.app.Activity;
import android.hardware.SensorManager;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class ProximitySensorInitFunction implements FREFunction {

	public FREObject call(FREContext context, FREObject[] args) {
		SensorManager sensorManager;
		ProximitySensorContext psContext;
		
		Log.d("se.riol.anes.proximitysensor", "initializing!");
		
		psContext = (ProximitySensorContext)context;
		sensorManager = (SensorManager) psContext.getActivity().getSystemService(Activity.SENSOR_SERVICE);
		
		psContext.init(sensorManager);
		return null;
	}

}
