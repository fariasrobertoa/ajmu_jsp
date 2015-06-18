package ajmu;

/**
 * Task2JforumConnect. 
 * 
 * Tarea 2: Crear un grupo de usuarios y ajustar sus permisos.
 * 
 * Descripción: Para realizar esta tarea, el usuario deberá ingresar al sistema de foros JForum con privilegios de administrador. 
 * Luego de que se haya registrado exitósamente, desde el Panel de Administrador, deberá crear un nuevo Grupo, denominado Moderadores.
 * Una vez creado el nuevo Grupo, deberá ajustar sus permisos, para permitir a sus miembros, administrar los temas y respuestas publicados en el foro Usabilidad.
 *
 * Inicio de la tarea: La tarea se considerará iniciada luego de que el usuario haya seleccionado la opción "Insert", en la Interfaz de Administración de Grupos.
 * 
 * Fin de la tarea: La tarea se considerará finalizada luego de que se hayan ajustado los permisos sobre el grupo Moderadores, y guardado los cambios. 
 * 
 * @author PI-315
 *
 */
public aspect Task2JforumConnect extends TaskConnect{
	
	pointcut startTask():execution(void net.jforum.view.admin.GroupAction.insert());
	
	pointcut endTask():execution(void net.jforum.view.admin.GroupAction.permissionsSave());
	
	String setIdTask() {
		return "02";
	}
}
