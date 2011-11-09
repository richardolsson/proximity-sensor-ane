package se.riol.anes.proximitysensor;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.util.Log;

public class ProximitySensorEventListener implements SensorEventListener {

	private ProximitySensorContext context;
	
	public ProximitySensorEventListener(ProximitySensorContext context) {
		this.context = context;
	}
	
	public void onAccuracyChanged(Sensor arg0, int arg1) {
		// TODO Auto-generated method stub

	}

	public void onSensorChanged(SensorEvent event) {
		Log.d("se.riol.proximitysensor", "Got update! "+Float.toString(event.values[0]));
		context.dispatchStatusEventAsync("CHANGE", Float.toString((Float)event.values[0]));
	}

}
