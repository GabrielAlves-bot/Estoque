package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import conexao.ConnectionFactory;
import br.com.DTO.ProdutoDTO;

public class ProdutoDAO {

	private Connection connection;
	private PreparedStatement ps;
	private Statement st;
	private ResultSet rs;
	List<ProdutoDTO> listaProduto = new ArrayList<ProdutoDTO>();

	public ProdutoDAO() {
		connection = new ConnectionFactory().getConnection();

	}

	public boolean addProd(ProdutoDTO produto) {
		String sql = "INSERT INTO produto (nome,descricao,valor,quantidade)values(?,?,?,?)";

		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, produto.getNome());
			ps.setString(2, produto.getDescricao());
			ps.setDouble(3, produto.getValor());
			ps.setInt(4, produto.getQuantidade());
			ps.execute();
			ps.close();
			return true;
		} catch (Exception erro) {
			System.out.println("Erro" + erro);
		}
		return false;
	}

	public List<ProdutoDTO> getListCar() {
		String sql = "SELECT * FROM produto";

		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				listaProduto.add(new ProdutoDTO(rs.getInt("id_produto"), rs.getString("nome"),
						rs.getString("descricao"), rs.getDouble("valor"), rs.getInt("quantidade")));
			}
		} catch (Exception erro) {
			System.out.println("Erro" + erro);
		}
		return listaProduto;

	}

	public boolean delete(Integer codProduto) {
		String sql = "DELETE FROM produto WHERE id_produto = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, codProduto);
			ps.execute();
			ps.close();
			return true;
		} catch (Exception e) {
			System.out.println("Erro" + e);
			return false;
		}

	}

	public ProdutoDTO searchById(String cod) {
		String sql = "SELECT * FROM produto where id_produto='" + cod + "'";

		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				return new ProdutoDTO(rs.getInt("id_produto"), rs.getString("nome"),
						rs.getString("descricao"), rs.getDouble("valor"), rs.getInt("quantidade"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public boolean update(ProdutoDTO produto) {
		
		try {
			String sql = "UPDATE produto set nome=?,descricao= ?,valor= ?,quantidade=? WHERE id_produto=?";
			ps = connection.prepareStatement(sql);
			ps.setString(1, produto.getNome());
			ps.setString(2, produto.getDescricao());
			ps.setDouble(3, produto.getValor());
			ps.setInt(4, produto.getQuantidade());
			ps.setInt(5,produto.getCod());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			
		}
		return false;
		
	}
}
