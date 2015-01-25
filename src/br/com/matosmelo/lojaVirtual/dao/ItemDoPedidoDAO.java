package br.com.matosmelo.lojaVirtual.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.ioc.Component;
import br.com.matosmelo.lojaVirtual.modelo.ItemDoPedido;

@Component
public class ItemDoPedidoDAO {

	private final Session session;

	public ItemDoPedidoDAO(Session session) {
		this.session = session;
	}

	public void salva(ItemDoPedido itemDoPedido) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(itemDoPedido);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	public List<ItemDoPedido> lista(Long id) {
		return this.session.createQuery(
				"select item from ItemDoPedido as item where item.idDoPedido='"
						+ id + "'").list();
	}
}
