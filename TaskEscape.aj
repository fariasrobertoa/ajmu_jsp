package ajmu;

abstract aspect TaskEscape extends TaskEvent{
	/**
	 * POINTCUT completeEscape()
	 * Captura el cierre de la aplicación cuando la tarea aún no finaliza
	 */
	abstract pointcut notComplete();
	pointcut completeEscape():(call(void java.lang.System.exit(..))&&!initFlow()&&!aspectFlow()&&isATask())||(notComplete()&&isATask());

	/**
	 * ADVICE before()
	 * Si el cierre inesperado de la aplicación es capturado cuando la tarea aún no ha finalizado, se registra el estado de los contadores
	 * en el log a través del aspecto TareaLogger. 
	 */
	before(): completeEscape() {	
		taskRef.noFinalize();
		taskRef = null;
	}
}
