package com.ubb.gps.service;


import com.ubb.gps.mappers.InscripcionMapper;
import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Inscripcion;
import com.ubb.gps.model.curso_inscripcion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("cursoService")
public class InscripcionServiceImpl implements InscripcionService {

    @Autowired
    private InscripcionMapper inscripcionMapper;
    
    @Transactional
	public void insertInscripcion(Long course_id, Long postulante_id) {
		Date fecha = Calendar.getInstance().getTime();
		String Estado = getEstadoInscripcion(course_id);
		Inscripcion ins = new Inscripcion(fecha, Estado, postulante_id, course_id );
		inscripcionMapper.insertInscripcion(ins);
	}
    
    @Transactional
	public void deleteInscripcion(Long course_id, Long postulante_id) {
		inscripcionMapper.deleteInscripcion(course_id, postulante_id);
	}
    
    public List<Curso> getCursosByPostulanteId(Long postulante_id) {
        List<Curso> cursos = inscripcionMapper.getCursosByPostulanteId(postulante_id);
        return cursos;
    }
    
   
    public List<Curso> getAllCursos() {
        List<Curso> cursos = inscripcionMapper.getAllCursos();
        return cursos;
    }
    
   
	public boolean getCursoInscrito(Long course_id, Long postulante_id) {
		Inscripcion insc = inscripcionMapper.getCursoByPostulante(course_id, postulante_id);
		if(insc == null){
			return false;
		}else{
			return true;
		}
	}
    
   
	public String getEstadoInscripcion(Long id) {
		int inscritos = inscripcionMapper.getNumeroInscritos(id);
		int cupo = inscripcionMapper.getCupoCurso(id);
		if(inscritos > cupo){
			return "En lista de espera";
		}else{
			return "Preinscrito(a)";
		}
	}

	@Override
	public List<curso_inscripcion> getVistaCursos(Long postulante_id) {
		List<curso_inscripcion> cursos = inscripcionMapper.getVistaCursos(postulante_id);
        return cursos;
	}

}
