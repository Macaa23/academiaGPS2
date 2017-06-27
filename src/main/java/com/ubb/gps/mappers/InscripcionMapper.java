package com.ubb.gps.mappers;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Inscripcion;

import java.util.List;

@Repository
public interface InscripcionMapper {

    //@Select("SELECT course_id, nombre, nivel from curso as c join inscripcion as i on i.course_id = c.id where postulante_id = #{postulante_id}")
	@Select("SELECT * from curso where id IN(select course_id from inscripcion where postulante_id = #{postulante_id})")
	List<Curso> getCursosByPostulanteId(@Param("postulante_id") Long postulante_id);
    
    @Select("SELECT Id, Nombre, Nivel FROM curso")
    List<Curso> getAllCursos();
    
    @Select("SELECT CUPO as Cupo FROM curso WHERE id = #{id}")
    Integer getCupoCurso(Long id);
    
    @Select("SELECT COUNT(id) as CANTIDAD FROM inscripcion WHERE course_id = #{id}")
    Integer getNumeroInscritos(Long id);
    
    
    @Select("SELECT ID as id, FECHA as fecha, ESTADO as Estado, POSTULANTE_ID as postulante_id, COURSE_ID as course_id FROM inscripcion WHERE postulante_id = #{postulante_id} and course_id = #{course_id}")
    Inscripcion getCursoByPostulante(@Param("course_id")Long course_id, @Param("postulante_id") Long postulante_id);
    
	
    @Delete("DELETE FROM inscripcion WHERE course_id = #{course_id} AND postulante_id = #{postulante_id}")
    void deleteInscripcion(@Param("course_id")Long course_id, @Param("postulante_id") Long postulante_id);
    
    @Insert("INSERT INTO inscripcion(fecha, Estado, course_id , postulante_id) VALUES" 
    + "(#{fecha}, #{estado}, #{course_id}, #{postulante_id})")
@Options(useGeneratedKeys=true, keyProperty="id", flushCache=true, keyColumn="id")
	void insertInscripcion(Inscripcion ins);

}