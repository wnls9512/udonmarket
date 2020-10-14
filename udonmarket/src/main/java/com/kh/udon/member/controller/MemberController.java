package com.kh.udon.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.email.Email;
import com.kh.email.EmailSender;
import com.kh.udon.common.util.Utils;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Block;
import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Noti;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.member.model.vo.announce;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@SessionAttributes(value = { "loginMember" })
@Slf4j
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email emailVo;
	
	@RequestMapping(value="/memberLoginSuccess.do")
	public ModelAndView memberLoginSuccess(ModelAndView mav, 
										   HttpSession session, 
										   @RequestParam String userId, 
										   @RequestParam String password){
		if(log.isDebugEnabled()) {
			log.debug("/member/memberLoginSuccess.do");
//			log.debug("userId = {}", userId);
//			log.debug("password = {}", password);
		}
		//로그인전 이동하려던 페이지가 있던 경우, 이동할 페이지 처리
		//SavedRequest는 
		String loc = "";
		SavedRequest savedRequest =
			    (SavedRequest)session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
		Optional<SavedRequest> maybeSavedRequest = Optional.ofNullable(savedRequest);
		loc = maybeSavedRequest.map(o -> o.getRedirectUrl())
							   .orElse("/");
		log.debug("loc@loginSuccess="+loc);
		//view단 지정
//		mav.setViewName("redirect:"+loc);
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 로그인
	@RequestMapping("/loginForm")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}

	// 회원가입
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET)
	public String memberSignup() {
		return "member/memberSignupForm";
	}

	@RequestMapping(value = "/signupForm", method = RequestMethod.POST)
	public String memberSignup(Member member, RedirectAttributes redirectAttr) {
		log.debug("member@controller = {}", member);

		String rawPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptPassword);

		log.debug("rawPassword@controller = {}", rawPassword);
		log.debug("encryptPassword@controller = {}", encryptPassword);
		
		
		Map<String, Object> map = new HashMap<>();
		List<Integer> list = new ArrayList<>();
		
		for(int i = 1; i <= 26; i++)
		    list.add(i);

		map.put("list", list);
		map.put("userId", member.getUserId());
		map.put("password", member.getPassword());
		map.put("email", member.getEmail());
		map.put("nickName", member.getNickName());

		
				
		int result = service.insertMemberLocAuthScoreEvaluate(map);
		
		
		log.debug("result@controller = {}", result);

		String msg = (result > 0) ? "회원가입성공!" : "회원가입실패!";
		log.debug("msg@controller = " + msg);
		redirectAttr.addFlashAttribute("msg", msg);

		return "redirect:/";
	}

//	@RequestMapping(value="/login" ,method=RequestMethod.POST)
//	public String memberLogin(@RequestParam String userId, @RequestParam String password, Model model,
//			RedirectAttributes redirectAttr, HttpSession session) {
//
//		log.debug("userId = {}, password = {}", userId, password);
//		Member member = service.selectOneMember(userId);
//		log.debug("member = {}", member);
//
//		String location = "/";
//
//		// 로그인 성공
//		 if(member != null && bcryptPasswordEncoder.matches(password,member.getPassword())) { 
//			//세션처리 
//			model.addAttribute("loginMember", member);
//			
//			//세션에서 next값 가져오기 
//		    String next = (String)session.getAttribute("next");
//			location = next != null ? next : location; session.removeAttribute("next"); }
//		  //로그인 실패 
//		  else { 
//			  redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
//		  }
//		return "redirect:" + location;
//	}

	@PostMapping("/memberLoginFailure")
	public String memberLoginFailure(RedirectAttributes redirectAttr) {
		redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		return "redirect:/member/loginForm";
	}

	@RequestMapping("/logout")
	public String memberLogout(SessionStatus sessionStatus) {
		if (sessionStatus.isComplete() == false) {
			sessionStatus.setComplete();
		}

		return "redirect:/";
	}
	
	/*
	 * @RequestMapping(value="/checkIdDuplicate", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int checkIdDuplicate(@RequestParam("userId") String
	 * userId) {
	 * 
	 * int result =service.userIdCheck(userId); log.debug("result = {}", result);
	 * 
	 * return result;
	 * 
	 * }
	 */
	
	@GetMapping("/checkIdDuplicate")
	public ModelAndView checkIdDuplicate1(ModelAndView mav,
										  @RequestParam("userId") String userId) {
		
		//1. 업무로직 : 중복체크
		Member member = service.selectOneMember(userId);
		boolean isUsable = member == null;
		
		//2. model에 속성등록
		mav.addObject("isUsable", isUsable);
		
		//3. viewName : jsonView빈 지정
		mav.setViewName("jsonView");// /WEB-INF/views/jsonView.jsp
		
		return mav;
	}
	
	// 비밀번호 찾기
		@RequestMapping(value = "/passwordFind", method = RequestMethod.GET)
		public String passwordSearch() {
			return "member/passwordFind";
		}
	
	@RequestMapping(value="/passwordFind",method= RequestMethod.POST)
	public String passwordSearch(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		String userId = (String)paramMap.get("userId");
		String email = (String)paramMap.get("email");
		
		int result = service.updatePasswordEncrypt(paramMap);
		log.debug("result = {} " ,result);
		
		if(result > 0) {
			emailVo.setSubject(userId + "님의 비밀번호 찾기 메일입니다.");
			emailVo.setReceiver(email);
			emailVo.setContent("임시 비밀번호는 1234 입니다.");
			emailSender.SendEmail(emailVo);
		}
		
		
		return "redirect:/";
	}
		
	//내 마이페이지 or 다른 사용자의 마이페이지 (view 를 따로 구분 할 것)
	@RequestMapping("/mypage")
    public Model mypage(@RequestParam("userId") String userId,
    					Model model){
		
		Member member = service.selectOneMember(userId);
		model.addAttribute("member", member);
        return model;
    }

    //프로필 수정
	@RequestMapping("/editprofile" )
	public String editProfile(@RequestParam("userId") String userId, 
							  Model model)
	{
		
		 Member member = service.selectOneMember(userId); 
		 model.addAttribute("member",member);
		 
		return "/member/editProfile";
	}
	
	//닉네임 수정
	@PostMapping("/nickUpdate" )
	public String nickUpdate(Member member,RedirectAttributes rttr)
	{
		log.debug("member = {}", member);
		
		int result = service.updateNick(member);
		rttr.addFlashAttribute("msg", result > 0 ? "닉네임 수정 성공" : "닉네임 수정 실패");
		rttr.addAttribute("userId", member.getUserId());
		
		return "redirect:/member/mypage";
		
	}
	
    //관심목록
    @RequestMapping("/wishList")
    public Model wishList(@RequestParam("userId") String userId,
    					  Model model){
    	
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	List<Wish> list = service.selectAllWishPro(userId);
    	log.debug("ProductWishList = {}", list);
    	
    	model.addAttribute("member", member);
    	model.addAttribute("list", list);  	
    	
        return model;
    }
    
    //관심목록 삭제
    @PostMapping("/deleteWish")
    @ResponseBody
    public Map<String, Object> deleteWish(@RequestParam("wishCode") int wishCode){
    	
    	log.debug("wishCode = {}", wishCode);
    	int result = service.deleteWish(wishCode);

    	log.debug("result = {}", result);
    	Map<String, Object> map = new HashMap<>();
    	map.put("wishCode", wishCode);
    	
    	return map;
    }

    //관심목록 재추가
    @PostMapping("/insertWish")
    @ResponseBody
    public Map<String, Object> insertWish(@RequestParam("userId") String userId,
    									  @RequestParam("wishCode") int wishCode,
    									  @RequestParam("pCode") int pCode){
    	
    	log.debug("userId = {}", userId);
    	log.debug("pCode = {}", pCode);
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("pCode", pCode);
    	map.put("wishCode", wishCode);

    	int result = service.insertWish(map);
    	
    	return map;
    }
    
    //판매내역
    @RequestMapping("/salesList")
    public Model salseList(@RequestParam("userId") String userId,
    					   Model model){

    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	List<Wish> list = service.selectAllSalesPro(userId);
    	log.debug("ProductSalesList = {}", list);
    	
    	//판매중, 거래완료, 숨김 분류
    	List<Wish> sale = new ArrayList<>();
    	List<Wish> complete = new ArrayList<>();
    	List<Wish> hidden = new ArrayList<>();
    	
    	for(Wish w : list) {
    		if(!w.isOpenStatus()) hidden.add(w);
    		else if(w.getTradeStatus().equals("C")) complete.add(w);
    		else sale.add(w);
    	}
    	
    	model.addAttribute("member", member);
    	model.addAttribute("sale", sale);
    	model.addAttribute("complete", complete);
    	model.addAttribute("hidden", hidden);
    	
        return model;
    }
    
    //구매내역
    @RequestMapping("/buyList")
    public Model buyList(@RequestParam("userId") String userId,
    					 Model model){
    	
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	List<Wish> list = service.selectAllBuyPro(userId);
    	log.debug("ProductBuyList = {}", list);
    	
    	model.addAttribute("member", member);
    	model.addAttribute("list", list);
    	
        return model;
    }
    
    //내 동네 설정 페이지 띄우기
    @RequestMapping("/settingsArea")
    public Model settingsArea(@RequestParam("userId") String userId,
    					      Model model) {
    	
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	int radius = service.selectRadius(userId);
    	log.debug("radius = {}",String.valueOf(radius));
    	
    	model.addAttribute("member", member);
    	model.addAttribute("radius", radius);
    	
    	return model;
    }
    
    //현재 위치로 location 테이블 update
    //현재 위치(주소)로 member 테이블 update
    @PostMapping("/updateAddress")
    @ResponseBody
    public Map<String, Object> updateAddress(RedirectAttributes redirectAttr,
			    							@RequestParam("userId") String userId,
			    							@RequestParam("addr") String addr,
			    							@RequestParam("lat") float latitude,
			    							@RequestParam("lon") float longitude){
    	
    	log.debug("userId = {}", userId);
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("address", addr);
    	map.put("latitude", latitude);
    	map.put("longitude", longitude);
    	
    	int result = service.updateAddrAndLoc(map);
    	
    	return map;
    }
    
    //거리 범위 수정
    @PostMapping("/updateRadius")
    @ResponseBody
    public Map<String, Object> updateRadius(@RequestParam("userId") String userId,
    						  				@RequestParam("radius") int radius) {

    	
    	log.debug("userId = {}", userId);
    	log.debug("radius = {}", String.valueOf(radius));
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("radius", radius);
    	
    	int result = service.updateRadius(map);
    	
    	return map;
    }
    
    //자주 묻는 질문
    @RequestMapping("/FAQ")
    public String FAQ(@RequestParam String userId,Model model)
    {
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	//2.업무로직
    	List<announce> list = service.selectAnnounceList(userId);
    	log.debug("list = {}",list);
    	
    	//3.view단처리
    	model.addAttribute("member",member);
    	model.addAttribute("list",list);
    	return "member/FAQ";
    }
    
    //FAQ등록폼
    @RequestMapping("/FAQForm")
  	public ModelAndView FAQForm(ModelAndView mav,
  									@RequestParam("userId") String userId) {
  		
  		Member member = service.selectOneMember(userId);
  		
  		mav.addObject("member",member);
  		mav.setViewName("member/FAQForm");
  		return mav;
  	}
    
    @RequestMapping("/FAQEnroll")
  	public String FAQEnroll(@ModelAttribute("announce") announce announce, 
  								 RedirectAttributes rttr, 
  								 Model model,
  								@RequestParam(value="userId", required=false) String userId)throws Exception
	{
  		log.debug("userId = {}", userId);
  		Member member = service.selectOneMember(userId);
  		int result = service.announceEnroll(announce);
  		
  		rttr.addFlashAttribute("msg",result > 0  ? "FAQ 등록 성공!" : "FAQ 등록 실패!");
		rttr.addAttribute("userId", announce.getUserId());
  		
  		return "redirect:/member/FAQ";
  	}
    
    //FAQ 상세보기
    @GetMapping("/FAQDetail")
    public String FAQDetail(@RequestParam int bCode,
    							@RequestParam("userId") String userId,
    							Model model) {
    	
    	Member member = service.selectOneMember(userId);
    	log.debug("[{}]번 공지사항 조회",bCode);
    	announce announce = service.selectOneAnnounce(bCode,userId);
    	model.addAttribute("announce",announce);
    	model.addAttribute("member", member);
    	return "member/FAQDetail";
    }
    
    //공지 사항
    @RequestMapping("/announce")
    public String announce(@RequestParam String userId,Model model)
    {
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	//2.업무로직
    	List<announce> list = service.selectAnnounceList(userId);
    	log.debug("list = {}",list);
    	
    	//3.view단처리
    	model.addAttribute("member",member);
    	model.addAttribute("list",list);
    	return "member/announce";
    }

    //관심 주제 목록
    @RequestMapping("/interList")
    public String interList()
    {
    	return "member/interList";
    }
    
    //동네생활 댓글
    @RequestMapping("/myComment")
    public  ModelAndView mycomment(ModelAndView mav,
			   					   @RequestParam("userId") String userId)
    {
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	
    	List<Reply> list = service.selectReplyList(userId);
    	log.debug("list = {}",list);
    	
    	mav.addObject("member",member);
    	mav.addObject("list",list);
    	mav.setViewName("member/myComment");
    	return mav;
    }

    //동네생활 게시글
    @RequestMapping("/myPost")
    public ModelAndView mypost(ModelAndView mav,
							   @RequestParam("userId") String userId)
    {
    	log.debug("loginMemberId = {} ", userId);
    	Member member = service.selectOneMember(userId);
    	
    	
    	List<Community> list = service.selectPostList(userId);
    	log.debug("list = {}",list);
    	
    	mav.addObject("member",member);
    	mav.addObject("list",list);
    	mav.setViewName("member/myPost");
    	return mav;
    }
    
    //나의 키워드 알림 설정
    @RequestMapping(value = "/keywordNoti",
    				method = RequestMethod.GET)
    public ModelAndView keywordNoti(@RequestParam("userId") String userId,
    								ModelAndView mav){

    	log.debug("userId = {}", userId);
    	Member member = service.selectOneMember(userId);
    	
    	List<Keyword> list = service.selectKeywordList(userId);
    	log.debug("list = {}", list);
    	
    	//전체 키워드 수 구하기
    	int totalKeywordContents = service.selectTotalKeywordContent(userId);
    	log.debug("totalKeywordContents ={}", String.valueOf(totalKeywordContents));
    	
    	mav.addObject("member", member);
    	mav.addObject("totalKeywordContents", totalKeywordContents);
    	mav.addObject("list", list);
    	return mav;
    }
    
    //나의 키워드 추가
    @RequestMapping(value = "/insertKeyword",
    				method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertKeyword(@RequestParam("userId") String userId,
			    						     @RequestParam("keyword") String keyword){
    	
    	Keyword key = new Keyword(0, userId, keyword);
   
    	int keyCode = service.insertKeyword(key);

    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("keyword", keyword);
    	map.put("keyCode", keyCode);
    	
    	return map;
    }
    
    //키워드 삭제
    @RequestMapping(value = "/deleteKeyword")
    @ResponseBody
    public Map<String, Object> deleteKeyword(@RequestParam("key") int keyCode){
    	  
    	int result = service.deleteKeyword(keyCode);  		

    	Map<String, Object> map = new HashMap<>();
    	map.put("key", keyCode);
    	
    	return map;
    }
    
    //키워드 중복검사
    @GetMapping("/checkKeywordDuplicate")
    @ResponseBody
    public Map<String, Object> checkKeywordDuplicate(@RequestParam("userId") String userId,
    												 @RequestParam("keyword") String keyword){
    	   	
    	Map<String, Object> key = new HashMap<>();
    	key.put("userId", userId);
    	key.put("keyword", keyword);
    	
    	int result = service.selectKeyword(key);
    	//같은키워드가 0개여야 새로 추가 가능한 키워드 임
    	boolean isUsable = (result == 0); 
    	
    	Map<String, Object> map = new HashMap<>();
		map.put("isUsable", isUsable);
		map.put("userId", userId);
    	return map;
    }
    
    //받은 거래 후기/매너 평가
    @RequestMapping("/myReviewList")
    public Model myReviewList(@RequestParam("userId") String userId,
    						  Model model){
    	
    	log.debug("userId = {}", userId);
    	Member member = service.selectOneMember(userId);
    	
    	//매너 평가
    	List<Evaluate> evaList = service.selectAllEva(userId);
    	log.debug("list = {}", evaList);
    	
    	//거래 후기
    	//1. 거래 후기 총 개수
    	int totalReview = service.selectTotalReview(userId);
    	log.debug("totalReview = {}", totalReview);
    	
    	//2. 거래 후기 - userId가 수신자 인 것만
    	List<Review> reviewList = service.selectAllReview(userId);
    	log.debug("reviewList = {}", reviewList);
    	
    	//판매자/구매자 구분
    	List<Review> seller = new ArrayList<>(); 
    	List<Review> buyer = new ArrayList<>(); 
    	for(Review r : reviewList) {
    		if(r.getDirect().equals("S")) buyer.add(r);
    		else seller.add(r);    			
    	}
    	
    	model.addAttribute("member", member);
    	model.addAttribute("evaList", evaList);
    	model.addAttribute("totalReview", totalReview);
    	model.addAttribute("reviewList", reviewList);
    	model.addAttribute("reviewSeller", seller);
    	model.addAttribute("reviewBuyer", buyer);
    	return model;
    }
    
    //공지사항 디테일
    @GetMapping("/announceDetail")
    public String announceDetail(@RequestParam int bCode,
    							@RequestParam("userId") String userId,
    							Model model) {
    	
    	Member member = service.selectOneMember(userId);
    	log.debug("[{}]번 공지사항 조회",bCode);
    	announce announce = service.selectOneAnnounce(bCode,userId);
    	model.addAttribute("announce",announce);
    	model.addAttribute("member", member);
    	return "member/announceDetail";
    }
    
  //공지사항 글쓰기 폼
  	@RequestMapping("/announceForm")
  	public ModelAndView announceForm(ModelAndView mav,
  									@RequestParam("userId") String userId) {
  		
  		Member member = service.selectOneMember(userId);
  		
  		mav.addObject("member",member);
  		mav.setViewName("member/announceForm");
  		return mav;
  	}
    
  //공지사항 등록
  	@RequestMapping("/announceEnroll")
  	public String announceEnroll(@ModelAttribute("announce") announce announce, 
  								 RedirectAttributes rttr, 
  								 Model model,
  								@RequestParam(value="userId", required=false) String userId)throws Exception
	{
  		log.debug("userId = {}", userId);
  		Member member = service.selectOneMember(userId);
  		int result = service.announceEnroll(announce);
  		
  		rttr.addFlashAttribute("msg",result > 0  ? "공지사항 등록 성공!" : "공지사항 등록 실패!");
		rttr.addAttribute("userId", announce.getUserId());
  		
  		return "redirect:/member/announce";
  	}
  	
  	//공지사항 삭제
  	@PutMapping("/{bCode}")
    @ResponseBody
    public Map<String, Object> deleteBoard(@PathVariable int bCode)
    {
        Map<String, Object> map = new HashMap<>();
        
        String msg = "삭제되었습니다 😄";
        
        try 
        {
            int result = service.delete(bCode);
        } 
        catch(Exception e) 
        {
        	e.printStackTrace();
            log.error("공지사항 삭제 오류", e);
            msg = "삭제에 실패했어요 💧";
        }
        
        map.put("msg", msg);
        
        return map;
    }

    //알림 띄우기 (헤더)
    @RequestMapping("/showNoti")
    @ResponseBody
    public Map<String, Object> showNoti(@RequestParam("userId") String userId){
    	Map<String, Object> map = new HashMap<>();
    	
    	List<Noti> noti = service.selectAllNoti(userId);
    	log.debug("notiList = {}", noti);
    	map.put("noti", noti);
    	
    	return map;
    }
    
    //알림 모아보기 (마이페이지)
    @RequestMapping("/myNotiList")
    public Model myNotiList(@RequestParam("userId") String userId,
			    		 	@RequestParam(defaultValue = "1", 
			    		 				  value="cPage") int cPage,
    						Model model,
    						HttpServletRequest request){

    	//사용자 입력값 
		final int limit = 10; //numPerPage
		int offset = (cPage - 1) * limit;

    	Member member = service.selectOneMember(userId);
    	List<Noti> list = service.selectAllNoti(userId, limit, offset);

    	//전체컨텐츠수 구하기
		int totalContents = service.selectNotiTotalContents(userId);

		//페이지 바
		String url = request.getRequestURI() + "?userId=" + userId + "&";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);

    	model.addAttribute("member", member);
    	model.addAttribute("list", list);
    	model.addAttribute("pageBar", pageBar);
    	model.addAttribute("totalContents", totalContents);

    	return model;
    }
    						
    //알림 상태 체크여부 바꾸기
    @RequestMapping("/updateCheck")
    @ResponseBody
    public String updateCheck(@RequestParam("notiCode") int notiCode){
    	
    	String resultStr = "처리 성공";
    	try {
    		int result = service.updateNotiCheck(notiCode);
    	} catch (Exception e) {
			resultStr = "처리 실패";
		}    	
    	return resultStr;
    }
    
    //차단 사용자 리스트
    @RequestMapping("/blockUser")
    public Model blockUser(@RequestParam("userId") String userId,
    						Model model){
    	
    	Member member = service.selectOneMember(userId);
    	List<Block> list = service.selectAllBlockUser(userId);
    	
    	model.addAttribute("member", member);
    	model.addAttribute("list", list);
    	
    	return model;
    }
    
    //차단하기
    @GetMapping("/addBlockUser")
    public String addBlockUser(@RequestParam("userId") String userId,
    						   @RequestParam("blockUserId") String blockUserId){
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("blockUserId", blockUserId);

    	try {
    		int result = service.insertBlockUser(map);    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "redirect:/member/blockUser?userId=" + userId;
    }
    
    //차단하기
    @PostMapping("/deleteBlockUser")
    @ResponseBody
    public String deleteBlockUser(@RequestParam("userId") String userId,
    							  @RequestParam("blockUserId") String blockUserId){
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("blockUserId", blockUserId);
    	
    	String msg = "차단 해제 했어요 💗";
    	try {
    		int result = service.deleteBlockUser(map);    		
    	}catch (Exception e) {
    		e.printStackTrace();
    		msg = "차단 해제 실패했어요 😥 ";
    	}
    	
    	return msg;
    }
    
}
