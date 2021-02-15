package www.dream.com.mapTest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class Please {
	public String getAddress_DAUM(String lati, String longi) {
		try{
			final String APPKEY = "4f2dd7e4bc5fdd4c16a578f03d42b1f8";
			final String API_URL = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x"+longi+"&y="+lati+"input_coord=WGS84";
			
			HttpHeaders headers = new HttpHeaders();
			//headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
			headers.add("Authorization", "KakaoAK" + APPKEY);
			
			MultiValueMap <String, String> parameters = new LinkedMultiValueMap<String, String>();
			
			parameters.add("x", longi);
			parameters.add("y", lati);
			parameters.add("input_coord", "WGS84");
			
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> result = restTemplate.exchange(API_URL ,HttpMethod.GET, new HttpEntity(headers), String.class);
			// 짜잔
			System.out.println(result.getBody());
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result.getBody());       
			JSONArray jsonArray = (JSONArray)jsonObject.get("documents");
			
			JSONObject local = (JSONObject)jsonArray.get(0);
			JSONObject jsonArray1 = (JSONObject)local.get("address");
			String localAddress = (String)jsonArray1.get("address_name");

			return localAddress;
			
			}catch(Exception e){
				e.printStackTrace();
				return "error";
			}
	}
}
