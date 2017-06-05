package com.afanasyeu.academy.mappers;

import com.afanasyeu.academy.model.Postulante;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import org.springframework.stereotype.Repository;

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
}
