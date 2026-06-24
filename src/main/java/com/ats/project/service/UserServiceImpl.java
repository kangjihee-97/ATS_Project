package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.UserDAO;
import com.ats.project.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // ← BCrypt 추가

	@Override
	public UserVO login(UserVO vo) {
		return userDAO.login(vo);
		// ※ 비밀번호 비교는 LoginController 에서 matches() 로 처리
	}

	@Override
	public int idCheck(String userId) {
		return userDAO.idCheck(userId);
	}

	@Override
	public void register(UserVO vo) {
		if (vo.getRole() == null || vo.getRole().isEmpty()) {
			vo.setRole("INTERVIEWER");
		}
		// ← BCrypt 추가: 비밀번호 암호화 후 저장
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		userDAO.register(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		return userDAO.getUserList();
	}

	@Override
	public UserVO findUserByIdAndEmail(String userId, String email) {
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setEmail(email);
		return userDAO.findUserByIdAndEmail(vo);
	}

	@Override
	public boolean checkPhoneDup(String phone) {
		return userDAO.checkPhoneDup(phone) > 0;
	}

	@Override
	public boolean checkEmailDup(String email) {
		return userDAO.checkEmailDup(email) > 0;
	}

	@Override
	public UserVO getUserDetail(String userId) {
		return userDAO.getUserDetail(userId);
	}

	@Override
	public int updateMyInfo(UserVO vo) {
		return userDAO.updateMyInfo(vo);
	}

	@Override
	public int updatePassword(UserVO vo) {
		// ← BCrypt 추가: 새 비밀번호 암호화 후 저장
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		return userDAO.updatePassword(vo);
	}

	@Override
	public int updateUserRole(String userId, String role) {
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setRole(role);
		return userDAO.updateUserRole(vo);
	}

	@Override
	public int updateUserStatus(String userId, String status) {
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setStatus(status);
		return userDAO.updateUserStatus(vo);
	}

	@Override
	public void forceDeleteUser(String userId) {
		userDAO.clearJobPostingRef(userId);
		userDAO.clearStageHistoryRef(userId);
		userDAO.deleteUserEvals(userId);
		userDAO.deleteUserSchedules(userId);
		userDAO.deleteUser(userId);
	}

	@Override
	public int updateProfile(UserVO vo) {
		return userDAO.updateProfile(vo);
	}

	@Override
	public int emailCheck(UserVO vo) {
		return userDAO.emailCheck(vo);
	}

	@Override
	public int phoneCheck(UserVO vo) {
		return userDAO.phoneCheck(vo);
	}

	@Override
	public int countByEmail(String email) {
		return userDAO.countByEmail(email);
	}

	@Override
	public int countByPhone(String phone) {
		return userDAO.countByPhone(phone);
	}
}