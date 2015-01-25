package br.com.matosmelo.lojaVirtual.controller;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.matosmelo.lojaVirtual.controller.AutenticacaoInterceptorCliente.Liberado;
import br.com.matosmelo.lojaVirtual.dao.ProdutoDAO;
import br.com.matosmelo.lojaVirtual.modelo.Carrinho;
import br.com.matosmelo.lojaVirtual.modelo.Item;

@Resource
public class CarrinhoController {

	private final Carrinho carrinho;
	private final ProdutoDAO produtoDAO;
	private final Result result;

	public CarrinhoController(Carrinho carrinho, ProdutoDAO produtoDAO,
			Result result) {
		this.carrinho = carrinho;
		this.produtoDAO = produtoDAO;
		this.result = result;

	}

	@Liberado
	@Get("/carrinho")
	public void carrinho() {

	}

	@Liberado
	@Post("/carrinho")
	public void adiciona(Item item) {
		produtoDAO.recarrega(item.getProduto());
		carrinho.adiciona(item);

		result.redirectTo(this).carrinho();
	}

	@Liberado
	@Delete("/carrinho/{indiceItem}")
	public void remove(int indiceItem) {
		carrinho.remove(indiceItem);

		result.redirectTo(this).carrinho();
	}

	@Liberado
	@Path("/carrinho/cancelaPedido")
	public void cancelaPedido() {
		carrinho.limpa();

		result.redirectTo(LojaController.class).lista();
	}

	// Pagar itens do carrinho
	@Liberado
	@Get("/carrinho/pagamento/{login}")
	public void pagamento() {

	}

}
