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

abstract aspect TaskLog {
	
	abstract void events(Task t);
	
	abstract void initTask(Task t);
	
	abstract void endTask(Task t);
	
	abstract InterfaceTaskLog log();
	
	pointcut logStart(Task t):initialization(Task.new(String))&&this(t);
	
	pointcut logEnd(Task t):execution(void Task.finalize(..))&&this(t);
	
	pointcut logEvent(Task t): (call(void Task.setTotal*(..))||call(void Task.setState(..)))&&target(t);
	
	pointcut logNoEnd(Task t):execution(void Task.noFinalize(..))&&this(t);
	
	after(Task t): logStart(t){
		initTask(t);
		t.setState("Running");
	}
	
	after(Task t): logEnd(t){
		endTask(t);
	}
	
	after(Task t): logEvent(t){
		events(t);				
	}
	
	after(Task t): logNoEnd(t){
		log().addLogPartial(t.getState(),t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon());		
	}
		
	
}
