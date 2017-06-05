package com.afanasyeu.academy.service;

import com.afanasyeu.academy.mappers.PostulanteMapper;
import com.afanasyeu.academy.model.Postulante;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("postulanteService")
public class PostulanteServiceImpl implements PostulanteService {

	@Autowired
	private PostulanteMapper postulanteMapper;
	
	@Transactional
	public void insertPostulante(Postulante postulante) {
		postulanteMapper.insertPostulante(postulante);
	}

	public Postulante getPostulanteByLogin(String userName, String password) {
		Postulante postulante = postulanteMapper.getPostulanteByUserName(userName);
		if(postulante != null && postulante.getPassword().equals(password)) {
			return postulante;
		}
		return null;
	}

	public boolean getPostulanteByUserName(String userName) {
		Postulante postulante = postulanteMapper.getPostulanteByUserName(userName);
		if(postulante != null) {
			return true;
		}
		return false;
	}
	
	public boolean getPostulanteByRUT(String RUT) {
		Postulante postulante = postulanteMapper.getPostulanteByRUT(RUT);
		if(postulante != null) {
			return true;
		}
		return false;
	}
}
