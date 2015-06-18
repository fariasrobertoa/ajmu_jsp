package ajmu;

import ajmu.logger.usability.LoggerJaxb;

public aspect TaskLogXML extends TaskLog{
	
	private static final LoggerJaxb logJaxb = new LoggerJaxb();
	@Override
	void initTask(Task t) {
		// TODO Auto-generated method stub
		logJaxb.addTask(t.getId(), t.getState());
	}
	
	@Override
	void endTask(Task t) {
		// TODO Auto-generated method stub
		logJaxb.addLogFinal(t.getState(), t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon(),t.timeOfExecution(),t.getSat1(),t.getSat2(),t.getSat3());
	}
	
	@Override
	void events(Task t) {
		// TODO Auto-generated method stub
		logJaxb.addLogPartial(t.getState(),t.getTotalAccessDocumentation(), t.getTotalDialogs(), t.getTotalExceptions(), t.getTotalMessError(), t.getTotalMessInfo(), t.getTotalMessQuestion(), t.getTotalMessWarn(), t.getTotalMessWithoutIcon());
	}
	
	@Override
	LoggerJaxb log() {
		// TODO Auto-generated method stub
		return logJaxb;
	}
}
