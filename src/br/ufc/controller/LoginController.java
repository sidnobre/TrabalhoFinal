package br.ufc.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.dao.fabrica.FabricaDeConexoes;
import br.ufc.dao.noticia.SecaoDAO;
import br.ufc.dao.usuario.UsuarioDAO;
import br.ufc.model.usuario.Usuario;

@Controller
public class LoginController {
	
		
		@RequestMapping("loginForm")
		public String loginForm(Model model){			
			FabricaDeConexoes fc = new FabricaDeConexoes();
			Connection conn = fc.getConexao();
			
			SecaoDAO sDAO = new SecaoDAO(conn);
			model.addAttribute("secoes", sDAO.listar());
			
			return "login/formulario-login";		
		}
		
		/*	Metodo responsavel pela validação do usuario e
		  	se nao houver erros criar uma sessao		 */
		@RequestMapping("efetuaLogin")
		public String efetuaLogin(Usuario usuario, HttpSession session) {
			//Limpar sessao
			session.setAttribute("usuarioLogado", null);
			session.setAttribute("jornalistaLogado", null);		
			session.setAttribute("editorLogado", null);
			
			FabricaDeConexoes fc = new FabricaDeConexoes();
			Connection conn = fc.getConexao();
			UsuarioDAO uDAO = new UsuarioDAO(conn);
			
			if(uDAO.existeUsuario(usuario)) {
				usuario.setTipo(uDAO.verificaTipo(usuario.getLogin()));
				
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				//De acordo com a role seta a sessao e redireciona
				
				if(usuario.getTipo().equals("leitor")){
					session.setAttribute("usuarioLogado", usuario);
				}	
				if(usuario.getTipo().equals("jornalista")){
					session.setAttribute("jornalistaLogado", usuario);
				}
				if(usuario.getTipo().equals("editor")){
					session.setAttribute("editorLogado", usuario);
				}
				return "redirect:home";				
			}			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return "redirect:loginForm";
		}
		
		@RequestMapping("logout")
		public String invalidate(HttpSession session){
			session.invalidate();
			return "redirect:home";
		}

}
