package br.ufc.dao.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.ufc.model.usuario.Editor;

public class EditorDAO {
	private Connection conn;
	
	public EditorDAO(Connection conn){
		this.conn = conn;
	}
	

	public void inserir(Editor editor){

		String sql = "INSERT INTO usuarios (nome, email, login, senha, tipo) "
					+ "VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, editor.getNome());
			ps.setString(2, editor.getEmail());
			ps.setString(3, editor.getLogin());
			ps.setString(4, editor.getSenha());
			ps.setString(5, editor.getTipo());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
