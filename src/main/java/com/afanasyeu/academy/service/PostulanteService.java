package com.afanasyeu.academy.service;

import com.afanasyeu.academy.model.Postulante;

public interface PostulanteService {
	void insertPostulante(Postulante postulante);
	Postulante getPostulanteByLogin(String userName, String password);
	boolean getPostulanteByUserName(String userName);
	boolean getPostulanteByRUT(String RUT);
}
