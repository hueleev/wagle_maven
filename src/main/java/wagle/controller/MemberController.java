package wagle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.members.MemberDBMybatis;
import wagle.members.MemberDataBean;
import wagle.message.MessageMyBatis;

@Controller
@RequestMapping("/member")
public class MemberController {

	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	MessageMyBatis dbMessage = MessageMyBatis.getInstance();
	
	// ȸ������ ��
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(MemberDataBean member)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", member.getNum());
		mv.setViewName("joinForm");
		return mv;
	}
	
	//ȸ������ pro
	@RequestMapping("/joinPro")
	public String joinPro(MemberDataBean member,String email,Model model)throws Throwable {	
		/*member = new MemberDataBean();  --> ���� ��ü�� �޾ƿ��� null�� ���´�!!*/
		boolean result = false;
		result=dbMember.confirmId(email);
		model.addAttribute("result",result);
		
		
		if(!result) {
			dbMember.insertMember(member);
			return "joinPro";
		}else {
			return "joinPro";
		}
		
	}
	
	
	
	//�̸��� �ߺ�Ȯ��
	@RequestMapping("/confirmId")
	public String confirmId(String email,Model model) {
		boolean result = false;
		result=dbMember.confirmId(email);
		
		model.addAttribute("result",result);
		model.addAttribute("email",email);
		
		
		return "confirmId";
	
	}
	
	//�α���
	@RequestMapping("/login")
    public String login(HttpServletRequest request)
  		  throws Throwable { 
		
		MessageMyBatis dbPro = MessageMyBatis.getInstance();
		
		String sessionEmail = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String sessionPwd = request.getParameter("pwd");
		
		int pwcheck = dbMember.login(sessionEmail, pwd);	
		
		HttpSession session = request.getSession();
		
		request.setAttribute("pwcheck", pwcheck);
		
		
		if (pwcheck==-1) {
			return "loginPro";
		}else if (pwcheck==0) {
			return "loginPro";
		}else{
			session = request.getSession();
			session.setAttribute("sessionEmail", sessionEmail);	
			session.setAttribute("sessionPwd", sessionPwd);	
			MemberDataBean user = dbMember.getUser2(sessionEmail, pwcheck);
			System.out.println("zzzz��������µ�");
			int count1 = dbPro.count(sessionEmail);
			session.setAttribute("name", user.getName());//name�޾ƿ���
			session.setAttribute("count1", count1);
			return "redirect:/index";
	   }		
}  

	   
	
	//�α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	//��й�ȣ ã��
	@RequestMapping("/findPwd")
	public String findPwd(Model model, MemberDataBean member) {
		
		model.addAttribute(member);
		return "findPwd";
	}
	
	@RequestMapping("/findPro")
	public String findPro(Model model, String email, String pwdQ, String pwdA, MemberDataBean member) {
		if (email == null) {email = " ";}
		if (email.equals("admin")) {email = "���ٺҰ�";}
		if (pwdQ == null) {pwdQ = " ";}
		if (pwdA == null) {pwdA = " ";}
		
		System.out.println("========findPro========\n�̸���: "+ email 
				+ "\n��� ����: " + pwdQ + "\n��� ��: " + pwdA + "\n=======================");
		
		int chk = dbMember.getUser3(email, pwdQ, pwdA); // chk �뵵
		member = dbMember.getUser(email, "findPro"); // ������ �޾ƿ��� �뵵
		model.addAttribute("member", member);
		model.addAttribute("chk", chk);
		
		if (chk==1){ 
			System.out.println(email+" ȸ������ ��й�ȣ�� "
					+member.getPwd()+ "�Դϴ�."+"\n=======================");
			return "findPro";
		}else{ 
			return "findPro";
		}
	}
	
	
	//update
	@RequestMapping("/updateForm")
	public String updateForm(Model model, HttpServletRequest request)
			throws Exception{
		String sessionEmail = request.getParameter("email");
		
		HttpSession session = request.getSession();	
				
		MemberDataBean member = dbMember.getUser(sessionEmail, "update");
		model.addAttribute("member", member);
		
		return "updateForm";
	} 
	
	@RequestMapping("/updatePro")
	public String updatePro(MemberDataBean member,Model mv)
			throws Exception {

		dbMember.updateMember(member);
		int chk= dbMember.updateMember(member); 
		mv.addAttribute("member", member);
		mv.addAttribute("chk", chk);
		
		if (chk==1){ 
			return "updatePro";
		}else{ 
			return "updatePro";
		}
	}
	
	@RequestMapping(value="deleteForm")
	public String deleteForm(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		String sessionEmail = (String)session.getAttribute("email");  //�α��ε� ���� ���̵� �ش��ϴ� �н������ delete�ϱ� ���� �ʿ�
		String sessionPwd = (String)session.getAttribute("pwd"); // [������] �信�� ����pwd ��
		//sessionEmail = request.getParameter("email");	//admin���� delete�ϱ����� �ʿ�
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		
		mv.addAttribute("sessionEmail", sessionEmail);
		mv.addAttribute("sessionPwd", sessionPwd);
		mv.addAttribute("email", email);
		mv.addAttribute("pwd", pwd);
		
		return  "deleteForm"; 
	} 
	
	@RequestMapping(value="deletePro")
	public String deletePro(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		dbMember = MemberDBMybatis.getInstance();
		
		int check=0;
		
		if (!session.getAttribute("sessionEmail").equals("admin")) {
			check = dbMember.deleteMember(email, pwd, (String) session.getAttribute("sessionEmail"));
		} else if (session.getAttribute("sessionEmail").equals("admin")) {
			check = dbMember.deleteMember(email, null, (String) session.getAttribute("sessionEmail"));
		}
		
		mv.addAttribute("check", check);
		
		if(check==1 && !session.getAttribute("sessionEmail").equals("admin")) {
			session.invalidate();
		}
		
		
		
		return "deletePro";
		
	}
	
}
