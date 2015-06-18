package ajmu;

public interface InterfaceTaskLog {
	void addDialog(Integer id, String msj);
	void addException(Integer id, String msj);
	void addLogFinal(String state, Integer accDoc, Integer cantDialog, Integer cantExcep, Integer msjE, Integer msjI, Integer msjQ, Integer msjW, Integer msjO,Long execTime, int sat1, int sat2, int sat3);
	void addLogPartial(String state, Integer accDoc, Integer cantDialog, Integer cantExcep, Integer msjE, Integer msjI, Integer msjQ, Integer msjW, Integer msjO);
	void addSession(Integer edad, String sex);
	void addTask(String id, String state);
	void addTaskAnalized(String id, String name);
	void setApp(String nameApp, String version);
}
