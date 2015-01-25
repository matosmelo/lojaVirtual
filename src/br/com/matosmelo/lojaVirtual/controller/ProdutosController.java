package br.com.matosmelo.lojaVirtual.controller;

import java.io.File;
import java.util.List;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.matosmelo.lojaVirtual.controller.AutenticacaoInterceptor.Restrito;
import br.com.matosmelo.lojaVirtual.dao.ProdutoDAO;
import br.com.matosmelo.lojaVirtual.modelo.Produto;

@Resource
public class ProdutosController {
	private final ProdutoDAO produtoDAO;
	private final Result result;
	private final ImagensProduto imagens;

	public ProdutosController(ProdutoDAO produtoDAO, Result result,
			ImagensProduto imagens) {
		this.produtoDAO = produtoDAO;
		this.result = result;
		this.imagens = imagens;

	}

	@Restrito
	@Get("/produto/novo")
	public void formulario() {

	}

	@Restrito
	@Get("/produto/{id}")
	public Produto edita(Long id) {
		return produtoDAO.carrega(id);
	}

	@Restrito
	@Put("/produto/{produto.id}")
	public void altera(Produto produto, final UploadedFile imagem) {
		produtoDAO.atualiza(produto);
		imagens.salva(imagem, produto);
		result.redirectTo(this).lista();
	}

	@Restrito
	@Post("/produto")
	public void adiciona(Produto produto, final UploadedFile imagem) {
		produtoDAO.salva(produto);
		imagens.salva(imagem, produto);
		result.redirectTo(this).lista();

	}

	@Restrito
	@Delete("/produto/{id}")
	public void remove(Long id) {
		Produto produto = produtoDAO.carrega(id);
		produtoDAO.remove(produto);
		result.redirectTo(this).lista();
	}

	@Restrito
	@Get("/produto")
	public List<Produto> lista() {
		return produtoDAO.listaProduto();
	}

	@Get("/produto/{produto.id}/imagem")
	public File download(Produto produto) {
		return imagens.mostra(produto);
	}

}
