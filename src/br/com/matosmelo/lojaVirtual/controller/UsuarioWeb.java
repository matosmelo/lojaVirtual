package br.com.matosmelo.lojaVirtual.controller;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.matosmelo.lojaVirtual.modelo.Usuario;

@Component
@SessionScoped
public class UsuarioWeb {

	private Usuario logado;

	// Loga usuario
	public void login(Usuario usuario) {
		this.logado = usuario;
	}

	public String getLogin() {
		return logado.getLogin();
	}

	public boolean isLogado() {
		return logado != null;
	}

	public void logout() {
		this.logado = null;
	}
}
