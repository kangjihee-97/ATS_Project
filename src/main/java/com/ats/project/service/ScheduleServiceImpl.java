package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.ScheduleDAO;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.ScheduleVO;
import com.ats.project.model.UserVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    private final UserServiceImpl userServiceImpl;

	@Autowired
	private ScheduleDAO scheduleDAO;

    ScheduleServiceImpl(UserServiceImpl userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

	@Override
	public List<ScheduleVO> getScheduleList() {
		return scheduleDAO.getScheduleList();
	}

	@Override
	public List<ScheduleVO> getScheduleByInterviewer(String interviewerId) {
		return scheduleDAO.getScheduleByInterviewer(interviewerId);
	}

	@Override
	public ScheduleVO getSchedule(int scheduleId) {
		return scheduleDAO.getSchedule(scheduleId);
	}

	@Override
	public int insertSchedule(ScheduleVO vo) {
		return scheduleDAO.insertSchedule(vo);
	}

	@Override
	public int updateSchedule(ScheduleVO vo) {
		return scheduleDAO.updateSchedule(vo);
	}

	@Override
	public int doneSchedule(int scheduleId) {
		return scheduleDAO.doneSchedule(scheduleId);
	}

	@Override
	public int cancelSchedule(int scheduleId) {
		return scheduleDAO.cancelSchedule(scheduleId);
	}

	@Override
	public boolean checkConflict(ScheduleVO vo) {
		return scheduleDAO.checkConflict(vo) > 0;
	}

	@Override
	public List<UserVO> getInterviewerList() {
		return scheduleDAO.getInterviewerList();
	}

	@Override
	public List<ApplicationVO> getApplicationList() {
		return scheduleDAO.getApplicationList();
	}

	@Override
	public boolean checkConflictForUpdate(int scheduleId, String scheduledAt) {
		return scheduleDAO.checkConflictForUpdate(scheduleId, scheduledAt) > 0;
	}

	@Override
	public int updateScheduledTime(int scheduleId, String scheduledAt) {
		return scheduleDAO.updateScheduledTime(scheduleId, scheduledAt);
	}
}