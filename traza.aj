package ajmu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.Signature;

import net.jforum.context.RequestContext;
import net.jforum.context.JForumContext;

public aspect traza {
	pointcut flujoMonitor():cflow(execution(public void net.jforum.util.FileMonitor.FileMonitorTask.run()));
	pointcut flujoAspecto(): cflow(adviceexecution());
	//pointcut traza():execution (* *+.*(..))&&!flujoAspecto();
	//pointcut traza():execution (* net.jforum.context.JForumContext.*(..))&&!flujoAspecto();
    //pointcut traza(String url):execution (String net.jforum.context.JForumContext.encodeURL(String))&&args(url)&&!flujoAspecto();
	
	
	pointcut traza():execution (* net.jforum.view.*.*.*(..))&&!flujoAspecto()&&!flujoMonitor();
	
	before():traza(){
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
        String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
        
        String reg = " Evento "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") ";
        System.out.println(reg);
	}
	
   /* pointcut traza(JForumContext l):execution(RequestContext net.jforum.context.JForumContext.getRequest())&&this(l)&&!flujoAspecto();
		
		before(JForumContext l):traza(l){
			Signature sig = thisJoinPointStaticPart.getSignature();
			String kind = thisJoinPointStaticPart.getKind();
	        String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
	        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
	        
	        String reg = "Accion " + l.getRequest().getAction() +" Evento "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") ";
	        System.out.println(reg);
		}*/
    /* pointcut trazaC(HttpServletRequest q,HttpServletResponse p):execution(void net.jforum.JForum.service(HttpServletRequest, HttpServletResponse))&&args(q,p);
		
	before(HttpServletRequest q,HttpServletResponse p):trazaC(q,p){
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
        String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
        String resultado = "";
        if(q.getRequestURI().indexOf("login.page")>0){
			//if(q.getParameter("action").equals("insert")){
				resultado="si es aquí";
			//}
		}else{
			resultado="no es aquí";
		}
        String reg = resultado + " Action "+ q.getRequestURI() + q.getParameter("action") +" Evento "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") ";
        System.out.println(reg);
	}*/
/*	pointcut trazaR():execution(* net.jforum.context.web.WebResponseContext.*())&&!flujoAspecto();
	before():trazaR(){
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
        String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
        
        String reg = " Evento "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") ";
        System.out.println(reg);
	}*/
}
