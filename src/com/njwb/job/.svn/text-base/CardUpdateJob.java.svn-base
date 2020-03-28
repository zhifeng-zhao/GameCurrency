package com.njwb.job;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.StatefulJob;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.njwb.pojo.Card;
import com.njwb.service.CardService;

/**
 * 继承定时任务类
 * 实现StatefulJob接口，表示该定时任务不可同时执行，只能单线执行
 * @author Administrator
 *
 */
public class CardUpdateJob extends QuartzJobBean implements StatefulJob{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	private CardService cardService;
	
	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	/**
	 * 定时任务的入口方法
	 */
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		long logid = System.currentTimeMillis();
		log.info(logid + ",定时任务开始--------");
		log.info("密保卡状态更新");
		List<Card> cardList = cardService.selectAllCards();
		for (Card card : cardList) {
			Date startTime = card.getCardStartTime();
			Date endTime = card.getCardEndTime();
			Integer status = card.getCardStatus();
			Date now = new Date();
			// 可以跳过的状态
			if (now.before(startTime) && status == 1) continue;
			else if (now.after(startTime) && now.before(endTime) && status == 2) continue;
			else if (now.after(endTime) && status == 4) continue;
			else if (status == 3) continue;
			// 需要更新的状态
			if (now.before(startTime) && status != 1) status = 1;
			else if (now.after(startTime) && now.before(endTime) && status != 2) status = 2;
			else if (now.after(endTime) && status != 4) status = 4;
			log.info("更新前密保卡" + card.toString());
			card.setCardStatus(status);
			log.info("更新后密保卡" + card.toString());
			cardService.updateCardByNumber(card);
		}
		log.info(logid + ",定时任务结束===========");
	}
}
