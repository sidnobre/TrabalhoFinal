package br.ufc.dao.noticia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufc.model.noticia.Classificado;

public class ClassificadoDAO {
	private Connection conn;
	
	public ClassificadoDAO(Connection conn) {
		this.conn=conn;
	}
	
	public void inserir(Classificado classificado){

		String sql = "INSERT INTO classificado (titulo, texto, preco, telefone) "
					+ "VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, classificado.getTitulo());
			ps.setString(2, classificado.getTexto());
			ps.setFloat(3, classificado.getPreco());
			ps.setString(4, classificado.getTelefone());

			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void altera(Classificado classificado){
		String sql = "UPDATE classificado SET melhor_oferta=?, autor_oferta=? WHERE id=?";
			System.out.println("entrou AKI");
			try {
				PreparedStatement stmt;
				stmt = conn.prepareStatement(sql);
				
				stmt.setFloat(1, classificado.getMelhorOferta());
				stmt.setString(2, classificado.getAutorOferta());
				stmt.setInt(3, classificado.getId());
				stmt.execute();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	public List<Classificado>  listar() {
		List<Classificado> classificados = new ArrayList<Classificado>();
		String sql = "select * FROM classificado";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Classificado classificado = new Classificado();
				classificado.setId(rs.getInt("id"));
				classificado.setTitulo(rs.getString("titulo"));
				classificado.setTexto(rs.getString("texto"));
				classificado.setPreco(rs.getFloat("preco"));
				classificado.setTelefone(rs.getString("telefone"));
				classificado.setMelhorOferta(rs.getFloat("melhor_oferta"));
				classificado.setDataOferta(rs.getDate("data_oferta"));
				classificado.setAutorOferta(rs.getString("autor_oferta"));
				classificados.add(classificado);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return classificados;
	}
	
	public List<Classificado>  listarID(int id) {
		List<Classificado> classificados = new ArrayList<Classificado>();
		String sql = "select * FROM classificado WHERE id=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
					
			while(rs.next()){
				Classificado classificado = new Classificado();
				classificado.setId(rs.getInt("id"));
				classificado.setTitulo(rs.getString("titulo"));
				classificado.setTexto(rs.getString("texto"));
				classificado.setPreco(rs.getFloat("preco"));
				classificado.setTelefone(rs.getString("telefone"));
				classificado.setMelhorOferta(rs.getFloat("melhor_oferta"));
				classificado.setDataOferta(rs.getDate("data_oferta"));
				classificado.setAutorOferta(rs.getString("autor_oferta"));
				classificados.add(classificado);
			}
			stmt.close();
			 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return classificados;
		
	}
	
}
