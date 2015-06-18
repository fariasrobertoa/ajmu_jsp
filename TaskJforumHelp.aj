package ajmu;

import ajmu.logger.usability.LoggerJaxb;

abstract aspect TaskJforumHelp extends TaskHelp{
	pointcut accessDocumentation();
	@Override
	LoggerJaxb logEvent() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
