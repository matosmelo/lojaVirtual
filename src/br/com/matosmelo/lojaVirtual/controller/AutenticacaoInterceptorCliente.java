package br.com.matosmelo.lojaVirtual.controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class AutenticacaoInterceptorCliente implements Interceptor {
	private final ClienteWeb cliente;
	private final Result result;

	public AutenticacaoInterceptorCliente(ClienteWeb cliente, Result result) {
		this.cliente = cliente;
		this.result = result;

	}

	public boolean accepts(ResourceMethod method) {
		return !cliente.isLogado() && method.containsAnnotation(Liberado.class);	
	}

	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		result.redirectTo(ClienteController.class).clienteForm();
	}

	// a anotação vai ficar disponível em tempo de execucao
	@Retention(RetentionPolicy.RUNTIME)
	@Target(ElementType.METHOD)
	// anotação para os métodos
	public @interface Liberado {

	}
}
