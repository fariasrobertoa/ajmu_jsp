package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskJforumEscape extends TaskEscape{
	pointcut notComplete():execution(void net.jforum.view.forum.UserAction.logout());
	@Override
	 LoggerJaxb logEvent() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
