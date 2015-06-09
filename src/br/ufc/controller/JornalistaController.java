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
import br.ufc.model.noticia.Noticia;

@Controller
@RequestMapping("jornalista")
public class JornalistaController {
	
	@RequestMapping("menu_jornalista")
	public String menuJornalista() {
		
		return "/usuario/jornalista/menuJornalista";
	}
	
	@RequestMapping("cadastra_noticia")
	public String formNoticia(Model model){
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		SecaoDAO sDAO = new SecaoDAO(conn);
		
		model.addAttribute("secoes", sDAO.listar());
		
		return "/usuario/jornalista/FormNoticia";
	}
	
	@RequestMapping("efetuar_cadastro_noticia")
	public String cadastarNoticia(@Valid Noticia noticia, BindingResult result, HttpSession session) {
		if(result.hasErrors()){
			return "/usuario/jornalista/FormNoticia";
		}
		FabricaDeConexoes fc = new FabricaDeConexoes();
		Connection conn = fc.getConexao();
		NoticiaDAO nDAO = new NoticiaDAO(conn);
		
		nDAO.inserir(noticia);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:menu_jornalista";
	}

}
