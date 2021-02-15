package www.dream.com.location.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.dream.com.board.service.BoardService;
import www.dream.com.location.model.LocationVO;
import www.dream.com.location.service.LocationService;

@Controller
@RequestMapping("/map/*")
public class LocationContorller {

	@Autowired
	private LocationService locationService;

	@GetMapping("getData")
	public void registerPost() {
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertMpa(LocationVO locationVO, Model model) {
		System.err.println(locationVO.getLocationX());
		locationService.insertLocation(locationVO.getLocationX(), locationVO.getLocationY());
		
		return "/map/insert";
	}

//	내꺼는 될텐데 왜 충돌이 나지?

}
