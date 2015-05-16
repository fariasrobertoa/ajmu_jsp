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
	
	private static final LoggerJaxb logJaxb = new LoggerJaxb();
	pointcut logStart(Task t):initialization(Task.new(String))&&this(t);
	
	after(Task t): logStart(t){
		logJaxb.addTask(t.getId(), t.getState());
		t.setState("Running");
	}
	
	pointcut logEnd(Task t):execution(void Task.finalize(..))&&this(t);
	
	after(Task t): logEnd(t){
		logJaxb.addLogFinal(t.getState(), t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon(),t.timeOfExecution(),t.getSat1(),t.getSat2(),t.getSat3());
		
	}
	
	pointcut logEvent(Task t): call(void Task.setTotal*(..))&&target(t)||call(void Task.setState(..))&&target(t);
	
	after(Task t): logEvent(t){
		logJaxb.addLogPartial(t.getState(),t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon());				
	}
	
	pointcut logNoFinalize(Task t):execution(void Task.noFinalize(..))&&this(t);
	
	after(Task t): logNoFinalize(t){
		logJaxb.addLogPartial(t.getState(),t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon());		
	}
		
	public LoggerJaxb log(){
		return logJaxb;
	}
}
