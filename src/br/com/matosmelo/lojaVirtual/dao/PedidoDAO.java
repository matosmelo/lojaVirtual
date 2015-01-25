package br.com.matosmelo.lojaVirtual.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.ioc.Component;
import br.com.matosmelo.lojaVirtual.modelo.Pedido;

@Component
public class PedidoDAO {
	private final Session session;

	public PedidoDAO(Session session) {
		this.session = session;
	}

	public void salva(Pedido pedido) {
		Transaction tx = session.beginTransaction();
		session.save(pedido);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Pedido> listaPedido(String login) {
		return this.session.createQuery(
				"select pedido from Pedido as pedido where pedido.cliente.login ='"
						+ login + "'").list();
	}
}
