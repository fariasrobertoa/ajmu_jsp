package ajmu;



public aspect TaskFreemindEscape extends TaskEscape {
	//pointcut NoFinaliza():call(void freemind.controller.Controller.close(..));
	pointcut NoFinaliza();
	
	
}
