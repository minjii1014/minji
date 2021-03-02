package www.dream.com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.ReplyVO;
import www.dream.com.board.service.ReplyService;
import www.dream.com.framework.dataType.Pair;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@GetMapping(value = "countTotalReply/{originalId}")
	public ResponseEntity<Long> countTotalReply(
			@PathVariable("originalId") long originalId) {
		return new ResponseEntity<>(replyService.countTotalReply(originalId), HttpStatus.OK);
	}
	
	@GetMapping(value = "pages/{originalId}/{pageNum}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Pair<Criteria, List<ReplyVO>>> listReply(
		@PathVariable("originalId") long originalId, 
		@PathVariable("pageNum") long pageNum) {
			Criteria criteria = new Criteria(pageNum, replyService.countTotalReply(originalId));
			List<ReplyVO> listReply = replyService.listReply(originalId, criteria);
			Pair<Criteria, List<ReplyVO>> dreamPair = new Pair<>(criteria, listReply);
			return new ResponseEntity<>(dreamPair, HttpStatus.OK);
		}
	
	@GetMapping(value = "{id}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ReplyVO> findReplyById(@PathVariable("id") long id) {
		return new ResponseEntity<>(replyService.findReplyById(id), HttpStatus.OK);
	}

	@PostMapping(value = "new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> registerReply(@RequestBody ReplyVO reply, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		reply.setUserId(userId);
		long cnt = replyService.registerReply(reply);
		return cnt == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{id}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateReply(@PathVariable("id") long id, @RequestBody ReplyVO reply){
		return replyService.updateReply(reply) ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
	
	@DeleteMapping(value = "{id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeReply(@PathVariable("id") long id) {
		return replyService.removeReply(id) ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}