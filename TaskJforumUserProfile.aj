package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskJforumUserProfile extends TaskUserProfile{
	@Override
	LoggerJaxb logProfile() {
		// TODO Auto-generated method stub
		return TaskLogXML.aspectOf().log();
	}
}
