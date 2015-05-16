package ajmu;

public aspect TaskJforumEscape extends TaskEscape{
	pointcut notComplete():execution(void net.jforum.view.forum.UserAction.logout());
}
