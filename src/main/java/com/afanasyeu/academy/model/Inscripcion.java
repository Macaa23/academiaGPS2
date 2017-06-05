package com.afanasyeu.academy.model;

import java.util.Date;

public class Inscripcion {
	
	Long id;
	Date fecha;
	String Estado;
	Long postulante_id;
	Long course_id;
	
	public Inscripcion(Date fecha, String Estado, Long postulante_id, Long course_id) {
		super();
		this.fecha = fecha;
		this.Estado = Estado;
		this.postulante_id = postulante_id;
		this.course_id = course_id;
	}

	public Long getId() {
		if(id != null){
			return id;
		}else{
			return (long) 0;
		}
		
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getEstado() {
		return Estado;
	}

	public void setEstado(String estado) {
		Estado = estado;
	}

	public Long getPostulante_id() {
		return postulante_id;
	}

	public void setPostulante_id(Long postulante_id) {
		this.postulante_id = postulante_id;
	}

	public Long getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Long course_id) {
		this.course_id = course_id;
	}
	
}
