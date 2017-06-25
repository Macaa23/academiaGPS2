package com.ubb.gps.service.validators;

import com.ubb.gps.model.Postulante;
import com.ubb.gps.service.PostulanteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("postulanteValidator")
public class PostulanteValidator implements Validator {

    @Autowired
    private PostulanteService postulanteService;

    private static final String REGEX_USER_NAME = "^[a-zA-Z0-9_*!\\^]+$";
    private static final String REGEX_PASSWORD = "^[a-zA-Z0-9_*!\\^]+$";
    private static final String REGEX_EMAIL = "^[a-z0-9.]{3,25}@[a-z.]{3,10}\\.[a-z]{2,5}$";
    private static final String REGEX_NAME = "^[a-zA-Z ]*$";
    
    @Override
    public boolean supports(Class<?> aClass) {
        return Postulante.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Postulante postulante = (Postulante) target;
        String userName = postulante.getUserName();
        String password = postulante.getPassword();
        String RUT = postulante.getRUT();
        String correo = postulante.getEmailAddress();
        String name = postulante.getNombre();
        Date dateOfBirth = postulante.getDateOfBirth();
        String genero = postulante.getGenero();
        String telefono = postulante.getTelefono();
        
        if (userName.length() < 3 || userName.length() > 30) {
            errors.rejectValue("userName", "length.postulante.username");
        } else {
            Pattern p = Pattern.compile(REGEX_USER_NAME);
            Matcher m = p.matcher(userName);
            if (!m.matches()) {
                errors.rejectValue("userName", "pattern.postulante.username");
            } else {
                if(postulanteService.getPostulanteByUserName(postulante.getUserName())) {
                    errors.rejectValue("userName", "exist.postulante");
                }
            }
        }
        if (password.length() < 8 || password.length() > 15) {
            errors.rejectValue("password", "length.postulante.password");
        } else {
            Pattern p = Pattern.compile(REGEX_PASSWORD);
            Matcher m = p.matcher(password);
            if (!m.matches()) {
                errors.rejectValue("password", "pattern.postulante.password");
            }
        }
        
        if (RUT.length() < 8 || RUT.length() > 10) {
            errors.rejectValue("RUT", "length.postulante.RUT");
        } else {
            if(postulanteService.getPostulanteByRUT(postulante.getRUT())) {
                errors.rejectValue("RUT", "exist.postulante");
            }
            
        }
        
        Pattern p = Pattern.compile(REGEX_EMAIL);
        Matcher m = p.matcher(correo);
        if (!m.matches()) {
            errors.rejectValue("emailAddress", "email.postulante");
        }
        
        validateName(name, "Nombre", errors);
        
        if (dateOfBirth.after(new Date())) {
            errors.rejectValue("dateOfBirth", "date.postulante");
        }
    }
    
    private void validateName(String check, String field, Errors errors) {
        if (check.length() < 3 || check.length() > 30) {
            errors.rejectValue(field, "length.postulante");
        } else {
            Pattern p = Pattern.compile(REGEX_NAME);
            Matcher m = p.matcher(check);
            if (!m.matches()) {
                errors.rejectValue(field, "pattern.postulante");
            }
        }
    }
}
