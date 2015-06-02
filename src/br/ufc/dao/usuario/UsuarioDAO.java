package br.ufc.dao.usuario;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.ufc.model.usuario.Usuario;


public class UsuarioDAO {
	private Connection conn;
	
	
	public UsuarioDAO(Connection conn){
		this.conn = conn;
	}
	
    public static String md5(String senha){  
        String sen = "";  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("MD5");  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));  
        sen = hash.toString(16);              
        return sen;  
    }  
      
	
	public void excluir(Usuario user) {

		 
		String sql = "DELETE FROM usuarios WHERE id=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, user.getId());
			stmt.executeUpdate();
			stmt.close();
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public boolean existeUsuario(Usuario usuario){	
		try{
			String sql = "select * from usuarios where login = ?  and senha = ?";
			PreparedStatement stmt = this.conn.prepareStatement(sql);
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, md5(usuario.getSenha()));
		
			ResultSet rs = stmt.executeQuery();
			
			stmt.execute();
			
			//verifica se existe retorno na consulta
			if(rs.next()){
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				stmt.close();
				return true;
			}
			
			stmt.close();
			
			}catch(SQLException e){
				throw new RuntimeException(e);
			}
			return false;
		}
	
	public String verificaTipo(String login){
		
		try{
			String sql = "select tipo from usuarios where login = ?";
			PreparedStatement stmt = this.conn.prepareStatement(sql);
			stmt.setString(1, login);
		
			ResultSet rs = stmt.executeQuery();
			
			stmt.execute();
			
			//verifica tipo de role
			if(rs.next()){
				stmt.close();
				return rs.getString("tipo");
			}
			
			stmt.close();
			
			}catch(SQLException e){
				throw new RuntimeException(e);
			}
			return null;
		}
	
}
	

