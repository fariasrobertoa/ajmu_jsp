package ajmu;

import java.awt.Dialog;

import org.aspectj.lang.Signature;

abstract aspect TaskDialog extends TaskEvent{
	
	/**
	 * POINTCUT completeDialog()
	 * Captura ventanas de tipo Dialog gestionadas en el flujo de control LUEGO de la accion definida en pointcut inicializacion()
	 */
	pointcut completeDialog(Dialog jd): !initFlow()&&!aspectFlow() && call( * *Dialog(..)) && target(jd) && isATask();
	/**
	 * ADVICE before()
	 * Registra información de la ventana de tipo Dialog cuando ésta es capturada por el pointcut.
	 * Se registra el título de la ventana y la línea y clase desde la cual ocurrió la llamada.
	 * También se contabiliza el atributo cantDialogos del objeto miTarea.
	 * @param jd puede ser cualquier objeto de tipo Dialog o JDialog.
	 */
	before(Dialog jd): completeDialog(jd){
		if (thisJoinPoint.getTarget().getClass().getSuperclass().getCanonicalName().equals("javax.swing.JDialog") ||
				thisJoinPoint.getTarget().getClass().getSuperclass().getCanonicalName().equals("java.awt.Dialog")){
			
			String titleDialog	= "Titulo: " + jd.getTitle();
			
			Signature sig = thisJoinPointStaticPart.getSignature();
			String kind = thisJoinPointStaticPart.getKind();
			String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
	        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
	         
	        String reg = "Dialogo: "+ "-> TITULO: " + titleDialog + ": Ocurrio un llamado en "+ sourceName+ "("+ kind +") linea " + line + " al metodo " + sig + "(" + thisJoinPoint.toLongString() + ")";
	        
	        taskRef.setTotalDialogs();
			
	        logEvent().addDialog(taskRef.getTotalDialogs(), reg);
		}		
	}
}
