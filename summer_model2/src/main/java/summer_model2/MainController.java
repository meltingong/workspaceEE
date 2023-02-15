package summer_model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.summer.mvc.Controller;

public class MainController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) {
		
		return "/WEB-INF/views/main.jsp";
	}

}
