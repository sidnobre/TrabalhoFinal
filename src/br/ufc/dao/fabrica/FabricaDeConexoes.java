package br.ufc.dao.fabrica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FabricaDeConexoes {
	
	public Connection getConexao(){
		String url = "jdbc:mysql://localhost/webinfo-jornal";
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			conn = DriverManager.getConnection(url, "root", "root");
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

}
