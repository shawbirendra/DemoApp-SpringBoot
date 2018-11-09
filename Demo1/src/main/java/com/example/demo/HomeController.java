package com.example.demo;

import java.util.Calendar;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController

public class HomeController {
	@GetMapping(path = "/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
		// return "abc";
	}

	@GetMapping(path = "/wish")
	public String getMsg() {
		Calendar cl = Calendar.getInstance();
		cl.getTime();
		System.out.println(cl.get(Calendar.PM));
		int hr = cl.get(Calendar.HOUR);
		if (hr <= 12) {
			return "Good Morning Dear.";
		}
		return "Good Afternoon";
	}
}
