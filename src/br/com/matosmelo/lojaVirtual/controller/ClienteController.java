package br.com.matosmelo.lojaVirtual.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.matosmelo.lojaVirtual.controller.AutenticacaoInterceptorCliente.Liberado;
import br.com.matosmelo.lojaVirtual.dao.ClienteDAO;
import br.com.matosmelo.lojaVirtual.dao.ItemDoPedidoDAO;
import br.com.matosmelo.lojaVirtual.dao.PedidoDAO;
import br.com.matosmelo.lojaVirtual.modelo.Cliente;
import br.com.matosmelo.lojaVirtual.modelo.ItemDoPedido;
import br.com.matosmelo.lojaVirtual.modelo.Pedido;

@Resource
public class ClienteController {
	private final ClienteDAO clienteDAO;
	private final Result result;
	private final ClienteWeb clienteWeb;
	private final PedidoDAO pedidoDAO;
	private final ItemDoPedidoDAO itemDoPedidoDao;

	public ClienteController(ClienteDAO dao, Result result,
			ClienteWeb clienteWeb, PedidoDAO comprasDAO,
			ItemDoPedidoDAO produtosDoPedidoDao) {
		this.clienteDAO = dao;
		this.result = result;
		this.clienteWeb = clienteWeb;
		this.pedidoDAO = comprasDAO;
		this.itemDoPedidoDao = produtosDoPedidoDao;

	}

	@Get("/cliente")
	public void novoCliente() {

	}

	@Post("/clientes")
	public void adiciona(Cliente cliente) {
		clienteDAO.adiciona(cliente);
		result.redirectTo(LojaController.class).lista();
	}

	// Dados para preencher no login
	@Get("/loginCliente")
	public void clienteForm() {
	}

	@Post("/loginCliente")
	public void loginCliente(Cliente cliente) {
		Cliente carregado = clienteDAO.carrega(cliente);
		clienteWeb.login(carregado);
		result.redirectTo(LojaController.class).lista();
	}

	@Liberado
	@Path("/logoutCliente")
	public void logoutCliente() {
		clienteWeb.logout();
		result.redirectTo(LojaController.class).lista();
	}

	@Liberado
	@Get("/minhaConta")
	public Cliente minhaConta() {
		String login = clienteWeb.getLogin();
		return clienteDAO.busca(login);
	}

	@Liberado
	@Get("/minhaConta/meusDados")
	public Cliente meusDados() {
		String login = clienteWeb.getLogin();
		return clienteDAO.busca(login);

	}

	@Liberado
	@Get("/minhaConta/meusDados/{login}")
	public Cliente editaDados(String login) {
		return clienteDAO.busca(login);
	}

	@Liberado
	@Put("/minhaConta/meusDados/{cliente.login}")
	public void altera(Cliente cliente) {
		clienteDAO.atualiza(cliente);
		result.redirectTo(ClienteController.class).meusDados();
	}

	@Liberado
	@Get("/minhaConta/meusPedidos/{login}")
	public List<Pedido> meusPedidos(String login) {
		return pedidoDAO.listaPedido(login);
	}

	@Liberado
	@Get("/minhaConta/meusPedidos/detalheDoPedido/{id}")
	public List<ItemDoPedido> detalheDoPedido(Long id) {
		return itemDoPedidoDao.lista(id);
	}

}
