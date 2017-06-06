package com.afanasyeu.academy.model;

import java.util.Comparator;

public class Ranking{
	private String Nombre;
	private String Nivel;
	private int Cupo;
	private int Total;
	private int Lista_Espera;
	private int Porcentaje;
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getNivel() {
		return Nivel;
	}
	public void setNivel(String nivel) {
		Nivel = nivel;
	}
	public int getCupo() {
		return Cupo;
	}
	public void setCupo(int cupo) {
		Cupo = cupo;
	}
	public int getTotal() {
		return Total;
	}
	public void setTotal(int total) {
		Total = total;
	}
	
	//Different
	
	public int getLista_Espera() {
		Lista_Espera = getTotal() - getCupo();
		if(Lista_Espera <= 0){
			return 0;
		}else{
			return Lista_Espera;
		}
	}
	public void setLista_Espera(int lista_Espera) {
		Lista_Espera = lista_Espera;
	}
	public int getPorcentaje() {
		if(getLista_Espera() != 0 ){
			return Porcentaje = 100;
		}else{
			Porcentaje = ((getTotal()*100)/getCupo());
			return Porcentaje;
		}
	}
	public void setPorcentaje(int porcentaje) {
		Porcentaje = porcentaje;
	}
	
	public int getPosicion() {
		return getPorcentaje() + getLista_Espera();
	}
}

