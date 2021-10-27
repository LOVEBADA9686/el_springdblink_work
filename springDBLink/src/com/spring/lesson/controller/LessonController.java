package com.spring.lesson.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dept.controller.DepartmentController;
import com.spring.lesson.service.LessonService;
import com.spring.lesson.vo.LessonVO;

@Controller
@RequestMapping(value="/lesson")
public class LessonController {
	private Logger logger = Logger.getLogger(LessonController.class);
	
	private static final String CONTEXT_PATH="lesson";
	
	
	@Autowired
	private LessonService lessonService;
	
	/* 전체조회 */
	// 전체조회하는 함수 
	// index.jsp 에서 a 링크에  /lesson/listLesson.k url로 요청하는 것을 받는다.
	// /lesson url 은 LessonController 클래스에 선언 했는데 이 클래스 전체에 영향을 준다.
	@RequestMapping("/listLesson")
	// @RequestMapping	@어노테이션	 RequestMapping리퀘스트매핑		index.jsp 파일에 있는 url 요청을 받을아드릴 controller를 지정하는 것
	public ModelAndView listLesson(@ModelAttribute LessonVO param) {
		// 
		List<LessonVO> list = lessonService.listLesson(param);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lessonList", list);
		
		mav.addObject("paramName", param.getLname());
		
		mav.setViewName(CONTEXT_PATH + "/lesson");
		
		return mav;
	}
	
	/* 상세 정보 보기 */
	@RequestMapping("/selectLesson")
	public ModelAndView selectLesson(@RequestParam("no") int no) {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1 ");
		ModelAndView mav = new ModelAndView();
		
		if(no==0) {
			
			mav.addObject("mode", "insert");
			
		}else {
			
			mav.addObject("lessonVO", lessonService.selectLesson(no));
			
			mav.addObject("mode", "update");
			
		}
		
		mav.setViewName(CONTEXT_PATH + "/lesson_pop");
		
		return mav;
	}
	
	/* 레코드 추가 */
	@RequestMapping("/insertLesson")
	public ModelAndView insertLesson(@ModelAttribute LessonVO param) {
		String resultStr = "";
		int result = lessonService.insertLesson(param);
		
		if(result > 0) resultStr = "등록 완료 되었습니다.";
		else resultStr = "등록에 문제가 있어 완료되지 못하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/result");
		
		return mav;
	}
	
	/* 레코드 수정 */
	@RequestMapping("/updateLesson")
	public ModelAndView updateLesson(@ModelAttribute LessonVO param) {
		String resultStr = "";
		int result = lessonService.updateLesson(param);
		
		if(result > 0) resultStr = "수정 완료 되었습니다.";
		else resultStr ="수정에 문제가 있어 완료하지 못하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/result");
		
		return mav;	
	}
	
	/* 레코드 삭제 */
	@RequestMapping("/deleteLesson")
	public ModelAndView deleteLesson(@RequestParam("no") int no) {
		String resultStr = "";
		int result = lessonService.deleteLesson(no);
		
		if(result > 0)resultStr = "삭제 완료 되었습니다.";
		else resultStr = "삭제에 문제가 있어 완료하지 못하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/result");
		
		return mav;
	}
}
