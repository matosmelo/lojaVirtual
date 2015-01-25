package br.com.matosmelo.lojaVirtual.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.matosmelo.lojaVirtual.dao.UsuarioDAO;
import br.com.matosmelo.lojaVirtual.modelo.Usuario;

@Resource
public class UsuarioController {

	private final UsuarioDAO usuarioDAO;
	private final Result result;
	private final UsuarioWeb usuarioWeb;

	public UsuarioController(UsuarioDAO usuarioDAO, Result result,
			UsuarioWeb usuarioWeb) {
		this.usuarioDAO = usuarioDAO;
		this.result = result;
		this.usuarioWeb = usuarioWeb;

	}

	@Get("/adm")
	public void novo() {

	}

	@Post("/usuario")
	public void adiciona(Usuario usuario) {
		usuarioDAO.adiciona(usuario);
		result.redirectTo(ProdutosController.class).lista();
	}

	@Get("/loginUsuario")
	public void loginForm() {
	}

	@Post("/login")
	public void login(Usuario usuario) {
		Usuario carregado = usuarioDAO.carrega(usuario);
		usuarioWeb.login(carregado);
		result.redirectTo(ProdutosController.class).lista();
	}

	@Path("/logout")
	public void logout() {
		usuarioWeb.logout();
		result.redirectTo(ProdutosController.class).lista();
	}
}
