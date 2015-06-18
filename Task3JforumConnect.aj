package ajmu;

/**
 * Task3JforumConnect. 
 * 
 * Tarea 3: Crear un usuario y agregarlo al grupo de administradores.
 * 
 * Descripción: Para realizar esta tarea, el usuario deberá ingresar al sistema de foros JForum con privilegios de administrador. 
 * Luego de que se haya registrado exitósamente, desde el Panel de Administrador, deberá crear un nuevo usuario.
 * Una vez creado el nuevo usuario, deberá incorporarlo al grupo de administradores.
 *
 * Inicio de la tarea: La tarea se considerará iniciada luego de que ingrese a la interfaz de Administración de Usuarios.
 * 
 * Fin de la tarea: La tarea se considerará finalizada luego de que haya sido incorporado el nuevo usuario al grupo de Administradores. 
 * 
 * @author PI-315
 *
 */
public aspect Task3JforumConnect extends TaskConnect{
    
	pointcut startTask():execution(void net.jforum.view.admin.UserAction.list());
	
	pointcut endTask():execution(void net.jforum.view.admin.UserAction.groupsSave());
	
	String setIdTask() {
		return "03";
	}
}
