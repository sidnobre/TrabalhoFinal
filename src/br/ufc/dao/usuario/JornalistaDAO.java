package br.ufc.dao.usuario;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.ufc.model.usuario.Jornalista;

public class JornalistaDAO {
	private Connection conn;
	
	public JornalistaDAO(Connection conn){
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
      

	public void inserir(Jornalista jornalista){

		String sql = "INSERT INTO usuarios (nome, email, login, senha, tipo) "
					+ "VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jornalista.getNome());
			ps.setString(2, jornalista.getEmail());
			ps.setString(3, jornalista.getLogin());
			ps.setString(4, md5(jornalista.getSenha()));
			ps.setString(5, jornalista.getTipo());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
