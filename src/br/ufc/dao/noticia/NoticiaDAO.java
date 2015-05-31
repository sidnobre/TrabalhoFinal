package br.ufc.dao.noticia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufc.model.noticia.Noticia;

public class NoticiaDAO {
	private Connection conn;
	
	public NoticiaDAO(Connection conn) {
		this.conn=conn;
	}
	
	public void inserir(Noticia noticia){

		String sql = "INSERT INTO noticia (titulo, subtitulo, texto, autor, data_noticia, id_secao, imagem) "
					+ "VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, noticia.getTitulo());
			ps.setString(2, noticia.getSubtitulo());
			ps.setString(3, noticia.getTexto());
			ps.setString(4, noticia.getAutor());
			ps.setDate(5, noticia.getData());
			ps.setInt(6, noticia.getIdsecao());
			ps.setByte(7, noticia.getImagem());

			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Noticia noticia){
		String sql = "DELETE FROM noticia WHERE id=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, noticia.getId());
			stmt.executeUpdate();
			stmt.close();
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//Lista ja em ordem da mais nova para mais antiga
	public List<Noticia> listar(int pagina){
		List<Noticia> noticias = new ArrayList<Noticia>();
		String sql = "select * FROM noticia ORDER BY data_noticia DESC LIMIT 10 OFFSET ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			if(pagina==0)
				stmt.setInt(1, pagina);
			else
				stmt.setInt(1, pagina*10);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Noticia noticia = new Noticia();
				noticia.setId(rs.getInt("id"));
				noticia.setTitulo(rs.getString("titulo"));
				noticia.setSubtitulo(rs.getString("subtitulo"));
				noticia.setTexto(rs.getString("texto"));
				noticia.setAutor(rs.getString("autor"));
				noticia.setData(rs.getDate("data_noticia"));
				noticia.setIdsecao(rs.getInt("id_secao"));
				noticia.setImagem(rs.getByte("imagem"));
				noticias.add(noticia);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noticias;
	}
	//Lista por id
		public List<Noticia> listarID(int id){
			List<Noticia> noticias = new ArrayList<Noticia>();
			String sql = "select * FROM noticia WHERE id=?";
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				ResultSet rs = stmt.executeQuery();
						
				while(rs.next()){
					Noticia noticia = new Noticia();
					noticia.setId(rs.getInt("id"));
					noticia.setTitulo(rs.getString("titulo"));
					noticia.setSubtitulo(rs.getString("subtitulo"));
					noticia.setTexto(rs.getString("texto"));
					noticia.setAutor(rs.getString("autor"));
					noticia.setData(rs.getDate("data_noticia"));
					noticia.setIdsecao(rs.getInt("id_secao"));
					noticia.setImagem(rs.getByte("imagem"));
					noticias.add(noticia);
				}
				stmt.close();
				 			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return noticias;
		}
	//Lista pela seção
	public List<Noticia> listarSecao(int idsecao){
		List<Noticia> noticias = new ArrayList<Noticia>();
		String sql = "select * FROM noticia WHERE id_secao=? ORDER BY data_noticia DESC";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, idsecao);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Noticia noticia = new Noticia();
				noticia.setId(rs.getInt("id"));
				noticia.setTitulo(rs.getString("titulo"));
				noticia.setSubtitulo(rs.getString("subtitulo"));
				noticia.setTexto(rs.getString("texto"));
				noticia.setAutor(rs.getString("autor"));
				noticia.setData(rs.getDate("data_noticia"));
				noticia.setIdsecao(rs.getInt("id_secao"));
				noticia.setImagem(rs.getByte("imagem"));
				noticias.add(noticia);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noticias;
	}

}
