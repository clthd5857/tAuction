package org.spring5.controller;

import org.spring5.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/index")
@AllArgsConstructor
public class IndexControllerImpl implements IndexController {

	@Autowired
	private MemberService memberService;
	
   @Override
   @GetMapping("/index")
   public void index(Model model) {
      // TODO Auto-generated method stub
      memberService.visitorCountUp();
   }

   @Override
   @Scheduled(cron ="0 0 0 * * *")
   public void visitorCount() {
      // TODO Auto-generated method stub
      memberService.visitorCount();
   }
	   



	
	
	

}
