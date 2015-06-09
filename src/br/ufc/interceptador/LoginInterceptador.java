package br.ufc.interceptador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptador extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
		
		String uri = request.getRequestURI();
		
		if(uri.endsWith("excluirnoticia") && (request.getSession().getAttribute("editorLogado") != null ||
				request.getSession().getAttribute("jornalistaLogado") != null))
					return true;
		
		if (uri.endsWith("menu_editor") || uri.endsWith("cadastro_jornalista") || uri.endsWith("cadastro_classificado") ||
				uri.endsWith("cadastro_secao") || uri.endsWith("cadastraJornalista") || uri.endsWith("cadastraSecao") ||
				uri.endsWith("cadastraClassificado") ) { 
					if(request.getSession().getAttribute("editorLogado") == null) {
						response.sendRedirect("../loginForm");
						return false;
					}
		}


		if (uri.endsWith("menu_jornalista") || uri.endsWith("cadastra_noticia") || uri.endsWith("efetuar_cadastro_noticia")
			|| uri.endsWith("excluirnoticia")){
			if(request.getSession().getAttribute("jornalistaLogado") == null) {
				response.sendRedirect("../loginForm");
				return false;
			}
		}
		
		if(uri.endsWith("comentar") || uri.endsWith("cadastra_comentario") || uri.endsWith("ofertar")){
			if(request.getSession().getAttribute("usuarioLogado") == null)
				response.sendRedirect("loginForm");
				return false;
		}
		
		return true;
	}

}
