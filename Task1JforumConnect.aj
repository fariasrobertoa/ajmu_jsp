package ajmu;

/**
 * Task1JforumConnect. 
 * 
 * Tarea 1: Creación de un tema en el foro.
 * 
 * Descripción: En esta tarea, el usuario deberá ingresar al sistema de foros JForum y crear un nuevo tema en el foro Evaluación de Usabilidad. 
 * Deberá asignar un título significativo al tema y una breve descripción sobre el tema centra de discusión que se desea desarrollar.
 * En la descripción, se pide al menos, insertar una imagén, y dar formato al texto, aplicando alineación y colores a las frases o palabras destacadas.
 *
 * Inicio de la tarea: La tarea se considerará iniciada luego de que el usuario haya seleccionado la opción "New Post".
 * 
 * Fin de la tarea: La tarea se considerará finalizada luego de que el usuario envíe el formulario y aparezca la publicación en el listado de temas del foro Evaluación de Usabilidad. 
 * 
 * @author PI-315
 *
 */
public aspect Task1JforumConnect extends TaskConnect{
	
	pointcut startTask():execution(void net.jforum.view.forum.PostAction.insert());
	
	pointcut endTask():execution(int net.jforum.dao.PostDAO+.addNew(net.jforum.entities.Post));
	
	String setIdTask() {
		return "01";
	}
}
