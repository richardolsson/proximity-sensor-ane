package se.riol.anes.proximitysensor;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ProximitySensorExtension implements FREExtension {

	public FREContext createContext(String arg0) {
		return new ProximitySensorContext();
	}

	public void dispose() {
		// TODO Auto-generated method stub

	}

	public void initialize() {
		// TODO Auto-generated method stub

	}

}
