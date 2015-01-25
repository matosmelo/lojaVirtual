package br.com.matosmelo.lojaVirtual.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ItemDoPedido {

	@Id
	@GeneratedValue
	private Long id;
	private Long idDoPedido;
	@ManyToOne
	private Produto produto;
	private int qntdade;

	public int getQntdade() {
		return this.qntdade;
	}

	public void setQntdade(int qntdade) {
		this.qntdade = qntdade;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdDoPedido() {
		return this.idDoPedido;
	}

	public void setIdDoPedido(Long idDoPedido) {
		this.idDoPedido = idDoPedido;
	}

	public Produto getProduto() {
		return this.produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}
}
