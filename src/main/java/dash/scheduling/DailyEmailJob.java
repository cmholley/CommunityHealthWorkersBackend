package dash.scheduling;


import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;

import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import dash.dao.ClassDao;
import dash.dao.ClassEntity;


//This TimerTask is designed to run every day at midnight. 
//It will retrieve all of the studies with a start date
//Of the current day and then initialize the job for them based of off the survey.

public class DailyEmailJob extends TimerTask{
	
	private ServletContextEvent servletContextEvent;

	public DailyEmailJob(ServletContextEvent servletContextEvent){
		this.servletContextEvent = servletContextEvent;
	}
	
	
	
	@Override
	public void run() {	
		ApplicationContext springContext = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContextEvent.getServletContext());
		AutowireCapableBeanFactory factory = springContext.getAutowireCapableBeanFactory();
		
		ClassDao classDao = factory.getBean(ClassDao.class);
		List<ClassEntity> todaysClasses = classDao.getTodaysClasses();
		
		HashMap<ClassEntity, List<String>> classesAndEmails;
		
		for(ClassEntity classEntity : todaysClasses){
			List<String> membersForClass = classDao.getMembersForClass(classEntity);
			
			
		}
		
		
		
	}

}
