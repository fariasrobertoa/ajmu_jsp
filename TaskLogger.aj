/**
* 
* PROYECTO DE INVESTIGACIÓN
* USABILIDAD & AOP: DESARROLLO Y EVALUACIÓN DE UN FRAMEWORK DE DOMINIO.
* (2014-2015)
* CÓDIGO: 29/A315
* 
* MÁS INFORMACIÓN EN {@link https://sites.google.com/site/profeprog/proyecto5}
* 
*/
package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskLogger {
	
	private static final LoggerJaxb logJaxb = new LoggerJaxb("undefined", "undefined");
	pointcut registrarInicio(Task t):initialization(Task.new(String))&&this(t);
	
	after(Task t): registrarInicio(t){
		logJaxb.addTask(t.getId(), t.getEstado());
		t.setEstado("En ejecución");
	}
	
	pointcut registrarDatos(Task t):execution(void Task.finaliza(..))&&this(t);
	
	after(Task t): registrarDatos(t){
		//logJaxb.addLogFinal(t.getEstado(), t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono(),t.tiempoDeEjecucion(),t.getGradoSatisfaccion());
		logJaxb.addLogFinal(t.getEstado(), t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono(),t.tiempoDeEjecucion(),t.getSat1(),t.getSat2(),t.getSat3(),t.getCompositeSat());
		
	}
	
	pointcut deteccionEventos(Task t): call(void Task.setCant*(..))&&target(t)||call(void Task.setEstado(..))&&target(t);
	
	after(Task t): deteccionEventos(t){
		logJaxb.addLogPartial(t.getEstado(),t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono());				
	}
	
	pointcut registrarNoFinaliza(Task t):execution(void Task.noFinaliza(..))&&this(t);
	
	after(Task t): registrarNoFinaliza(t){
		logJaxb.addLogPartial(t.getEstado(),t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono());		
	}
		
	public LoggerJaxb log(){
		return logJaxb;
	}
}
