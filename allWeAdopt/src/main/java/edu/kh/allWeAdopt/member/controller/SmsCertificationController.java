package edu.kh.allWeAdopt.member.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RestController
public class SmsCertificationController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/member/sms")
	@ResponseBody
	public String sendSMS(@RequestParam("memberTel") String memberTel) throws CoolsmsException{ // 휴대폰 문자보내기
		
		logger.info("인증번호 발송 수행됨");
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		System.out.println("인증번호 : " + randomNumber);

		Message coolsms = new Message( "NCS531VDFXLHXNN7", "2DACFRWLAEC50HPBRQKTWDBBRWG5L6AZ" );

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", memberTel);
        params.put("from", "01089510126");
        params.put("type", "SMS");
        params.put("text", "[ALL WE ADOPT] 인증번호 : " + randomNumber);
        params.put("app_version", "test app 1.2"); // application name and version

	    JSONObject obj = (JSONObject) coolsms.send(params);
	    System.out.println(obj.toString());
	    
	    if(String.valueOf(obj.get("error_count")).equals("0")) {
	    	return randomNumber+"";
	    }else {
	    	return "0";
	    }
	    
	}
	
}
