package org.cg.schedule;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.cg.domain.AdGifVO;
import org.cg.service.ADMakerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

public class scheduler {
	private static final Logger logger = LoggerFactory.getLogger(scheduler.class);

<<<<<<< Upstream, based on branch 'master' of https://github.com/kick07230723/5AM.git
	@Scheduled(cron = "00 0 1 * * *")
=======
	@Inject
	ADMakerService service;

	@Scheduled(cron = "*/30 * * * * *")
>>>>>>> d219a14 gif폴더 삭제
	public void scheduleRun() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("스케줄 실행 1 : " + dateFormat.format(calendar.getTime()));
		// System.out.println("Request " + getCurrentRequest());

		List<AdGifVO> list = service.deladdlist();

		System.out.println(list);

		String dirpath = "C:\\zzz\\5am\\";
		String elvname;
		String gifname;

		for (AdGifVO vo : list) {
			System.out.println(vo);
			// 낱개 삭제
			elvname = vo.getElvname();
			gifname = vo.getGifname();
			String delpath[] = { dirpath + elvname + "\\" + vo.getTarget1() + "\\" + gifname,
								dirpath + elvname + "\\" + vo.getTarget2() + "\\" + gifname,
								dirpath + elvname + "\\" + vo.getTarget3() + "\\" + gifname,
								dirpath + elvname + "\\" + vo.getTarget4() + "\\" + gifname };

			for (int i = 0; i < 4; i++) {

				if (new File(delpath[i]).delete()) {
					logger.info("파일 성공적으로 지웠습니다: " + delpath[i]);
				} else {
					logger.info("파일 지우기 실패: " + delpath[i]);
				}
			}

		}

		

	}

}