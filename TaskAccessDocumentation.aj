package ajmu;

abstract aspect TaskAccessDocumentation extends TaskEvent{
	/**
	 * POINTCUT accessDocumentation()
	 * Define el conjunto de puntos de corte que indican el acceso a documentacion del sistema, disponible para usuario.
	 */
	abstract pointcut accessDocumentation();
	
	pointcut completeAccessDocumentation(): accessDocumentation()&&isATask();
	/**
	 * ADVICE before()
	 * Si la tarea se encuentra en ejecución, es decir que existe un objeto miTarea que aún no se ha completado, entonces
	 * contabiliza los accesos a la documentación.  
	 */
	before(): completeAccessDocumentation(){
		taskRef.setTotalAccessDocumentation();
	}
}
