package br.ufc.dao.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.ufc.model.usuario.Jornalista;

public class JornalistaDAO {
	private Connection conn;
	
	public JornalistaDAO(Connection conn){
		this.conn = conn;
	}
	

	public void inserir(Jornalista jornalista){

		String sql = "INSERT INTO usuarios (nome, email, login, senha, tipo) "
					+ "VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jornalista.getNome());
			ps.setString(2, jornalista.getEmail());
			ps.setString(3, jornalista.getLogin());
			ps.setString(4, jornalista.getSenha());
			ps.setString(5, jornalista.getTipo());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
