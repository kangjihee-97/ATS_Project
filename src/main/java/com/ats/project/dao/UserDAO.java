package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.UserVO;

@Mapper
public interface UserDAO {
    UserVO       login(UserVO vo);
    int          idCheck(String userId);
    void         register(UserVO vo);
    List<UserVO> getUserList();
    int          updateUserRole(UserVO vo);
    int          updateUserStatus(UserVO vo);
    int          clearJobPostingRef(String userId);
    int          clearStageHistoryRef(String userId);
    int          deleteUserEvals(String userId);
    int          deleteUserSchedules(String userId);
    int          deleteUser(String userId);
    int          checkPhoneDup(String phone);
    int          checkEmailDup(String email);
    int          updateMyInfo(UserVO vo);
    int          updatePassword(UserVO vo);
    UserVO       getUserDetail(String userId);
    int          updateProfile(UserVO vo);   // ← 추가
    int          emailCheck(UserVO vo);      // ← 추가
    int          phoneCheck(UserVO vo);      // ← 추가
    UserVO findUserByIdAndEmail(UserVO vo);
	int countByEmail(String email);
	int countByPhone(String phone);
}