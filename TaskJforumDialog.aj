package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskJforumDialog extends TaskDialog{
	@Override
	 LoggerJaxb logEvent() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
