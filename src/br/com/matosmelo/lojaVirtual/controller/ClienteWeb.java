package br.com.matosmelo.lojaVirtual.controller;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.matosmelo.lojaVirtual.modelo.Cliente;

@Component
@SessionScoped
public class ClienteWeb {
	private Cliente logado;

	// Loga cliente
	public void login(Cliente cliente) {
		this.logado = cliente;
	}

	public String getNome() {
		return logado.getNome();
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
