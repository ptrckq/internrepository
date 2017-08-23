package br.com.ptrck.webservices;

import javax.faces.bean.ManagedBean;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.infinispan.client.hotrod.RemoteCache;
import org.infinispan.client.hotrod.RemoteCacheManager;
import org.infinispan.client.hotrod.configuration.Configuration;
import org.infinispan.client.hotrod.configuration.ConfigurationBuilder;

import br.com.ptrck.model.Produto;

@Path("loja")
@ManagedBean
public class RestMetodos {

	Configuration conf = new ConfigurationBuilder().addServer().host("localhost").port(11422).build();
	RemoteCacheManager manager = new RemoteCacheManager(conf);
	RemoteCache defaultCache = manager.getCache();
	
	@POST
	@Path("produto/adiciona")
	@Produces(MediaType.TEXT_PLAIN)
	public void insereDados(@FormParam ("nome") String nome, @FormParam ("preco") Double preco, @FormParam ("cod") Integer codBarras) {
		
		Produto p = new Produto(nome,preco, codBarras);
		defaultCache.put(codBarras, p);
		System.out.println("Produto cadastrado com sucesso " + p);


	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("produto/recupera")
	public Produto recuperaProduto(@QueryParam("cod") Integer codigo) {
		Produto p = (Produto) defaultCache.get(codigo);
		
		return p;
	}

}
