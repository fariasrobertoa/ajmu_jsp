package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect AppJforumConfiguration extends UsabilityTaskConfiguration{
	
	pointcut configuration():execution(void net.jforum.view.forum.UserAction.login());
		
	@Override
	void initializationLogger() {

		setApplicationTest("jforum","2.1.8");
		addTask("01", "Tarea 1: Creación de un tema en el foro");
		addTask("02", "Tarea 2: Crear un grupo de usuarios y ajustar sus permisos");
		addTask("03", "Tarea 3: Crear un usuario y agregarlo al grupo de administradores");
	}
	
	@Override
	LoggerJaxb logApp() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}

}
