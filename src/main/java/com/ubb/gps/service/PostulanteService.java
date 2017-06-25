package com.ubb.gps.service;


import com.ubb.gps.model.Postulante;

public interface PostulanteService {
	void insertPostulante(Postulante postulante);
	Postulante getPostulanteByLogin(String userName, String password);
	boolean getPostulanteByUserName(String userName);
	boolean getPostulanteByRUT(String RUT);
	void updatePostulante(String RUT, String email, String phone);
}
