package com.ats.project.dao;

import com.ats.project.model.ApplicationVO;
import com.ats.project.model.StageHistoryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ApplicationVO> getApplicationList() {
		return sqlSession.selectList("com.ats.project.dao.ApplicationDAO.getApplicationList");
	}

	@Override
	public ApplicationVO getApplication(int applicationId) {
		return sqlSession.selectOne("com.ats.project.dao.ApplicationDAO.getApplication", applicationId);
	}

	@Override
	public List<ApplicationVO> getPipelineList() {
		return sqlSession.selectList("com.ats.project.dao.ApplicationDAO.getPipelineList");
	}

	@Override
	public List<com.ats.project.model.PostingVO> getOpenPostingList() {
		return sqlSession.selectList("com.ats.project.dao.ApplicationDAO.getOpenPostingList");
	}

	@Override
	public int updateStage(ApplicationVO vo) {
		return sqlSession.update("com.ats.project.dao.ApplicationDAO.updateStage", vo);
	}

	@Override
	public int insertApplication(ApplicationVO vo) {
		return sqlSession.insert("com.ats.project.dao.ApplicationDAO.insertApplication", vo);
	}

	@Override
	public int insertStageHistory(StageHistoryVO vo) {
		return sqlSession.insert("com.ats.project.dao.ApplicationDAO.insertStageHistory", vo);
	}

	@Override
	public List<ApplicationVO> getHistoryList() {
		return sqlSession.selectList("com.ats.project.dao.ApplicationDAO.getHistoryList");
	}

	@Override
	public int resetStage(int applicationId) {
		return sqlSession.update("com.ats.project.dao.ApplicationDAO.resetStage", applicationId);
	}

	// ✅ 서버사이드 페이징 추가
	@Override
	public List<ApplicationVO> getHistoryListPaged(int offset, int size, String filter) {
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		params.put("filter", filter);
		return sqlSession.selectList("com.ats.project.dao.ApplicationDAO.getHistoryListPaged", params);
	}

	@Override
	public int getHistoryCount(String filter) {
		Map<String, Object> params = new HashMap<>();
		params.put("filter", filter);
		return sqlSession.selectOne("com.ats.project.dao.ApplicationDAO.getHistoryCount", params);
	}
}