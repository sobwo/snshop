package com.myteam.myapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ArrayUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.domain.PointVo;
import com.myteam.myapp.domain.RefundVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.OrderService;


import com.myteam.myapp.service.PointService;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.service.StyleService;
import com.myteam.myapp.util.MediaUtils;
import com.myteam.myapp.util.UploadFileUtiles;
import com.myteam.myapp.util.UploadProfile;

@Controller
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired  
	BoardService bs; 

	@Autowired
	MemberService ms;
	
	@Autowired
	OrderService os;
	
	@Autowired
	PointService ps;
	
	@Autowired
	ShopService ss;
	
	@Autowired
	StyleService ss1;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "/myPageMain.do")
	public String myPageMain(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		String str[] = date_format();
		String startDate = str[0];
		String endDate = str[1];
		
		MemberVo mv = ms.memberInfo(memberNo);
		ArrayList<OrderDto> ov_purchase = os.selectHistoryAll("buying", memberNo, 0, startDate, endDate, "전체", "up");
		ArrayList<OrderDto> ov_sale = os.selectHistoryAll("selling", memberNo, 0, startDate, endDate, "전체", "up");
		
		int purchaseCntAll = os.cntHistoryAll("buying",memberNo,0,startDate,endDate);
		int purchaseCntIng = os.cntHistoryAll("buying",memberNo,1,startDate,endDate);
		int purchaseCntEnd = os.cntHistoryAll("buying",memberNo,2,startDate,endDate);
		
		int saleCntAll = os.cntHistoryAll("selling",memberNo,0,startDate,endDate);
		int saleCntIng = os.cntHistoryAll("selling",memberNo,1,startDate,endDate);
		int saleCntEnd = os.cntHistoryAll("selling",memberNo,2,startDate,endDate);
		
		model.addAttribute("purchaseCntAll", purchaseCntAll);
		model.addAttribute("purchaseCntIng", purchaseCntIng);
		model.addAttribute("purchaseCntEnd", purchaseCntEnd);
		
		model.addAttribute("saleCntAll", saleCntAll);
		model.addAttribute("saleCntIng", saleCntIng);
		model.addAttribute("saleCntEnd", saleCntEnd);
		
		model.addAttribute("mv", mv);
		model.addAttribute("ov_purchase", ov_purchase);
		model.addAttribute("ov_sale", ov_sale);
		
		return "myPage/myPageMain";
	}
	
	@RequestMapping(value = "/orderHistory.do")
	public String purchase(
			HttpSession session,
			Model model,
			@RequestParam("index") String index,
			@RequestParam(value="value",defaultValue="0") int value,
			@RequestParam(value="filter",defaultValue="전체") String filter,
			@RequestParam(value="price",defaultValue="initial") String price,
			@RequestParam(value="startDate",required = false) String startDate,
			@RequestParam(value="endDate",required = false) String endDate) {
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
//		LocalDate now = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		
//		LocalDate sixMonthsAgo = now.minusMonths(6);
//		
//		String formatedEnd = now.format(formatter);
//		String formatedStart = sixMonthsAgo.format(formatter);
		
		String str[] = date_format();
		
		if(startDate == null) startDate = str[0];
		if(endDate == null) endDate = str[1];
		
		ArrayList<OrderDto> alist = os.selectHistoryAll(index,memberNo,value,startDate,endDate,filter,price);
		int cntAll = os.cntHistoryAll(index,memberNo,0,startDate,endDate);
		int cntIng = os.cntHistoryAll(index,memberNo,1,startDate,endDate);
		int cntEnd = os.cntHistoryAll(index,memberNo,2,startDate,endDate);
		 
		model.addAttribute("alist", alist);
		model.addAttribute("cntAll", cntAll);
		model.addAttribute("cntIng", cntIng);
		model.addAttribute("cntEnd", cntEnd);
		model.addAttribute("filter", filter);
		model.addAttribute("value", value);
		model.addAttribute("price", price);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		if(index.equals("buying"))
			return "myPage/purchase";
		else
			return "myPage/sale";
	}
	
	@RequestMapping(value = "/interest.do")
	public String interest(
			HttpSession session,
			Model model) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		ArrayList<GoodsInterestDto> glist = ss.selectInterestAll(memberNo);
		
		model.addAttribute("glist",glist);
		
		return "myPage/interest";
	}
	
	@RequestMapping(value = "/profileInfo.do")
	public String profileInfo(
			Model model,
			HttpSession session) {
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		model.addAttribute("mv", mv);
		
		return "myPage/profileInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileImgChange.do")
	public String profileImgChange(
			@RequestParam("profileImg") MultipartFile profileImg,
			HttpSession session,
			HttpServletRequest request
			) throws Exception, Exception{
		
		String str = null;
		MultipartFile file = profileImg;
		String uploadedPath = "/uploads";
		String uploadedFileName="";
		if(!file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadProfile.uploadFile(
				uploadedPath, 
				file.getOriginalFilename(),
				file.getBytes(),
				"upload");
		}

		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = new MemberVo();
		mv.setMemberNo(memberNo);
		mv.setProfileImg(uploadedFileName);
		mv.setProfileImgData(file.getBytes());
		
		int value = ms.updateProfileImg(mv);
		
		str = "{\"value\":\""+value+"\"}";
		
		return str; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileImgShow.do")
	public ResponseEntity<Resource> profileImgShow(
			HttpSession session,
			HttpServletRequest request) throws Exception {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		String uploadedPath = "/uploads";
		MemberVo mv = ms.profileImgShow(memberNo);
		
		System.out.println("profileImage" + mv.getProfileImg());
		
		File dir = new File(uploadedPath);
		
		int check = 0;
		String uploadedFileName = null;
		String[] fileList = dir.list();
		
		System.out.println("fileList.length : "+fileList.length);
		
		if(mv.getProfileImg().equals("noImage") && mv.getProfileImgData().equals("noImage")) {
			uploadedFileName = null;
		}
		
		else {
			for(String file : fileList) {
				System.out.println("file 이름 : "+file);
				System.out.println("db file 이름 : "+mv.getProfileImg());
				if(!mv.getProfileImg().contains(file)) {
					check++;
				}
			}
					
			if(check>0) {
				uploadedFileName = UploadProfile.uploadFile(
									uploadedPath, 
									mv.getProfileImg(),
									mv.getProfileImgData(),
									"show");
			}
		}


		
		Path imagePath = Paths.get(uploadedPath, uploadedFileName);
        Resource imageResource = new UrlResource(imagePath.toUri());

        if (imageResource.exists() && imageResource.isReadable()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(imageResource);
        } else {
            return null;
        }
				
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/profileImgDelete.do")
	public String profileImgDelete(
			HttpSession session) throws Exception {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		
		int value = ms.profileImgDelete(memberNo);
		
		String uploadedPath = request.getSession().getServletContext().getResource("/resources/uploadFiles/").getPath();
		
		File directory = new File(uploadedPath);
		File[] files = directory.listFiles();
		for(File file : files) {
		    if(file.delete()) {
		        System.out.println(file.getName() + "삭제");
		    } else {
		        System.out.println(file.getName() + "삭제 불가");
		    }
		}
		
		String str = "{\"value\":\""+value+"\"}";

		return str; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/infoChange.do")
	public String infoChange(
			HttpSession session,
			@RequestParam("index") String index,
			@RequestParam("value") String value) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		if(index.equals("pw"))
			value = bcryptPasswordEncoder.encode(value);
		

		int result = ms.modifyProfile(index, value, memberNo);
		
		String str = "{\"result\":\""+result+"\"}";
		
		return str;
	}
	
	@RequestMapping(value = "/myStyle.do")
	public String myStyle(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist = bs.boardList(memberNo);
				
		model.addAttribute("mv", mv);
		model.addAttribute("llist", llist);

		return "myPage/myStyle";
	}
	
	@ResponseBody
	@RequestMapping(value="/like_check.do" , method=RequestMethod.POST)
	public JSONObject like_check(
			@RequestParam("boardNo") int boardNo,
			LikesVo lv,
			HttpSession session) throws Exception{
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		lv.setBoardNo(boardNo);
		lv.setMemberNo(memberNo);
		
	    int value = bs.likesList(lv);

	    if (value == 0) { 
	    	bs.insertLike(lv);
	    	
	    } else if (value != 0) {
	    	
	        bs.updateLike(lv);
	    }
		
	    int cnt = bs.likesCnt(memberNo, boardNo);
	    
		int totalCntUpdate = bs.likesTotalCntUpdate(lv.getBoardNo());
		
		int totalCnt = bs.likesTotalCnt(lv.getBoardNo());
		
		JSONObject json = new JSONObject();
	    json.put("value", value);
	    json.put("cnt", cnt);
	    json.put("totalCnt", totalCnt);
	    
	    return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("contentsImg") List<String> contentsImgs) throws Exception {
	    InputStream in = null;
	    List<ResponseEntity<byte[]>> entities = new ArrayList<>();

	    try {
	        HttpHeaders headers = new HttpHeaders();
	        String uploadPath = request.getSession().getServletContext().getResource("/resources/uploadFiles/").getPath();

	        for (String contentsImg : contentsImgs) {
	            in = new FileInputStream(uploadPath + contentsImg);

	            String formatName = contentsImg.substring(contentsImg.lastIndexOf(".") + 1);
	            MediaType mediaType = MediaUtils.getMediaType(formatName);

	            if (mediaType != null) {
	                headers.setContentType(mediaType);
	            } else {
	                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	                headers.add("Content-Disposition", "attachment; filename=\"" +
	                        new String(contentsImg.getBytes("UTF-8"), "ISO-8859-1") + "\"");
	            }

	            entities.add(new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED));

	            in.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }

	    return ResponseEntity.status(HttpStatus.OK)
	            .contentType(MediaType.APPLICATION_JSON)
	            .body(entities.stream().flatMap((ResponseEntity<byte[]> entity) ->
	                    Stream.ofNullable(entity.getBody())).reduce(new byte[0], ArrayUtils::addAll));
	}

	@RequestMapping(value = "/myStyle_upload.do")
	public String myStyle_upload() {
		
		return "myPage/myStyle_upload";
	}

	@RequestMapping(value="/myStyle_uploadeAction.do")
	public String myStyleUploadeAction(
			@RequestParam("contentsImg") MultipartFile[] contentsImg,
			@RequestParam("contents") String contents,
			@RequestParam("viewCnt") String viewCnt,
			HttpSession session
			) throws Exception {
		
		String uploadPath = request.getSession().getServletContext().getResource("/resources/uploadFiles/").getPath();
		List<String> uploadedFileNames = new ArrayList<>();
		for (MultipartFile file : contentsImg) {
			if (!file.getOriginalFilename().equals("")) {
				String uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(),
						file.getBytes());
				uploadedFileNames.add(uploadedFileName);
			}
		}
		
		BoardVo bv = new BoardVo();
		bv.setContentsImg(String.join(",", uploadedFileNames));
		bv.setContents(contents);
		bv.setViewCnt(viewCnt);
				
		int memberNo = 0;
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		bv.setMemberNo(memberNo);
		
		int value = bs.boardInsert(bv);

		return "redirect:/myPage/myStyle.do";
	}
	
	

	
	
	
	
	
	
	

	@RequestMapping(value = "/style_discover.do")
	public String style_discover(
			Model model,
			HttpSession session) {
		
		
		
		

//		ArrayList<BoardVo> blist = bs.boardTotalList();
//				System.out.println("blist"+ blist);
//		model.addAttribute("blist", blist);
		
		return "myPage/style_discover.do";
	}
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/address.do")
	public String address(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		ArrayList<AddressVo> alist = os.addressSelect(memberNo);
		
		model.addAttribute("alist",alist);
		
		return "myPage/address";
	}
	
	@RequestMapping(value = "/addressInsert.do")
	public String addressAction(
			HttpSession session,
			RedirectAttributes rttr,
			@RequestParam("basicName") String basicName,
			@RequestParam("basicPhone") String basicPhone,
			@RequestParam("basicAddrNum") String basicAddrNum,
			@RequestParam("basicAddr") String basicAddr,
			@RequestParam("basicAddrDetail") String basicAddrDetail,
			@RequestParam(value="basic_check", defaultValue="N") String basic_check) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int value = os.addressInsert(basicName, basicPhone, basicAddrNum, basicAddr, basicAddrDetail, basic_check, memberNo);
		
		if(value==1) {
			return "redirect:/myPage/address.do";
		}
		else {
			rttr.addFlashAttribute("msg", "주소를 다시 입력해 주세요.");
			return "redirect:/myPage/address.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/addressModify.do")
	public String addressModify(
			@RequestParam("index") int index,
			@RequestParam("basicName") String basicName,
			@RequestParam("basicPhone") String basicPhone,
			@RequestParam("basicAddrNum") String basicAddrNum,
			@RequestParam("basicAddr") String basicAddr,
			@RequestParam("basicAddrDetail") String basicAddrDetail,
			@RequestParam(value="basic_check", defaultValue="N") String basic_check) {
		
		int value = os.addressModify(index, basicName, basicPhone, basicAddrNum, basicAddr, basicAddrDetail, basic_check);
		
		String str = "{\"value\":\""+value+"\"}";
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "/showAddress.do")
	public JSONObject showAddress(
			@RequestParam("index") int index) {
		HashMap<String,Object> map = new HashMap<>();
		AddressVo av = os.addressSelectOne(index);
		
		map.put("av", av);
		
		JSONObject js = new JSONObject(map);
		
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAddress.do")
	public String deleteAddress(
			@RequestParam("index") int index) {
		
		int value = os.addressDelete(index);
		
		String str = "{\"value\":\""+value+"\"}";

		return str;
	}
	
	@RequestMapping(value = "/incomeAccount.do")
	public String incomeAccount(
			HttpSession session,
			Model model) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		RefundVo rv = ms.selectAccount(memberNo);
		
		model.addAttribute("rv", rv);
		
		return "myPage/incomeAccount";
	}
	
	@RequestMapping(value = "/incomeAccountAction.do")
	public String incomeAccountAction(
			@RequestParam("ar_bankName") String ar_bankName,
			@RequestParam("ar_accountNum") String ar_accountNum,
			@RequestParam("ar_name") String ar_name,
			HttpSession session){
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int value = ms.insertAccount(ar_bankName,ar_accountNum,ar_name,memberNo);
		
		if(value==1)
			return "redirect:/myPage/incomeAccount.do";
		else
			return "myPage/incomeAccount";
	}
	
	@RequestMapping(value = "/incomeAccountModify.do")
	public String incomeAccountModify(
			@RequestParam("ar_bankName") String ar_bankName,
			@RequestParam("ar_accountNum") String ar_accountNum,
			@RequestParam("ar_name") String ar_name,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		ms.modifyAccount(ar_bankName, ar_accountNum, ar_name, memberNo);
		
		return "redirect:/myPage/incomeAccount.do";
		
		
	}
	
	@RequestMapping(value = "/point.do")
	public String point(
			Model model,
			HttpSession session) throws Exception {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberPointVo mpv = ps.selectMemberPointAll(memberNo);
		
		ArrayList<PointVo> plist = ps.selectPointAll(memberNo);
		
		model.addAttribute("mpv", mpv);
		model.addAttribute("plist", plist);
		
		return "myPage/point";
	}
	
	@RequestMapping(value = "/couponAction.do")
	public String couponAction(
			@RequestParam("couponNum") String couponNum,
			@RequestParam(value="index") String index,
			HttpSession session,
			Model model,
			RedirectAttributes rttr
			) throws Exception{
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int resultUse = ps.checkCouponUse(couponNum);

		if(resultUse==3) {
			int value = ps.insertPoint(memberNo,index,couponNum);
			if(value==1) {
				rttr.addFlashAttribute("msg", "쿠폰이 등록되었습니다.");
				return "redirect:/myPage/point.do";
			}
			else {
				rttr.addFlashAttribute("msg", "쿠폰등록이 취소되었습니다(오류)");
				return "redirect:/myPage/point.do";
			}	
		}
		
		else if(resultUse==2) {
			rttr.addFlashAttribute("msg", "만료된 쿠폰입니다.");
			return "redirect:/myPage/point.do";
		}
		
		else if(resultUse==1) {
			rttr.addFlashAttribute("msg", "이미 사용한 쿠폰번호 입니다.");
			return "redirect:/myPage/point.do";
		}
		
		else {
			rttr.addFlashAttribute("msg", "쿠폰 번호가 일치하지 않습니다.");
			return "redirect:/myPage/point.do";
		}
		
	}
	
	
	@RequestMapping(value = "/payAccount.do")
	public String payAccount() {
		
		return "myPage/payAccount";
	}
	
	
	//관리자 페이지
	@RequestMapping(value = "/couponAddAction.do")
	public String couponAddAction(
			HttpSession session,
			RedirectAttributes rttr,
			@RequestParam("couponName") String couponName,
			@RequestParam("couponNum") String couponNum,
			@RequestParam("point") int point,
			@RequestParam("usePeriod") String usePeriod) {
		
		int value = ps.insertCoupon(couponName, couponNum, point, usePeriod);
		
		if(value > 0) {
			rttr.addFlashAttribute("msg", "쿠폰 등록 완료");
			return "redirect:/myPage/point.do";
		}
		else {
			rttr.addFlashAttribute("msg", "쿠폰 등록 실패");
			return "redirect:/myPage/point.do";
		}
	}
	
	//기타 공용 함수
	public String[] date_format() {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate sixMonthsAgo = now.minusMonths(6);
		
		String formatedEnd = now.format(formatter);
		String formatedStart = sixMonthsAgo.format(formatter);
		
		String str[] = {formatedStart,formatedEnd};
		
		return str;
	}
	
	

	
	
}