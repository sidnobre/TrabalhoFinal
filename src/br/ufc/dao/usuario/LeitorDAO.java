package br.ufc.dao.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.ufc.model.usuario.Leitor;

public class LeitorDAO {
	private Connection conn;
	
	public LeitorDAO(Connection conn){
		this.conn = conn;
	}
	

	public void inserir(Leitor leitor){

		String sql = "INSERT INTO usuarios (nome, email, login, senha, tipo) "
					+ "VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, leitor.getNome());
			ps.setString(2, leitor.getEmail());
			ps.setString(3, leitor.getLogin());
			ps.setString(4, leitor.getSenha());
			ps.setString(5, leitor.getTipo());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
