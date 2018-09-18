package com.ipartek.formacion.youtube;

import java.util.ArrayList;
import java.util.List;

public class Video {

	public static final int ID_LONGITUD = 11;
	
	private String id;
	private String nombre;
	private List<Comentario> comentarios;
	
	public Video() {
		super();
		this.id = "YlUKcNNmywk";
		this.nombre = "Red Hot Chili Peppers - Californication";
		this.comentarios = new ArrayList<Comentario>();
	}
	
	public Video(String id, String nombre) throws Exception {
		this();
		this.setId(id);
		this.nombre = nombre;
	}
	
	public Video(String id, String nombre, List<Comentario> comentarios) throws Exception {
		this.setId(id);
		this.nombre = nombre;
		this.comentarios = comentarios;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) throws Exception {
		if ( id != null && id.length() == ID_LONGITUD ) {
			this.id = id;
		}else {
			throw new Exception("El ID debe ser exactamente de " + ID_LONGITUD + " caracteres");
		}	
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	
	
}