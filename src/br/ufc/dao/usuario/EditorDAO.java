package br.ufc.dao.usuario;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.ufc.model.usuario.Editor;

public class EditorDAO {
	private Connection conn;
	
	public EditorDAO(Connection conn){
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
      

	public void inserir(Editor editor){

		String sql = "INSERT INTO usuarios (nome, email, login, senha, tipo) "
					+ "VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, editor.getNome());
			ps.setString(2, editor.getEmail());
			ps.setString(3, editor.getLogin());
			ps.setString(4, md5(editor.getSenha()));
			ps.setString(5, editor.getTipo());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
