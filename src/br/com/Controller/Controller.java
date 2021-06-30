package br.com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import br.com.BO.ProdutoBO;

import br.com.DTO.ProdutoDTO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		String msg;
		boolean result;

		switch (acao) {
		case "create":

			ProdutoBO produtoBO = new ProdutoBO();

			String nome = request.getParameter("nome");
			String descricao = request.getParameter("descricao");
			double valor = Double.parseDouble(request.getParameter("valor"));
			int quantidade = Integer.parseInt(request.getParameter("quantidade"));
			result = produtoBO.addProd(new ProdutoDTO(nome, descricao, valor, quantidade));
			if (result == true) {
				msg = "Produto Cadastrado Com Sucesso";
			} else
				msg = "Produto N�o Foi Cadastrado Com Sucesso";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("Cadastrar.jsp").forward(request, response);
			break;

		case "list":

			List<ProdutoDTO> listaProduto = new ArrayList<ProdutoDTO>();
			ProdutoBO produtoBOlist = new ProdutoBO();
			listaProduto = produtoBOlist.getListCar();
			request.setAttribute("listaProduto", listaProduto);
			request.getRequestDispatcher("Listar.jsp").forward(request, response);
			

			break;

		case "delete":

			String codigo = request.getParameter("id");
			Integer codProduto = Integer.parseInt(codigo);
			ProdutoBO produtoBOdelete = new ProdutoBO();
			result = produtoBOdelete.delete(codProduto);
			request.getRequestDispatcher("Controller?acao=list&method=get").forward(request, response);
			break;

		case "filter":

			String pesquisar = request.getParameter("pesquisar");
			ProdutoBO produtoBO1 = new ProdutoBO();
			ProdutoDTO produtoDTO = produtoBO1.searchById(pesquisar);
			request.setAttribute("produto", produtoDTO);
			request.getRequestDispatcher("Delete-Update.jsp").forward(request, response);
			
			break;

		case "update":
			ProdutoBO produtoBOupdate = new ProdutoBO();
			String cod = request.getParameter("cod");
			ProdutoDTO produtoDTO1 = produtoBOupdate.searchById(cod);
			String nomeUp = request.getParameter("nome");
			String descricaoUp = request.getParameter("descricao");
			double valorUp = Double.parseDouble(request.getParameter("valor"));
			int quantidadeUp = Integer.parseInt(request.getParameter("quantidade"));
			produtoDTO1.setNome(nomeUp);
			produtoDTO1.setDescricao(descricaoUp);
			produtoDTO1.setValor(valorUp);
			produtoDTO1.setQuantidade(quantidadeUp);
			result = produtoBOupdate.update(produtoDTO1);
			request.getRequestDispatcher("Controller?acao=list&method=get").forward(request, response);
			break;

		default:
			break;
		}

	}

}
