package ajmu;

import java.util.ArrayList;


abstract aspect AppLogger {
	static String appName, appVersion;
	static ArrayList<String[][]> tasks = new ArrayList<String[][]>();
	
	abstract void inicializarLogger();
	
	abstract pointcut initLogger();
		
	before(): initLogger(){
	
		inicializarLogger();
		TaskLogger.aspectOf().log().setApp(appName, appVersion);
		for (int i = 0; i < tasks.size(); i++) {
			
		    TaskLogger.aspectOf().log().addTaskAnalized(tasks.get(i)[0][0], tasks.get(i)[0][1]);
		}
	
	}
	
	
	public void agregarTarea(String id, String desc){
		String[][] task = new String[1][2];
		task[0][0]=id;
		task[0][1]=desc;
		tasks.add(task);
	}
	
	public void setAppName(String name){
		appName = name;
		
	}
	
	public void setAppVersion(String version){
		
		appVersion = version;
	}
}
