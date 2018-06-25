package wagle.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.board.WagleDataBean;
import wagle.board.WaglelistDBMybatis;
import wagle.members.MemberDBMybatis;
import wagle.members.MemberDataBean;

@Controller
@RequestMapping("/admin")
public class AdminController {
	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	WaglelistDBMybatis dbWagle = WaglelistDBMybatis.getInstance();
	
	// ������ - �ɹ����
	@RequestMapping(value = "memberlist")
	   public ModelAndView memberlist(String opt, String condition, HttpServletRequest request, String pageNum) throws Throwable {
	      
	      ModelAndView mv = new ModelAndView();
	      HttpSession session = request.getSession();
	      
	      int pageSize = 10;
	      
	      if (pageNum == null || pageNum == "") {
	         pageNum = "1";
	      }
	      
	      int currentPage = Integer.parseInt(pageNum);
	      int startRow = (currentPage - 1) * pageSize + 1;
	      int endRow = currentPage * pageSize;
	      //System.out.println("+++++++++++\n"+"start: "+ startRow + "\nend: "+endRow + "\n+++++++++++");
	      int count = 0;
	      int number = 0;
	      List memberlist = null;
	      
	      if (opt == null) {
	         count = dbMember.getMemberCount();
	         if (count > 0) {
	            memberlist = dbMember.getMembers(startRow, endRow);
	            System.out.println("NULL NO CONDITION (�⺻��)");
	         }
	      } else if (opt.equals("1")) {
	         count = dbMember.getMemberCountEN("%"+condition+"%", "%"+condition+"%");
	         if (count > 0) {
	            memberlist = dbMember.getMembersEN(startRow, endRow, "%"+condition+"%", "%"+condition+"%");
	            System.out.println("=====�˻�=====\nEmail + Name: " + condition + "\n=============");
	         }
	      } else if (opt.equals("2")) {
	         count = dbMember.getMemberCountEmail("%"+condition+"%");
	         if (count > 0) {
	            memberlist = dbMember.getMembersEmail(startRow, endRow, "%"+condition+"%");
	            System.out.println("=====�˻�=====\nEmail: " + condition + "\n=============");
	         }
	      } else if (opt.equals("3")) {
	         count = dbMember.getMemberCountName("%"+condition+"%");
	         if (count > 0) {
	            memberlist = dbMember.getMembersName(startRow, endRow, "%"+condition+"%");
	            System.out.println("=====�˻�=====\nName: " + condition + "\n=============");
	         }
	      }
	      number = count - (currentPage - 1) * pageSize;
	         

	      int bottomLine = 3;
	      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	      int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	      int endPage = startPage + bottomLine - 1;

	      if (endPage > pageCount)
	         endPage = pageCount;
	      
	      mv.addObject("count", count);
	      mv.addObject("memberlist", memberlist);
	      mv.addObject("currentPage", currentPage);
	      mv.addObject("startPage", startPage);
	      mv.addObject("bottomLine", bottomLine);
	      mv.addObject("pageCount", pageCount);
	      mv.addObject("number", number);
	      mv.addObject("endPage", endPage);
	      mv.addObject("condition", condition);
	      mv.addObject("opt", opt);
	      
	      // ���� ���� ���� (url)
	      if (session.getAttribute("sessionEmail").equals("admin")) {
	         // �������� ���
	         mv.setViewName("memberlist");
	      } else if (!session.getAttribute("sessionEmail").equals("admin")) {
	         // ������ ���
	         mv.setViewName("index");
	      }

	      return mv;
	   }


	
	// ������ - �׷����
	@RequestMapping(value = "waglelist_ad")
	public ModelAndView waglelist_ad (Model model, HttpServletRequest request, String pageNum, String opt, String condition) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int pageSize = 10;
		
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//System.out.println("+++++++++++\n"+"start: "+ startRow + "\nend: "+endRow + "\n+++++++++++");
		int count = 0;
		int number = 0;
		List waglelist = null;
		
		if (opt == null) {
			count = dbWagle.getWagleCount_ad();
			if (count > 0) {
				waglelist = dbWagle.getWaglelist_ad(startRow, endRow);
				System.out.println("NULL NO CONDITION (�⺻��)");
			}
		} else if (opt.equals("1")) {
			count = dbWagle.getWagleCount_adWNAME("%"+condition+"%");
			if (count > 0) {
				waglelist = dbWagle.getWaglelist_adWNAME(startRow, endRow, "%"+condition+"%");
				System.out.println("=====�˻�=====\nWAGLE: " + condition + "\n=============");
			}
		} else if (opt.equals("2")) {
			count = dbWagle.getWagleCount_adWHOST("%"+condition+"%");
			if (count > 0) {
				waglelist = dbWagle.getWaglelist_adWHOST(startRow, endRow, "%"+condition+"%");
				System.out.println("=====�˻�=====\nWHOST: " + condition + "\n=============");
			}
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;
		
		mv.addObject("count", count);
		mv.addObject("waglelist", waglelist);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("bottomLine", bottomLine);
		mv.addObject("pageCount", pageCount);
		mv.addObject("number", number);
		mv.addObject("endPage", endPage);
		mv.addObject("condition", condition);
		mv.addObject("opt", opt);
		
		
		if (session.getAttribute("sessionEmail").equals("admin")) {
			// �������� ���
			mv.setViewName("waglelist_ad");
		} else if (!session.getAttribute("sessionEmail").equals("admin")) {
			// ������ ���
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	// ������ - �� (update..? --> delete!)
	@RequestMapping("/wagleform_ad")
	public String wagleform_ad(Model model, int wboardid) throws Exception{
		
		WagleDataBean wagle = dbWagle.getWagle(wboardid);
		model.addAttribute("wagle", wagle);
		
		return "wagleform_ad";
	}
	
	// ������ - �ͱ� ���� (Pro)
	@RequestMapping("/wagleDelete_ad")
	public ModelAndView wagleDelete(int wboardid)  throws Throwable { 
		ModelAndView mv = new ModelAndView();

		int check=dbWagle.deleteWagle(wboardid);
		mv.addObject("wboardid",wboardid);
		mv.addObject("check",check);
		
		mv.setViewName("wagleDelete_ad");
		
		return  mv;
	}

}
