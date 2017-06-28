package com.ubb.gps.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubb.gps.mappers.AdminMapper;
import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Ranking;
import com.ubb.gps.model.postulante_inscripcion;

@Service("informesService")
public class InformesServiceImpl implements InformesService{
	
	@Autowired
    private AdminMapper adminMapper;
	

	private List<Ranking> getRankingData() {
		List<Ranking> ranks = adminMapper.getRankingData();
		return ranks;
	}

	@Override
	public List<Ranking> getRanking() {
		List<Ranking> lista_ordenada = getRankingData();
		Collections.sort(lista_ordenada, new OrdenRank().reversed());
		return lista_ordenada;
	}

	@Override
	public List<Curso> getCursos() {
		List<Curso> cursos = adminMapper.getCursos();
		return cursos;
	}

	@Override
	public List<postulante_inscripcion> getInscritos(Long course_id) {
		List<postulante_inscripcion> inscritos = adminMapper.getInscritos(course_id);
		return inscritos;
	}

}

class OrdenRank implements Comparator<Ranking> {
    public int compare(Ranking r1, Ranking r2) {
        return r1.getPosicion() - r2.getPosicion();
    }
}