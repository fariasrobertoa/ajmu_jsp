package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskJforumException extends TaskException{
	@Override
	LoggerJaxb logEvent() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
