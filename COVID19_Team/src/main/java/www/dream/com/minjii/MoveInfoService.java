package www.dream.com.minjii;
 
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
 
 
@Service
public class MoveInfoService {
 
    public Object getItemsFromOpenApi(String regId, String time) throws UnsupportedEncodingException {
        
        String url = "http://openapi.seoul.go.kr:8088/sample/json/Corona19Status/1/5/";
        String serviceKey = "서비스키";
        String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
        
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));    //Response Header to UTF-8  
        
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
                /*.queryParam("serviceKey", decodeServiceKey)
                .queryParam("regId", regId)
                .queryParam("tmFc", time)
                .queryParam("_type", "json")
                .build(false);    //자동으로 encode해주는 것을 막기 위해 false*/
        
        Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
        return response;
    }
}
