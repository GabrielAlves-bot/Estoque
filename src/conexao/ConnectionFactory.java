package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {

		String url = "jdbc:mysql://localhost:3306/estoque";
		String user = "root";
		String password = "123456";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, user, password);
		} catch (Exception erro) {
			throw new RuntimeException("Erro na conexão" + erro);
		}

	}

}
