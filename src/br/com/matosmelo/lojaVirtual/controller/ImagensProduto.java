package br.com.matosmelo.lojaVirtual.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;
import br.com.matosmelo.lojaVirtual.modelo.Produto;

@Component
public class ImagensProduto {

	private File pastaImagensProduto;

	public ImagensProduto(ServletContext context) {
		String caminhoImagens = context.getRealPath("/WEB-INF/imagensProduto");
		pastaImagensProduto = new File(caminhoImagens);
		pastaImagensProduto.mkdir();

	}

	public void salva(UploadedFile imagem, Produto produto) {
		File destino = new File(pastaImagensProduto, produto.getId() + ".imagem");
		try {
			IOUtils.copy(imagem.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem", e);
		}
	}
	
	public File mostra(Produto produto) {
		return new File(pastaImagensProduto, produto.getId() + ".imagem");
		}
}
