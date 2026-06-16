package com.ats.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.ats.project.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public UserVO login(UserVO vo) {
        return sqlSession.selectOne("com.ats.project.dao.UserDAO.login", vo);
    }
    
    @Override
    public int idCheck(String userId) {
        return sqlSession.selectOne("com.ats.project.dao.UserDAO.idCheck", userId);
    }
    
    @Override
    public void register(UserVO vo) {
        sqlSession.insert("com.ats.project.dao.UserDAO.register", vo);
    }
    
    @Override
    public List<UserVO> getUserList() {
        return sqlSession.selectList("com.ats.project.dao.UserDAO.getUserList");
    }

    @Override
    public int updateUserRole(UserVO vo) {
        return sqlSession.update("com.ats.project.dao.UserDAO.updateUserRole", vo);
    }

    @Override
    public int updateUserStatus(UserVO vo) {
        return sqlSession.update("com.ats.project.dao.UserDAO.updateUserStatus", vo);
    }

    @Override
    public int clearJobPostingRef(String userId) {
        return sqlSession.update("com.ats.project.dao.UserDAO.clearJobPostingRef", userId);
    }

    @Override
    public int clearStageHistoryRef(String userId) {
        return sqlSession.update("com.ats.project.dao.UserDAO.clearStageHistoryRef", userId);
    }

    @Override
    public int deleteUserEvals(String userId) {
        return sqlSession.delete("com.ats.project.dao.UserDAO.deleteUserEvals", userId);
    }

    @Override
    public int deleteUserSchedules(String userId) {
        return sqlSession.delete("com.ats.project.dao.UserDAO.deleteUserSchedules", userId);
    }

    @Override
    public int deleteUser(String userId) {
        return sqlSession.delete("com.ats.project.dao.UserDAO.deleteUser", userId);
    }

    @Override
    public int checkPhoneDup(String phone) {
        return sqlSession.selectOne("com.ats.project.dao.UserDAO.checkPhoneDup", phone);
    }
    
    @Override
    public int checkEmailDup(String email) {
        return sqlSession.selectOne("com.ats.project.dao.UserDAO.checkEmailDup", email);
    }
    
    @Override
    public int updateMyInfo(UserVO vo) {
        return sqlSession.update("com.ats.project.dao.UserDAO.updateMyInfo", vo);
    }

    @Override
    public int updatePassword(UserVO vo) {
        return sqlSession.update("com.ats.project.dao.UserDAO.updatePassword", vo);
    }
    
    @Override
    public UserVO getUserDetail(String userId) {
        return sqlSession.selectOne("com.ats.project.dao.UserDAO.getUserDetail", userId);
    }

	@Override
	public int updateProfile(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int emailCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int phoneCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO findUserByIdAndEmail(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int countByEmail(String email) {
		return sqlSession.selectOne("com.ats.project.dao.UserDAO.countByEmail", email);
	}

	@Override
	public int countByPhone(String phone) {
		return sqlSession.selectOne("com.ats.project.dao.UserDAO.countByPhone", phone);
	}
}