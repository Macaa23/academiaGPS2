package com.ubb.gps.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.ubb.gps.model.Postulante;

@Repository
public interface PostulanteMapper {
	
	@Insert("INSERT INTO postulante(userName, password, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES"
			+ "(#{userName},#{password},#{RUT}, #{emailAddress}, #{Nombre}, #{dateOfBirth},#{genero},#{telefono})")
	void insertPostulante(Postulante postulante);
		
	@Select("SELECT ID as id, USERNAME as userName, PASSWORD as password, RUT as RUT, EMAILADDRESS as emailAddress, NOMBRE as Nombre, DATEOFBIRTH as dateOfBirth, GENERO as genero, TELEFONO as telefono "
			+ "FROM postulante WHERE userName = #{userName}")
	Postulante getPostulanteByUserName(String userName);
	
	@Select("SELECT ID as id, USERNAME as userName, PASSWORD as password, RUT as RUT, EMAILADDRESS as emailAddress, NOMBRE as Nombre, DATEOFBIRTH as dateOfBirth, GENERO as genero, TELEFONO as telefono "
			+ "FROM postulante WHERE RUT = #{RUT}")
	Postulante getPostulanteByRUT(String RUT);
	
	//@Update("UPDATE postulante SET emailAddress = emailAddress, telefono = telefono WHERE RUT = rut")
	@Update("UPDATE postulante SET emailAddress = #{emailAddress}, telefono = #{telefono} WHERE RUT = #{rut}")
	void updatePostulante(@Param("rut")String rut, @Param("emailAddress")String emailAddress, @Param("telefono")String telefono);
}
