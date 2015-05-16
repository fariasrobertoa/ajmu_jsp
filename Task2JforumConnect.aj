package ajmu;

public aspect Task2JforumConnect extends TaskConnect{
	pointcut startTask():execution(void net.jforum.view.admin.GroupAction.insert());
	
	pointcut endTask():execution(void net.jforum.view.admin.GroupAction.permissionsSave());
	
	String setIdTask() {
		return "Tarea 2: Crear un grupo de usuarios y ajustar sus permisos";
	}
}
