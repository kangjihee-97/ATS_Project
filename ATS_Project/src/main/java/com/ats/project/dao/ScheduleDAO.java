package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.ScheduleVO;
import com.ats.project.model.UserVO;

@Mapper
public interface ScheduleDAO {
	List<ScheduleVO> getScheduleList();

	List<ScheduleVO> getScheduleByInterviewer(String interviewerId);

	ScheduleVO getSchedule(int scheduleId);

	int insertSchedule(ScheduleVO vo);

	int updateSchedule(ScheduleVO vo);

	int doneSchedule(int scheduleId);

	int cancelSchedule(int scheduleId);

	int checkConflict(ScheduleVO vo);

	List<UserVO> getInterviewerList();

	List<ApplicationVO> getApplicationList();

	int checkConflictForUpdate(@Param("scheduleId") int scheduleId, @Param("scheduledAt") String scheduledAt);

	int updateScheduledTime(@Param("scheduleId") int scheduleId, @Param("scheduledAt") String scheduledAt);
}