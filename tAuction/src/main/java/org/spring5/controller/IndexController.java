package org.spring5.controller;

import org.springframework.ui.Model;

public interface IndexController {

	public void index(Model model);
	
	public void visitorCount();
}
