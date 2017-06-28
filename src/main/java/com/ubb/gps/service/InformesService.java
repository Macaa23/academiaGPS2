package com.ubb.gps.service;

import java.util.List;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Ranking;
import com.ubb.gps.model.postulante_inscripcion;

public interface InformesService {
	List<Ranking> getRanking();

	List<Curso> getCursos();

	List<postulante_inscripcion> getInscritos(Long course_id);
}
