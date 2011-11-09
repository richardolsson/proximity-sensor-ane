package se.riol.anes.proximitysensor;

import java.util.HashMap;
import java.util.Map;

import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class ProximitySensorContext extends FREContext {

	private Sensor proximitySensor;
	private SensorManager sensorManager;
	private ProximitySensorEventListener sensorListener;
	
	
	public void init(SensorManager sensMgr) {
		sensorManager = sensMgr;
		sensorListener = new ProximitySensorEventListener(this);
		proximitySensor = sensorManager.getDefaultSensor(Sensor.TYPE_PROXIMITY);
	}
	
	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}
	
	public void startListening() {
		Log.d("se.riol.anes.proximitysensor", "Start listening");
		sensorManager.registerListener(sensorListener, proximitySensor, SensorManager.SENSOR_DELAY_NORMAL);
	}
	
	public void stopListening() {
		Log.d("se.riol.anes.proximitysensor", "Stop listening");
		sensorManager.unregisterListener(sensorListener);
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		
		map.put("init", new ProximitySensorInitFunction());
		map.put("start", new ProximitySensorStartFunction());
		map.put("stop", new ProximitySensorStopFunction());
		
		return map;
	}

}
