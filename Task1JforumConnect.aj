package ajmu;

public aspect Task1JforumConnect extends TaskConnect{
	
	pointcut inicializacion():execution(void net.jforum.view.forum.PostAction.insert());
	
	pointcut finalizacion():execution(int net.jforum.dao.PostDAO+.addNew(net.jforum.entities.Post));
	
	String setTareaDescripcion() {
		return "Tarea 1: Creación de un tema en el foro";
	}
}
