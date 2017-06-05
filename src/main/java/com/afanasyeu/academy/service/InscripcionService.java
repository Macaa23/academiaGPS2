package com.afanasyeu.academy.service;

import com.afanasyeu.academy.model.Curso;
import com.afanasyeu.academy.model.Postulante;

import java.util.List;

public interface InscripcionService {
    void insertCurso(Curso curso);
    List<Curso> getCursosByPostulanteId(Long id);
    List<Curso> getAllCursos();
    void deleteCursoById(Long cursoId, Long postulanteId);
    //boolean getCursoByFNameLNameDBirth(Curso checkCurso);
    
	boolean getCursoInscrito(Long course_id, Long postulante_id);
	
	void insertInscripcion(Long course_id, Long postulante_id);
	String getEstadoInscripcion(Long course_id);
}
