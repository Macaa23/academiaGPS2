package com.afanasyeu.academy.model;


public class Curso {
    private Long id;
    private int cupo;
    private String Nombre;
    private String Nivel;
    private String emailAddress;
    private Long profesorId;

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getCupo() {
		return cupo;
	}

	public void setCupo(int cupo) {
		this.cupo = cupo;
	}

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

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public Long getProfesorId() {
		return profesorId;
	}

	public void setProfesorId(Long profesorId) {
		this.profesorId = profesorId;
	}
/*
	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Curso)) return false;

        Curso student = (Curso) o;

        if (!getFirstName().equals(student.getFirstName())) return false;
        if (!getLastName().equals(student.getLastName())) return false;
        if (!getEmailAddress().equals(student.getEmailAddress())) return false;
        if (!(getDateOfBirth().toString()).equals(student.getDateOfBirth().toString())) return false;
        return getPostulanteId().equals(student.getPostulanteId());
    }

    @Override
    public int hashCode() {
        int result = getFirstName().hashCode();
        result = 31 * result + getLastName().hashCode();
        result = 31 * result + getEmailAddress().hashCode();
        result = 31 * result + getDateOfBirth().hashCode();
        result = 31 * result + getPostulanteId().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", emailAddress='" + emailAddress + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", postulanteId=" + postulanteId +
                '}';
    }
    */
}
