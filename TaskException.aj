package ajmu;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;

import org.aspectj.lang.Signature;

abstract aspect TaskException extends TaskEvent{
	/**
	 * POINCUT initExceptions()
	 * Captura las excepciones gestionadas por catch, en el flujo de control iniciado por el pointcut inicializacion()
	 */
	pointcut initExceptions(Throwable e): initFlow()&&!aspectFlow()&&handler(Throwable+)&&args(e);
	/**
	 * ADVICE before()
	 * Cuando una excepción es capturada, se registra en el log invocando al aspecto TaskLogger, y se contabiliza su ocurrencia en el objeto miTarea. 
	 * @param e es un objeto de la clase Throwable de la cual heredan los diferentes tipos de excepciones que pueden ocurrir en una aplicación.
	 */
	before(Throwable e): initExceptions(e){
		
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
        String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
        
        String reg = "Excepción al inicio "+ ": Ocurrió una excepción en "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") Mensaje del error: " + e.getMessage();
		
		taskRef.setTotalExceptions();
		
		logEvent().addException(taskRef.getTotalExceptions(), reg);
	}
	/**
	 * POINTCUT executionExceptions()
	 * Captura las excepciones gestionadas por catch, en el flujo de control LUEGO de la accion definida en pointcut inicializacion()
	 */
	pointcut executionExceptions(Throwable e):!initFlow()&&!aspectFlow()&&handler(Throwable+)&&args(e)&&isATask();
	/**
	 * ADVICE before()
	 * Cuando una excepción es capturada, se registra en el log invocando al aspecto TaskLogger, y se contabiliza su ocurrencia en el objeto miTarea.
	 * @param e es un objeto de la clase Throwable de la cual heredan los diferentes tipos de excepciones que pueden ocurrir en una aplicación.
	 */
	
	before(Throwable e):executionExceptions(e){
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
		String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
        
        String reg = "Excepción en Ejecución "+ ": Ocurrió una excepción en "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") Mensaje del error: " + e.getMessage();
    
        taskRef.setTotalExceptions();
		
        logEvent().addException(taskRef.getTotalExceptions(), reg);
	}
	
	
}
