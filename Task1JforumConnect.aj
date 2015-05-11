package ajmu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public aspect Task1JforumConnect extends TaskConnect{
	
	//void net.jforum.view.forum.PostAction.insert()
	pointcut inicializacion(HttpServletRequest q,HttpServletResponse p):execution(void net.jforum.JForum.service(HttpServletRequest, HttpServletResponse))&&args(q,p);
	
	pointcut finalizacion():execution(int net.jforum.dao.PostDAO+.addNew(net.jforum.entities.Post));
	
	String setTareaDescripcion() {
		return "Tarea 1: Creación de un tema en el foro";
	}
	boolean validateAction(HttpServletRequest q){		
		if(q.getRequestURI().indexOf("jforum.page")>0){
			if(q.getParameter("action").equals("insert")){
				return true;
			}
		}
		return false;
	}
}
