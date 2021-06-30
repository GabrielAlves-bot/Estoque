package br.com.BO;

import br.com.DTO.ProdutoDTO;

import java.util.List;

import br.com.DAO.ProdutoDAO;

public class ProdutoBO {
	ProdutoDAO produtoDAO = new ProdutoDAO();

	public boolean addProd(ProdutoDTO produtoDTO) {

		return produtoDAO.addProd(produtoDTO);
	}
	
	public List<ProdutoDTO> getListCar() {
		
		return produtoDAO.getListCar();
	}
	
	public boolean delete(Integer codProduto) {
		
		return produtoDAO.delete(codProduto);
	}
	
	public ProdutoDTO searchById(String cod) {
		return produtoDAO.searchById(cod);
	}
	
	public boolean update(ProdutoDTO produto) {
		
		return produtoDAO.update(produto);
	}
}
