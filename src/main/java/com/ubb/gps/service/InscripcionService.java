package com.ubb.gps.service;

import java.util.List;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Postulante;

public interface InscripcionService {
	
    List<Curso> getCursosByPostulanteId(Long postulante_id);
    List<Curso> getAllCursos();
	boolean getCursoInscrito(Long course_id, Long postulante_id);
	void insertInscripcion(Long course_id, Long postulante_id);
	String getEstadoInscripcion(Long course_id);
	void deleteInscripcion(Long course_id, Long postulante_id);
}
