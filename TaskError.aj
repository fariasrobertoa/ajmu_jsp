package ajmu;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;

import org.aspectj.lang.Signature;

public aspect TaskError extends TaskEvent{
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
        
        String reg = "Excepción al inicio "+ ++totalEvents + ": Ocurrió una excepción en "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") Mensaje del error: " + e.getMessage();
		
		taskRef.setTotalExceptions();
		
		TaskLogger.aspectOf().log().addException(taskRef.getTotalExceptions(), reg);
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
        
        String reg = "Excepción en Ejecución "+ ++totalEvents + ": Ocurrió una excepción en "+ sourceName+ "("+ kind +") línea " + line + " en el método " + sig + "(" + thisJoinPoint.toLongString() + ") Mensaje del error: " + e.getMessage();
    
        taskRef.setTotalExceptions();
		
        TaskLogger.aspectOf().log().addException(taskRef.getTotalExceptions(), reg);
	}
	/**
	 * POINTCUT completeMessage()
	 * Captura ventanas de tipo JOptionPane gestionadas en el flujo de control LUEGO de la accion definida en pointcut inicializacion()
	 */
	pointcut completeMessage(): !initFlow()&&!aspectFlow()&&call(* javax.swing.JOptionPane+.show*Dialog(..)) && !within(ajmu.TaskSatisfactionGrade.*)&& isATask();
	/**
	 * ADVICE before()
	 * cuando una ventana de tipo JOptionPane es capturada, se analiza si se trata de un mensaje informativo, una advertencia, 
	 * una pregunta, o un error. Luego, se registra en el log mediante el aspecto TaskLogger y se contabiliza seteando el 
	 * atributo correspondiente en el objeto miTarea.
	 */
	before(): completeMessage(){ 
		String tipoJOptionPane	= strTipoJOption(thisJoinPoint.getSignature().getName());
		Object [] parametros	= thisJoinPoint.getArgs();			
		String tituloMensaje	= parametros[2].toString();
		int tipoIcono	= -1;
		String tipoMensajeIconificado	= "SIN ICONO PERSONALIZADO";
		if (tipoJOptionPane.equals("Message") || tipoJOptionPane.equals("InternalMessage")){
			if (parametros.length == 4) { 
				tipoIcono	= Integer.parseInt(parametros[3].toString());
				tipoMensajeIconificado	= tipoIconoMensajeJOption(parametros[3]);
			} else {
				tipoIcono	= 1;
				tipoMensajeIconificado	= "INFORMATIVO" ;
			} 
		}else if (tipoJOptionPane.equals("Option") || tipoJOptionPane.equals("InternalOption")) {
			if (parametros.length == 5) { 
				tipoIcono	= Integer.parseInt(parametros[4].toString());				
				tipoMensajeIconificado	= "BOTONES PERSONALIZADOS " + tipoIconoMensajeJOption(parametros[4]);
			}
		}else if (tipoJOptionPane.equals("Input") || tipoJOptionPane.equals("InternalInput")) {	
			 if (parametros.length == 4) { 
				 tipoIcono	= Integer.parseInt(parametros[3].toString());
				 tipoMensajeIconificado	= "ENTRADA DE USUARIO " + tipoIconoMensajeJOption(parametros[3]);
			}else {
				tipoIcono	= 3;
				tipoMensajeIconificado	= "ENTRADA DE USUARIO INTERROGATIVO" ;
			} 
		}else if (tipoJOptionPane.equals("Confirm") || tipoJOptionPane.equals("InternalConfirm")) {	
			 if (parametros.length == 4) { 
				 tipoIcono	= 3;
				 tipoMensajeIconificado	= "CONFIRMACION INTERROGATIVO" ;
			 	}
			 	else if (parametros.length == 5) { 
			 		tipoIcono	= Integer.parseInt(parametros[4].toString());
			 		tipoMensajeIconificado	= "CONFIRMACION " + tipoIconoMensajeJOption(parametros[4]);
			 	} else {
			 		tipoIcono	= 3;
					tipoMensajeIconificado	= "CONFIRMACION INTERROGATIVO" ;
				} 				
		}
		//incrementar los contadores en la clase Tarea
		switch (tipoIcono){
			case -1: taskRef.setTotalMessWithoutIcon();break;
			case 0: taskRef.setTotalMessError();break;
			case 1: taskRef.setTotalMessInfo();break;
			case 2: taskRef.setTotalMessWarn();break;
			case 3: taskRef.setTotalMessQuestion();break;
		}
			
		Signature sig = thisJoinPointStaticPart.getSignature();
		String kind = thisJoinPointStaticPart.getKind();
		String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
	    String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
	         
	    String reg = "Dialogo: "+  + ++totalDialogs + "-> TITULO: '" +tituloMensaje + "' TIPO DE MENSAJE: " + tipoMensajeIconificado + " : Ocurrio un llamado en "+ sourceName+ " ("+ kind +") linea " + line + " al metodo " + sig + "(" + thisJoinPoint.toLongString() + ")";
	        
	    taskRef.setTotalDialogs();
		TaskLogger.aspectOf().log().addDialog(taskRef.getTotalDialogs(), reg);
	}
	/**
	 * EXTRAER string del tipo del metodo show*Dialog de JOptionPane
	 * @param nameMethod nombre del metodo show*Dialog de clase JOptionPane
	 * @return substring con nombre del tipo de JOptionPane : Message,Option,Input,Confirm, InternalMessage, InternalOption, InternalInput, InternalConfirm 
	 * */	
	private String strTipoJOption(String nameMethod) {
		
		Pattern pattern = Pattern.compile("(?<=show).*.(?=Dialog)");
		Matcher matcher = pattern.matcher(nameMethod);
		String auxTipo = null;		
		        
		while (matcher.find()) {			
			auxTipo = matcher.group().toString();		           
		}		
		return auxTipo;		        
	}
	/**
	 * EXTRAER nombre del icono del mensaje del JOPTIONPANE
	 * @param typeMessage parametro del método show*Dialog que especifica el tipo de icono mostrado
	 * @return nombre del icono
	 * */
	private String tipoIconoMensajeJOption(Object typeMessage) {
		
		String auxTipo = null;
		
		switch (Integer.parseInt(typeMessage.toString())){
		case JOptionPane.ERROR_MESSAGE : auxTipo= "ERROR";break;
		case JOptionPane.INFORMATION_MESSAGE: auxTipo= "INFORMATIVO";break;
		case JOptionPane.PLAIN_MESSAGE: auxTipo= "SIN ICONO"; break;
		case JOptionPane.QUESTION_MESSAGE: auxTipo= "INTERROGATIVO"; break;
		case JOptionPane.WARNING_MESSAGE: auxTipo= "ADVERTENCIA"; break;
		}
		return auxTipo;       
	}
}
