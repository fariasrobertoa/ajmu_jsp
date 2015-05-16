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

abstract aspect TaskConnect{

	static boolean connectBusy = false;
	boolean initiated	= false;	
	Task taskAnalyzed = null;
	
	/**
	 * POINTCUT startTask()
	 * Define el conjunto de puntos de corte que marcan el inicio de la tarea cuya usabilidad se desea estudiar.
	 */
	abstract pointcut startTask();
	/**
	 * ADVICE before()
	 * Si la tarea aún no ha iniciado, cambia el estado del atributo iniciada a true. 
	 */
	
	abstract String setIdTask();
	
	before(): startTask(){
		if(!connectBusy){
			if (!initiated) {
				taskAnalyzed = new Task(setIdTask());
				initiated = true;
				connectBusy = true;
				
			}
		}
	}
	
	/**
	 * POINTCUT endTask()
	 * Define el conjunto de puntos de corte que marcan el fin de la tarea cuya usabilidad se desea estudiar.
	 */
	abstract pointcut endTask();
	/**
	 * ADVICE after() returning.
	 * Si la tarea se encuentra iniciada cuando alguno de los joinpoints es capturado, entonces cambia el estado
	 * de la tarea a finalizada e inicializa los atributos del aspecto.  
	 */	 
	after() returning: endTask(){
		if (initiated) {
			taskAnalyzed.finalize();	
		}
		initiated = false;
		connectBusy = false;
			
	}
	pointcut noFinalize():execution(void Task.noFinalize(..));
	after() returning: noFinalize(){
		initiated = false;
		connectBusy = false;
	}
	
	
	
}
