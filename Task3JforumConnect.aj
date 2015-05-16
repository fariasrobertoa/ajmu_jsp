package ajmu;

public aspect Task3JforumConnect extends TaskConnect{
    pointcut startTask():execution(void net.jforum.view.admin.UserAction.list());
	
	pointcut endTask():execution(void net.jforum.view.admin.UserAction.groupsSave());
	
	String setIdTask() {
		return "Tarea 3: Crear un usuario y agregarlo al grupo de administradores";
	}
}
