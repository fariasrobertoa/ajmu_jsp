package ajmu;

public aspect AppJforumLogger extends AppLogger{
	
	pointcut initLogger():execution(void net.jforum.view.forum.UserAction.login());
		
	@Override
	void inicializarLogger() {

		setAppName("jforum");
		setAppVersion("2.1.8");
		agregarTarea("01", "Tarea 1: Creación de un tema en el foro");
	}

}
