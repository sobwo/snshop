package com.myteam.myapp.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.myapp.domain.RefundVo;
import com.myteam.myapp.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
@RequestMapping(value = "/Iamport")
public class IamportController {
   @Autowired
   PaymentService ps;
   
   private IamportClient api;

    public IamportController() {
        this.api = new IamportClient("2780751757484782","oQH1UyykG80Iw7yAgy8W5zwsim6KvZbIX3moFFYPITFcrwh4TK9OyPoO25UvFS0V8Qv45gSWkGa8W5A9");
    }
    
    public IamportResponse<Payment> paymentLookup(String impUid) throws IamportResponseException, Exception{
      return api.paymentByImpUid(impUid);
   }
    
    @RequestMapping(value="/verifyIamport.do")
    public JSONObject paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session,
            @RequestBody Map<String,String> map) throws IamportResponseException, Exception{
       
       IamportResponse<Payment> irsp = paymentLookup(map.get("imp_uid")); 
       
      int memberNo = 0;
      
      if(session.getAttribute("memberNo") != null) {
         memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
      }
       
       HashMap<String, Object> hm = ps.verifyPayment(irsp,map,memberNo);
       
       JSONObject json = new JSONObject(hm);

        return json;
    }
    
    @RequestMapping(value="/cancelIamport.do")
    public String cancelIamport(
          @RequestBody Map<String,String> map,
          RefundVo rv,
          HttpSession session,
          RedirectAttributes rttr) throws IamportResponseException, Exception {

      IamportResponse<Payment> irsp = paymentLookup(map.get("impUid"));
      String payMethod = irsp.getResponse().getPayMethod();
      String buyerName = irsp.getResponse().getBuyerName();
      
      int memberNo = 0;
      
      if(session.getAttribute("memberNo") != null) {
         memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
      }
      
      rv = ps.refundSelect(memberNo);
      
      if(payMethod.equals("vbank")) {
         if(rv == null) {
            rttr.addFlashAttribute("msg", "환불 정산 계좌가 등록되지 않았습니다.");
            return "redirect:/myPage/incomeAccount";
         }
         
         else if(buyerName.equals(rv.getAccountUserName())) {
            map.put("bank_name", rv.getAccountName());
            map.put("refund_account", rv.getAccountNum());
         }   
      }
      
      CancelData data = ps.cancelData(irsp,map);
      IamportResponse<Payment> cancel = api.cancelPaymentByImpUid(data);
      
      if(cancel != null) 
         return "success";
      else
         return "fail";
    }    
}