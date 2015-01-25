package br.com.matosmelo.lojaVirtual.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.matosmelo.lojaVirtual.controller.AutenticacaoInterceptorCliente.Liberado;
import br.com.matosmelo.lojaVirtual.dao.ProdutoDAO;
import br.com.matosmelo.lojaVirtual.modelo.Produto;

@Resource
public class LojaController {
	private final ProdutoDAO produtoDAO;

	public LojaController(ProdutoDAO produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	@Liberado
	@Get("/loja")
	public List<Produto> lista() {
		return produtoDAO.listaProduto();
	}

}
