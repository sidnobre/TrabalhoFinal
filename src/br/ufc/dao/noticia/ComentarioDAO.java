package br.ufc.dao.noticia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufc.model.noticia.Comentario;

public class ComentarioDAO {
	private Connection conn;
	
	public ComentarioDAO(Connection conn) {
		this.conn=conn;
	}
	
	public void inserir(Comentario comentario){

		String sql = "INSERT INTO comentario (noticia, autor, texto) "
					+ "VALUES (?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, comentario.getIdNoticia());
			ps.setString(2, comentario.getAutor());
			ps.setString(3, comentario.getTexto());

			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Comentario>  listar(int idNoticia) {
		List<Comentario> comentarios = new ArrayList<Comentario>();
		String sql = "select * FROM comentario WHERE idNoticia=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, idNoticia);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Comentario comentario = new Comentario();
				comentario.setId(rs.getInt("id"));
				comentario.setIdNoticia(rs.getInt("idnoticia"));
				comentario.setAutor(rs.getString("autor"));
				comentario.setTexto(rs.getString("texto"));
				comentarios.add(comentario);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comentarios;
		
	}
}
