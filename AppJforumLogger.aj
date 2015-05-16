package ajmu;

public aspect AppJforumLogger extends AppLogger{
	
	pointcut initLogger():execution(void net.jforum.view.forum.UserAction.login());
		
	@Override
	void initializationLogger() {

		setAppName("jforum");
		setAppVersion("2.1.8");
		addTask("01", "Tarea 1: Creación de un tema en el foro");
		addTask("02", "Tarea 2: Crear un grupo de usuarios y ajustar sus permisos");
		addTask("03", "Tarea 3: Crear un usuario y agregarlo al grupo de administradores");
	}

}
