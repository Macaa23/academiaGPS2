package com.ubb.gps.model;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

public class Postulante {
	private Long id;
	private String userName;
	private String password;
	private String RUT;
	private String emailAddress;
	private String Nombre;
	private Date dateOfBirth;
	private String genero;
	private String telefono;

	public String getRUT() {
		return RUT;
	}

	public void setRUT(String rUT) {
		RUT = rUT;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getSimpleDateOfBirth() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		return formatter.format(dateOfBirth);
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Long getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getAge(){
		LocalDate n = dateOfBirth.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate hoy = LocalDate.now();
		Period p = Period.between(n, hoy);
		return p.getYears();
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof Postulante))
			return false;

		Postulante postulante = (Postulante) o;

		if (!getUserName().equals(postulante.getUserName()))
			return false;
		return getPassword().equals(postulante.getPassword());
	}

	@Override
	public int hashCode() {
		int result = getUserName().hashCode();
		result = 31 * result + getPassword().hashCode();
		return result;
	}

	@Override
	public String toString() {
		return "Postulante{" + "id=" + id + ", userName='" + userName + '\'' + ", password='" + password + '\'' + '}';
	}
}