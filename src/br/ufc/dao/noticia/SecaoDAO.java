package br.ufc.dao.noticia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufc.model.noticia.Secao;

public class SecaoDAO {
	private Connection conn;
	
	public SecaoDAO(Connection conn) {
		this.conn=conn;
	}
	
	public void inserir(Secao secao){

		String sql = "INSERT INTO secao (titulo, descricao) "
					+ "VALUES (?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, secao.getTitulo());
			ps.setString(2, secao.getDescricao());

			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Secao secao) {
		
		String sql = "DELETE FROM secao WHERE id=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, secao.getId());
			stmt.executeUpdate();
			stmt.close();
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<Secao>  listar() {
		List<Secao> secoes = new ArrayList<Secao>();
		String sql = "select * FROM secao ORDER BY titulo";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Secao secao = new Secao();
				secao.setId(rs.getInt("id"));
				secao.setTitulo(rs.getString("titulo"));
				secao.setDescricao(rs.getString("descricao"));
				secoes.add(secao);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return secoes;
		
	}
	
}

