package ajmu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public aspect AppJforumLogger extends AppLogger{
	//void net.jforum.view.forum.UserAction.login()
	pointcut initLogger(HttpServletRequest q,HttpServletResponse p):execution(void net.jforum.JForum.service(HttpServletRequest, HttpServletResponse))&&args(q,p);
	
	
	boolean validateAction(HttpServletRequest q) {
		// TODO Auto-generated method stub
		if(q.getRequestURI().indexOf("login.page")>0){			
				return true;
		}else{
			return false;
		}
	}
	
	@Override
	void inicializarLogger() {

		setAppName("jforum");
		setAppVersion("2.1.8");
		agregarTarea("01", "Tarea 1: Creación de un tema en el foro");
		//agregarTarea("02", "undefined");
		//agregarTarea("03", "undefined");
	}

}
