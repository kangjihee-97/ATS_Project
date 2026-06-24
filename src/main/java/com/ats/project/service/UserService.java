package com.ats.project.service;

import java.util.List;
import com.ats.project.model.UserVO;

public interface UserService {
    UserVO       login(UserVO vo);
    int          idCheck(String userId);
    void         register(UserVO vo);
    List<UserVO> getUserList();
    int          updateUserRole(String userId, String role);
    int          updateUserStatus(String userId, String status);
    void         forceDeleteUser(String userId);
    int          updateProfile(UserVO vo);
    int          emailCheck(UserVO vo);
    int          phoneCheck(UserVO vo);
    boolean checkPhoneDup(String phone);
    boolean checkEmailDup(String email);
    UserVO  getUserDetail(String userId);
    int     updateMyInfo(UserVO vo);
    int     updatePassword(UserVO vo);
    UserVO findUserByIdAndEmail(String userId, String email);
	int countByEmail(String email);
	int countByPhone(String phone);
	
}