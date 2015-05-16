/**
* 
* PROYECTO DE INVESTIGACIÓN
* USABILIDAD & AOP: DESARROLLO Y EVALUACIÓN DE UN FRAMEWORK DE DOMINIO.
* (2014-2015)
* CÓDIGO: 29/A315
* 
* MÁS INFORMACIÓN EN {@link https://sites.google.com/site/profeprog/proyecto5}
* 
*/
package ajmu;


public class Task {	
	
	private String id;
	private boolean complete;
	private long init,end;
	private int totalExceptions;
	//private String descripcion; totalMessQuestion
	private int totalDialogs;
	private int totalAccessDocumentation;
	private int totalMessWithoutIcon;
	private int totalMessError;
	private int totalMessInfo;
	private int totalMessWarn;
	private int totalMessQuestion;
	private int sat1, sat2, sat3;
	private String state;
	private int ageUser;
	private String sexUser;
	
	public int getAgeUser() {
		return ageUser;
	}

	public void setAgeUser(int ageUser) {
		this.ageUser = ageUser;
	}

	public String getSexUser() {
		return sexUser;
	}

	public void setSexUser(String sexUser) {
		this.sexUser = sexUser;
	}
	
    

	public Task(String idTask) {		
		//id	= desc.replaceAll(" ", "_") + "_"+ System.currentTimeMillis();
		id = idTask;
		complete = false;
		init = System.currentTimeMillis();
		end = 0;
		totalExceptions = 0;
		//descripcion = desc;
		totalAccessDocumentation = 0;
		state = "initiated";
	}
	
	public void setSat1(int sat) {
		this.sat1 = sat;
	}
	public int getSat1() {
		return sat1;
	}
	public void setSat2(int sat) {
		this.sat2 = sat;
	}
	public int getSat2() {
		return sat2;
	}
	public void setSat3(int sat) {
		this.sat3 = sat;
	}
	public int getSat3() {
		return sat3;
	}
		
	/*public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDescripcion() {
		return descripcion;
	}*/	
	public String getId() {
		return id;
	}
	public boolean isComplete() {
		return complete;
	}
	public Long getInit() {
		return init;
	}
	public Long getEnd() {
		return end;
	}
	public void finalize(){	
			end = System.currentTimeMillis();
			complete = true;	
			state = "Finished";	
	}
	public void noFinalize(){	
		complete = false;	
		state = "No Finished";	
	}
	public void setTotalExceptions() {
		this.totalExceptions++;
	}
	public int getTotalExceptions() {
		return totalExceptions;
	}
	public void setTotalDialogs() {
		this.totalDialogs++;
	}
	public int getTotalDialogs() {
		return totalDialogs;
	}
	public void setTotalAccessDocumentation(){
		this.totalAccessDocumentation++;
	}
	public int getTotalAccessDocumentation(){
		return this.totalAccessDocumentation;
	}
	public void setTotalMessWithoutIcon() {
		this.totalMessWithoutIcon++;
	}
	public int getTotalMessWithoutIcon() {
		return this.totalMessWithoutIcon;
	}
	public void setTotalMessError() {
		this.totalMessError++;
	}
	public int getTotalMessError() {
		return this.totalMessError;
	}
	public void setTotalMessInfo() {
		this.totalMessInfo++;
	}
	public int getTotalMessInfo() {
		return this.totalMessInfo;
	}
	public void setTotalMessWarn() {
		this.totalMessWarn++;
	}
	public int getTotalMessWarn() {
		return this.totalMessWarn;
	}
	public void setTotalMessQuestion() {
		this.totalMessQuestion++;
	}
	public int getTotalMessQuestion() {
		return this.totalMessQuestion;
	} 
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	public Long timeOfExecution(){
		return end - init;
	}
	public String timeOfExecutionSeconds(){
		Long timeExecution = end - init;
		
		Long hours = timeExecution / 3600000;
		Long restHours = timeExecution%3600000;
		
		Long minutes = restHours / 60000;
		Long restMinutes = restHours%60000;
		
		Long seconds = restMinutes / 1000;
		Long restSeconds = restMinutes%1000;
		
		return hours + ":" + minutes + ":" + seconds + "." + restSeconds;	
	}
}
