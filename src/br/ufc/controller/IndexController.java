package br.ufc.controller;

import java.sql.Connection;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.dao.fabrica.FabricaDeConexoes;
import br.ufc.dao.noticia.NoticiaDAO;
import br.ufc.dao.noticia.SecaoDAO;

@Controller
public class IndexController {
	/*Incluida na pagina principal responsavel por retornar
	 * Se na estiver logado a tela de login
	 * E se tiver logado o nome e o link de logout
	 */
		
	@RequestMapping("/")
	public String paginaInicial(Model model, HttpSession session) {
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		
		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listar(1));
		model.addAttribute("page", nDAO.numPaginas());
		
		if(session.getAttribute("usuarioLogado")==null 
				&& session.getAttribute("jornalistaLogado")==null
				&& session.getAttribute("editorLogado")==null)		
					return "index_login";
		else
			return "index_bemvindo";
	}
	
	@RequestMapping("page")
	public String paginacao(int num, Model model, HttpSession session){
		if(num<1) num=1;
		
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		
		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listar(num));
		model.addAttribute("page", nDAO.numPaginas());
		
		if(session.getAttribute("usuarioLogado")==null 
				&& session.getAttribute("jornalistaLogado")==null
				&& session.getAttribute("editorLogado")==null)		
					return "index_login";
		else
			return "index_bemvindo";
	}

	@RequestMapping("cabecalho-login")
	public String cabecalhoLogin() {
		return "cabecalho-login";
	}

	@RequestMapping("cabecalho-logado")
	public String cabecalhoLogado() {
		return "cabecalho-logado";
	}
	
	@RequestMapping("home")
	public String home() {
		return "redirect:/";
	}
}
