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
import br.ufc.dao.noticia.ComentarioDAO;
import br.ufc.dao.noticia.NoticiaDAO;
import br.ufc.dao.noticia.SecaoDAO;
import br.ufc.dao.usuario.LeitorDAO;
import br.ufc.model.noticia.Comentario;
import br.ufc.model.noticia.Noticia;
import br.ufc.model.usuario.Leitor;
import br.ufc.model.usuario.Usuario;

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
		return "redirect:home";
	}
	
	@RequestMapping("comentar_notica")
	public String cadastraComentario(Comentario comentario, HttpSession session){
		
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		ComentarioDAO cDAO = new ComentarioDAO(conn);
		cDAO.inserir(comentario);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return "forward:noticia?id="+comentario.getIdNoticia();
	}
	
	@RequestMapping("noticia")
	public String exibirNoticia(int id, Model model, HttpSession session){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();

		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listarID(id));
		
		ComentarioDAO cDAO = new ComentarioDAO(conn);
		model.addAttribute("comentarios", cDAO.listar(id));
		
		if(session.getAttribute("usuarioLogado")==null 
				&& session.getAttribute("jornalistaLogado")==null
				&& session.getAttribute("editorLogado")==null)
					return "usuario/leitor/noticia-login";
		
		return "usuario/leitor/noticia-logado";
	}
	
	@RequestMapping("secao")
	public String exibirNoticiaSecao(int idsecao, Model model, HttpSession session){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();

		SecaoDAO sDAO = new SecaoDAO(conn);
		model.addAttribute("secoes", sDAO.listar());
		
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		model.addAttribute("noticias", nDAO.listarSecao(idsecao));
		
		if(session.getAttribute("usuarioLogado")==null 
				&& session.getAttribute("jornalistaLogado")==null
				&& session.getAttribute("editorLogado")==null)
					return "usuario/leitor/secao-login";
		
		return "usuario/leitor/secao-logado";
	}
	
	
	@RequestMapping("excluirnoticia")
	public String excluirNoticia(Noticia noticia, Usuario usuario, HttpSession session){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		
		System.out.println(usuario.getLogin());
		System.out.println(usuario.getTipo());
		
		if(noticia.getAutor().equals(usuario.getLogin())){
			nDAO.excluir(noticia.getId());
		}
		else if(usuario.getTipo().equals("editor")){ 
			nDAO.excluir(noticia.getId());
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:home";
	}
	
}
	
