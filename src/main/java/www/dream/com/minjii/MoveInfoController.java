/*
package www.dream.com.minjii;
 
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller
public class MoveInfoController {
    
    @Autowired
    MoveInfoService moveInfoService;
    
    @RequestMapping(value="/getData", method=RequestMethod.GET)
    public String toHome() {
        return "home";
    }
    
    @RequestMapping(value="/getData", method=RequestMethod.POST)
    @ResponseBody
    public Object getData(@RequestBody DTO4Request request) throws UnsupportedEncodingException {
        String regId = request.getRegId();
        String time = request.getTmFc();
        Object response =  moveInfoService.getItemsFromOpenApi(regId, time);
        return response;
    }
 
}
*/