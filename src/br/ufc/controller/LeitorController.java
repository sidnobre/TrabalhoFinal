package br.ufc.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.dao.fabrica.FabricaDeConexoes;
import br.ufc.dao.noticia.NoticiaDAO;
import br.ufc.dao.noticia.SecaoDAO;
import br.ufc.dao.usuario.LeitorDAO;
import br.ufc.model.noticia.Noticia;
import br.ufc.model.usuario.Leitor;

@Controller
public class LeitorController {
	
	@RequestMapping("/cadastrarLeitor")
	public String cadastroFormulario(){
		return "/usuario/leitor/cadastrar_leitor";
	}
	
	@RequestMapping ("/cadastraLeitor")
	public String cadastraLeitor(@Valid Leitor leitor, BindingResult result){
		if(result.hasErrors()){
			return "/usuario/leitor/cadastrar_leitor";
			}
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		LeitorDAO lDAO = new LeitorDAO(conn);
		lDAO.inserir(leitor);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return "redirect:pagina_inicial";
	}
	
	@RequestMapping("/comentar_noticia")
	public String cadastraComentario(Noticia noticia, HttpSession session){
		if(session.getAttribute("usuarioLogado")==null 
				&& session.getAttribute("jornalistaLogado")==null
				&& session.getAttribute("editorLogado")==null)		
					return "acessonegado-login";
		
		//TERMINAR
		return "";
	}
	
	@RequestMapping("noticia")
	public String exibirNoticia(int id, Model model){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		
		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listarID(id));
		
		return "usuario/leitor/noticia";
	}
	
	@RequestMapping("secao")
	public String exibirNoticiaSecao(int idsecao, Model model){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();

		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listarSecao(idsecao));
		
		return "usuario/leitor/noticia";
	}
	
	
}
	
