package ajmu;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

abstract aspect UsabilityTaskConfiguration {
	static String appName, appVersion;
	
	static Hashtable<String, String> tasksTest = new Hashtable<String, String>();
	
	public void setApplicationTest(String name,String version){
		appName = name;
		appVersion = version;
	}
	
	public void addTask(String id, String desc){
		tasksTest.put(id, desc);
	}
	
	abstract InterfaceTaskLog logApp();
	
	abstract void initializationLogger();
	
	//pointcut configuration():execution(public static void *+.main(String[]));

	abstract pointcut configuration();
	
	before(): configuration(){
		initializationLogger();
		logApp().setApp(appName, appVersion);
		
		Enumeration e = tasksTest.keys();
		String clave, valor;
		while (e.hasMoreElements()){
			clave = (String) e.nextElement();
			valor = tasksTest.get(clave);
			logApp().addTaskAnalized(clave, valor);
		}
		
	}
	
	
	
	
}
