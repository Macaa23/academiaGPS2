package com.afanasyeu.academy.mappers;

import com.afanasyeu.academy.model.Ranking;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
	
	@Select("SELECT NOMBRE as Nombre, NIVEL as Nivel, CUPO as Cupo, Inscritos_totales as Total FROM ranking")
	List<Ranking> getRankingData();
}
