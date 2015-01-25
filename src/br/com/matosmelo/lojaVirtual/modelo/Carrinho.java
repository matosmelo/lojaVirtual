package br.com.matosmelo.lojaVirtual.modelo;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class Carrinho {
	private List<Item> itens = new ArrayList<Item>();
	private Double total = 0.0;

	public List<Item> getItens() {
		return this.itens;
	}

	public void setItems(List<Item> itens) {
		this.itens = itens;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public void adiciona(Item item) {
		itens.add(item);
		total += item.getProduto().getPreco() * item.getQuantidade();
	}

	public Integer getTotalDeItens() {
		return itens.size();
	}

	public void remove(int indiceItem) {
		Item removido = itens.remove(indiceItem);
		total -= removido.getProduto().getPreco() * removido.getQuantidade();
	}
	
	public void limpa() {
		itens.clear();
		this.total = 0.0;
	}
}

