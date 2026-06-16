package com.ats.project.service;

import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.ScheduleVO;
import com.ats.project.model.UserVO;

public interface ScheduleService {
	List<ScheduleVO> getScheduleList();

	List<ScheduleVO> getScheduleByInterviewer(String interviewerId);

	ScheduleVO getSchedule(int scheduleId);

	int insertSchedule(ScheduleVO vo);

	int updateSchedule(ScheduleVO vo);

	int doneSchedule(int scheduleId);

	int cancelSchedule(int scheduleId);

	boolean checkConflict(ScheduleVO vo);

	List<UserVO> getInterviewerList();

	List<ApplicationVO> getApplicationList();

	boolean checkConflictForUpdate(int scheduleId, String scheduledAt);

	int updateScheduledTime(int scheduleId, String scheduledAt);
}