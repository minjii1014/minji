package www.dream.com.attachFile.model.mapper;

import java.util.List;

import www.dream.com.attachFile.model.AttachVO;
import www.dream.com.attachFile.model.IAttacher;

public interface AttachMapper {
	public List<AttachVO> listAttach(AttachVO attachVO);
	public void createAttach(IAttacher owner);
	public void deleteAttach(IAttacher owner);
}
