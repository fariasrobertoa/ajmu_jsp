package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskJforumMessage extends TaskMessage{
	@Override
	LoggerJaxb logEvent() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
