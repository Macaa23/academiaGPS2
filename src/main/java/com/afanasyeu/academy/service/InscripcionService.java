package com.afanasyeu.academy.service;

import com.afanasyeu.academy.model.Curso;
import com.afanasyeu.academy.model.Postulante;

import java.util.List;

public interface InscripcionService {
	
    List<Curso> getCursosByPostulanteId(Long id);
    List<Curso> getAllCursos();
	boolean getCursoInscrito(Long course_id, Long postulante_id);
	void insertInscripcion(Long course_id, Long postulante_id);
	String getEstadoInscripcion(Long course_id);
}
