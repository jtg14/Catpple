package sendmessage;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class Send {
	
  public static void main(String[] args) {
    String api_key = "NCSB3G8DCSUDW2HM";
    String api_secret = "M2B9UISVKQ3MUBWNAFENPVPZHCIVRTLF";
    Message coolsms = new Message(api_key, api_secret);
    String number = numberGen(6,1);
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", "01041382383");
    params.put("from", "01041382383");
    params.put("type", "SMS");
    params.put("text", "(주)캣플 회원가입 인증번호 ("+number+") 입니다. 감사합니다  -Catpple");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
  public static String numberGen(int len, int dupCd ) {
      
      Random rand = new Random();
      String numStr = ""; //난수가 저장될 변수
      
      for(int i=0;i<len;i++) {
          
          //0~9 까지 난수 생성
          String ran = Integer.toString(rand.nextInt(10));
          
          if(dupCd==1) {
              //중복 허용시 numStr에 append
              numStr += ran;
          }else if(dupCd==2) {
              //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
              if(!numStr.contains(ran)) {
                  //중복된 값이 없으면 numStr에 append
                  numStr += ran;
              }else {
                  //생성된 난수가 중복되면 루틴을 다시 실행한다
                  i-=1;
              }
          }
      }
      return numStr;
  }
}
