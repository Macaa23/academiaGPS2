package com.ubb.gps.service.validators;

import com.ubb.gps.model.Postulante;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("postulanteUpdateValidator")
public class PostulanteUpdateValidator implements Validator {
	
    private static final String REGEX_EMAIL = "^[a-z0-9.]{3,25}@[a-z.]{3,10}\\.[a-z]{2,5}$";
    
    @Override
    public boolean supports(Class<?> aClass) {
        return Postulante.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        
        Pattern p = Pattern.compile(REGEX_EMAIL);
        Matcher m = p.matcher(target.toString());
        if (!m.matches()) {
            errors.rejectValue("emailAddress", "email.postulante");
        }
    }
}
