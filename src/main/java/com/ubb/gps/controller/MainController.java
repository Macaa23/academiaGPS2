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

import java.io.IOException;
import java.io.PrintWriter;
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
	@Qualifier("postulanteUpdateValidator")
	private Validator postulanteUpdateValidator;

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
			HttpSession httpSession, Model model) {
		if (postulante.getUserName().equals("ac.admin") && postulante.getPassword().equals("danza123")) {
			return "redirect:/adminIndex.html";
		} else {
			Postulante curPostulante = postulanteService.getPostulanteByLogin(postulante.getUserName(),
					postulante.getPassword());
			if (curPostulante != null) {
				httpSession.setAttribute("curPostulante", curPostulante);
				return "redirect:addInscripcion.html";
			} else {
				model.addAttribute("message", "Nombre de usuario o contraseña incorrectos");
				return login(model);
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
		model.addAttribute("message",
				"Curso inscrito!    -    " + inscripcionService.getEstadoInscripcion(cursoId.longValue()));
		return getCursos(model, httpSession);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/";
	}

	// PERFIL
	@RequestMapping(value = "/perfil", method = RequestMethod.GET)
	public String getPerfil(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (postulante != null) {
			model.addAttribute("postulante", postulante);
			return "perfil";
		} else {
			return "redirect:login.html";
		}
	}

	@RequestMapping(value = "/perfilEdit", method = RequestMethod.GET)
	public String getPerfilEdit(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (postulante != null) {
			model.addAttribute("postulante", postulante);
			return "perfilEdit";
		} else {
			return "redirect:login.html";
		}
	}

	@RequestMapping(value = "/perfilEdit", method = RequestMethod.POST)
	public String updatePerfil(@RequestParam(value = "emailAddress") String emailAddress,
			@RequestParam(value = "telefono") String telefono, @ModelAttribute("postulantePerfil") Postulante postulant,
			Model model, BindingResult result, HttpSession httpSession) {

		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");

		if (postulante != null) {
			postulanteUpdateValidator.validate(emailAddress, result);
			if (result.hasErrors()) {
				/*
				 * result.getAllErrors(); try{ PrintWriter writer = new
				 * PrintWriter("errorsitos.txt", "UTF-8"); for (int i = 0; i <
				 * result.getAllErrors().size(); i++) {
				 * writer.println(result.getAllErrors().toString()); }
				 * writer.close(); } catch (IOException e) { // do something }
				 */
				return "perfilEdit";
			}
			postulanteService.updatePostulante(postulante.getRUT(), emailAddress, telefono);
			Postulante curPostulante = postulanteService.getPostulanteByLogin(postulante.getUserName(),
					postulante.getPassword());
			if (curPostulante != null) {
				httpSession.setAttribute("curPostulante", curPostulante);
				model.addAttribute("message", "Perfil actualizado.");
				return getPerfil(model, httpSession);
			} else {
				return "redirect:login.html";
			}
		} else {
			return "redirect:login.html";
		}
	}
}