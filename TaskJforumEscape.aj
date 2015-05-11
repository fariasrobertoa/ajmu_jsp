package ajmu;

public aspect TaskJforumEscape extends TaskEscape{
	pointcut NoFinaliza():execution(void net.jforum.view.forum.UserAction.logout());
}
