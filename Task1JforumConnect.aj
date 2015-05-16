package ajmu;

/**
 * Tarea1FreemindConnect. Declara los pointcut de inicio y fin de la tarea que se define a continuación.
 * 
 * Tarea1: Creación de un Mapa Mental Básico.
 * 
 * Descripción: En esta tarea, el usuario deberá crear un nuevo mapa desde el menú principal o desde la barra de herramientas.
 * Luego, mediante las diferentes opciones que ofrece la aplicación, deberá agregar, al menos, 10 nodos, organizados en una jerarquía 
 * de al menos tres niveles. 
 * Se podrán solicitar a los usuario que apliquen formato, tal como cambiar el color del nodo principal, su morfología, el tamaño de 
 * la fuente, etc.
 * Finalmente se pedirá que guarde el mapa conceptual en el escritorio de su ordenador con un nombre significativo.
 * 
 * Inicio de la tarea: La tarea se considerará iniciada luego de que el usuario haya seleccionado la opción "Nuevo" del 
 * menú principal o desde la barra de herramientas.
 * 
 * Fin de la tarea: La tarea se considerará finalizada luego de que el usuario guarde, por primera vez, el mapa en el escritorio. 
 * 
 * @author PI-315
 *
 */

public aspect Task1JforumConnect extends TaskConnect{
	
	pointcut startTask():execution(void net.jforum.view.forum.PostAction.insert());
	
	pointcut endTask():execution(int net.jforum.dao.PostDAO+.addNew(net.jforum.entities.Post));
	
	String setIdTask() {
		return "Tarea 1: Creación de un tema en el foro";
	}
}
