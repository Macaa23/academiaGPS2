package com.ubb.gps.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Inscripcion;
import com.ubb.gps.model.Ranking;
import com.ubb.gps.model.postulante_inscripcion;

@Repository
public interface AdminMapper {
	
	@Select("SELECT NOMBRE as Nombre, NIVEL as Nivel, CUPO as Cupo, Inscritos_totales as Total FROM ranking")
	List<Ranking> getRankingData();
	
	@Select("SELECT * FROM curso")
	List<Curso> getCursos();
	
	@Select("select rut, nombre, emailAddress, dateOfBirth, genero, telefono, estado from inscripcion as ins join postulante as pus on ins.postulante_id = pus.id where course_id = #{course_id}")
	List<postulante_inscripcion> getInscritos(@Param("course_id")Long course_id);
	
	@Select("select count(estado) from inscripcion where course_id = #{course_id} and estado = 'Preinscrito(a)'")
	int getCountTrueInscritos(@Param("course_id")Long course_id);
	
	@Select("select count(estado) from inscripcion where course_id = #{course_id} and estado = 'En lista de espera'")
	int getCountFalseInscritos(@Param("course_id")Long course_id);
	
	@Select("select avg(cursos) from (select count(postulante_id) as cursos from inscripcion group by postulante_id) as promedio")
	float getInscripcionesPromedio();
	
	@Select("select * from inscripcion ORDER BY ID DESC LIMIT 1 ")
	Inscripcion getLastInscripcion();

	@Select("select * from inscripcion ORDER BY ID ASC LIMIT 1 ")
	Inscripcion getFirstInscripcion();

	@Select("select avg(inscritos) from (select count(course_id) as inscritos from inscripcion group by course_id) as promedio")
	float getInscritosPromedio();
}
