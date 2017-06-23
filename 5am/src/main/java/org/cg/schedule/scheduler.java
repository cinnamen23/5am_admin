package org.cg.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.scheduling.annotation.Scheduled;


public class scheduler {

	@Scheduled(cron = "*/5 * * * * *")
	public void scheduleRun() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("스케줄 실행 1 : " + dateFormat.format(calendar.getTime()));
		// System.out.println("Request " + getCurrentRequest());
	}

}