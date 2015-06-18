package ajmu;

abstract aspect TaskEvent {
	
	abstract InterfaceTaskLog logEvent();
	
	protected static Task taskRef = null;
	
	pointcut init():initialization(Task.new(String));
	pointcut saveRef(Task tar):init()&&this(tar);
	after(Task tar): saveRef(tar){
		taskRef = tar;
	}
	
	pointcut end():execution(void Task.finalize(..));
		
	pointcut aspectFlow(): cflow(adviceexecution());
	pointcut initFlow(): cflow(init());
	pointcut endFlow(): cflow(end());
	pointcut isATask(): if ((taskRef!=null) && (!taskRef.isComplete()));
	
	
}
