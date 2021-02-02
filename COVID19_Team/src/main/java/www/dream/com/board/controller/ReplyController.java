package www.dream.com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import www.dream.com.board.model.ReplyVO;
import www.dream.com.board.service.ReplyService;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@GetMapping(value = "{replyId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ReplyVO> findReplyById(@PathVariable("replyId") long replyId) {
		return new ResponseEntity<>(replyService.findReplyById(replyId), HttpStatus.OK);
	}

	@PostMapping(value = "new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> registerReply(@RequestBody ReplyVO reply) {
		
		long cnt = replyService.registerReply(reply);
		return cnt == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

