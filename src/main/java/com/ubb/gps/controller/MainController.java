package com.ubb.gps.controller;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Postulante;
import com.ubb.gps.service.InformesService;
import com.ubb.gps.service.InscripcionService;
import com.ubb.gps.service.PostulanteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes({ "postulante", "inscripcion" })
public class MainController {

	@Autowired
	private PostulanteService postulanteService;

	@Autowired
	private InscripcionService inscripcionService;

	@Autowired
	@Qualifier("postulanteValidator")
	private Validator postulanteValidator;
	
	@Autowired
	private InformesService informesService;

	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(Model model, HttpSession httpSession) {
		model.addAttribute("ranks", informesService.getRanking());
		return "adminIndex";
	}


	// SIGNUP
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		Postulante postulante = new Postulante();
		model.addAttribute("postulante", postulante);
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute("postulante") Postulante postulante, BindingResult result, Model model) {
		postulanteValidator.validate(postulante, result);
		if (result.hasErrors()) {
			return "signup";
		}
		postulanteService.insertPostulante(postulante);
		return "redirect:login.html";
	}

	// LOGIN
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		Postulante postulante = new Postulante();
		model.addAttribute("postulanteLogin", postulante);
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("postulanteLogin") Postulante postulante, BindingResult result,
			HttpSession httpSession) {
		if (postulante.getUserName().equals("ac.admin") && postulante.getPassword().equals("danza123")) {
			return "redirect:/adminIndex.html";
		} else {
			Postulante curPostulante = postulanteService.getPostulanteByLogin(postulante.getUserName(),
					postulante.getPassword());
			if (curPostulante != null) {
				httpSession.setAttribute("curPostulante", curPostulante);
				return "redirect:addInscripcion.html";
			} else {
				return "redirect:/";
			}
		}

	}

	// INSCRIPCION
	@RequestMapping(value = "/addInscripcion", method = RequestMethod.GET)
	public String getCursos(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		// model.addAttribute("message", null);
		if (postulante != null) {
			List<Curso> cursos = inscripcionService.getAllCursos();
			model.addAttribute("cursos", cursos);
			return "addInscripcion";
		} else {
			return "redirect:login.html";
		}
	}

	@RequestMapping(value = "/addInscripcion", method = RequestMethod.POST)
	public String addCursos(@RequestParam(value = "cursoId") Integer cursoId, @ModelAttribute("course") Curso curso,
			Model model, BindingResult result, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (inscripcionService.getCursoInscrito(cursoId.longValue(), postulante.getId())) {
			model.addAttribute("message", "El curso ya está inscrito!");
			return getCursos(model, httpSession);
		}
		
		inscripcionService.insertInscripcion(cursoId.longValue(), postulante.getId());
		model.addAttribute("message", "Curso inscrito!    -    "+  inscripcionService.getEstadoInscripcion(cursoId.longValue()));
		return getCursos(model, httpSession);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/";
	}
	
	//PERFIL
	@RequestMapping(value = "/perfil", method = RequestMethod.GET)
	public String getPerfil(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		// model.addAttribute("message", null);
		if (postulante != null) {
			model.addAttribute("postulante", postulante);
			return "perfil";
		} else {
			return "redirect:login.html";
		}
	}
	
	@RequestMapping(value = "/perfil", method = RequestMethod.POST)
	public String modifyPerfil(@RequestParam(value = "cursoId") Integer cursoId, @ModelAttribute("course") Curso curso,
			Model model, BindingResult result, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (inscripcionService.getCursoInscrito(cursoId.longValue(), postulante.getId())) {
			model.addAttribute("message", "El curso ya está inscrito!");
			return getCursos(model, httpSession);
		}
		
		inscripcionService.insertInscripcion(cursoId.longValue(), postulante.getId());
		model.addAttribute("message", "Curso inscrito!    -    "+  inscripcionService.getEstadoInscripcion(cursoId.longValue()));
		return getCursos(model, httpSession);
	}

}