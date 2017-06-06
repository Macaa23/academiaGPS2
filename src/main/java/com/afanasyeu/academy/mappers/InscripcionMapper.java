package com.afanasyeu.academy.mappers;

import com.afanasyeu.academy.model.Curso;
import com.afanasyeu.academy.model.Inscripcion;
import com.afanasyeu.academy.model.Postulante;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InscripcionMapper {
    /*@Insert("INSERT INTO student(firstName,"
            + "lastName, dateOfBirth, emailAddress , postulante_id) VALUES"
            + "(#{firstName}, #{lastName},"
            + "#{dateOfBirth}, #{emailAddress}, #{postulanteId})")
    @Options(useGeneratedKeys=true, keyProperty="id", flushCache=true, keyColumn="id")
    void insertStudent(Student student);
	*/
	
    @Select("SELECT * FROM student WHERE postulante_id = #{id}")
    @Results(value={
            @Result(property="postulanteId", column ="postulante_id" )
    })
    List<Curso> getCursosByPostulanteId(Long id);
    
    @Select("SELECT Id, Nombre, Nivel FROM curso")
    List<Curso> getAllCursos();
    
    @Select("SELECT CUPO as Cupo FROM curso WHERE id = #{id}")
    Integer getCupoCurso(Long id);
    
    @Select("SELECT COUNT(id) as CANTIDAD FROM curso WHERE id = #{id}")
    Integer getNumeroInscritos(Long id);
    
    
    @Select("SELECT ID as id, FECHA as fecha, ESTADO as Estado, POSTULANTE_ID as postulante_id, COURSE_ID as course_id FROM inscripcion WHERE postulante_id = #{postulante_id} and course_id = #{course_id}")
    Inscripcion getCursoByPostulante(@Param("course_id")Long course_id, @Param("postulante_id") Long postulante_id);
    
	
    @Delete("DELETE FROM student WHERE id =#{studentId} AND postulante_id = #{postulanteId}")
    void deleteCursoById(@Param("studentId")Long studentId, @Param("postulanteId") Long postulanteId);
    
    @Insert("INSERT INTO inscripcion(fecha, Estado, course_id , postulante_id) VALUES" 
    + "(#{fecha}, #{estado}, #{course_id}, #{postulante_id})")
@Options(useGeneratedKeys=true, keyProperty="id", flushCache=true, keyColumn="id")
	void insertInscripcion(Inscripcion ins);

    /*
    @Select("SELECT FIRSTNAME as firstName, LASTNAME as lastName, "
            + "DATEOFBIRTH as dateOfBirth, EMAILADDRESS as emailAddress "
            + "FROM student WHERE firstName = #{firstName} AND lastName = #{lastName} " +
            "AND dateOfBirth = #{dateOfBirth}")
    @Results(value={
            @Result(property="postulanteId", column ="postulante_id" )
    })
    Student getStudentByFNameLNameDBirth(Student checkStudent);
    */
}