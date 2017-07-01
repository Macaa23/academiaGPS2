package com.ubb.gps.controller;

import com.ubb.gps.model.Curso;
import com.ubb.gps.model.Postulante;
import com.ubb.gps.model.curso_inscripcion;
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
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

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
	
	Properties prop = new Properties();
	InputStream input = null;
	
	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(Model model, HttpSession httpSession) {
		model.addAttribute("ranks", informesService.getRanking());
		return "adminIndex";
	}
	
	@RequestMapping(value = "/adminCursos", method = RequestMethod.GET)
	public String adminCursos(Model model, HttpSession httpSession) {
		model.addAttribute("cursos", informesService.getCursos());
		model.addAttribute("inscritos1", informesService.getInscritos(informesService.getCursos().get(0).getId()));
		model.addAttribute("inscritos2", informesService.getInscritos(informesService.getCursos().get(1).getId()));
		model.addAttribute("inscritos3", informesService.getInscritos(informesService.getCursos().get(2).getId()));
		model.addAttribute("inscritos4", informesService.getInscritos(informesService.getCursos().get(3).getId()));
		return "adminCursos";
	}
	
	@RequestMapping(value = "/adminResumen", method = RequestMethod.GET)
	public String adminResumen(Model model, HttpSession httpSession) {
		List<Curso> cursos = informesService.getCursos();
		model.addAttribute("cursos", cursos);
		//Numero de preinscritos por curso
		model.addAttribute("pc0", informesService.getCountTrueInscritos(cursos.get(0).getId()));
		model.addAttribute("pc1", informesService.getCountTrueInscritos(cursos.get(1).getId()));
		model.addAttribute("pc2", informesService.getCountTrueInscritos(cursos.get(2).getId()));
		model.addAttribute("pc3", informesService.getCountTrueInscritos(cursos.get(3).getId()));
		
		//Numero de en lista de espera por curso
		model.addAttribute("le0", informesService.getCountFalseInscritos(cursos.get(0).getId()));
		model.addAttribute("le1", informesService.getCountFalseInscritos(cursos.get(1).getId()));
		model.addAttribute("le2", informesService.getCountFalseInscritos(cursos.get(2).getId()));
		model.addAttribute("le3", informesService.getCountFalseInscritos(cursos.get(3).getId()));
		
		//Promedio de cursos que inscribe cada postulante
		model.addAttribute("p_curso", informesService.getInscripcionesPromedio());
		
		//Promedio de inscritos que hay por curso
		model.addAttribute("p_ins", informesService.getInscritosPromedio());
		
		//Ultima inscripcion hecha
		model.addAttribute("f_last", informesService.getLastInscripcion().getSimpleFecha());
		
		//Primera inscripcion hecha
		model.addAttribute("f_first", informesService.getFirstInscripcion().getSimpleFecha());
		
		//Edad promedio por curso
		model.addAttribute("e0", informesService.getEdadPromedio(cursos.get(0).getId()));
		model.addAttribute("e1", informesService.getEdadPromedio(cursos.get(1).getId()));
		model.addAttribute("e2", informesService.getEdadPromedio(cursos.get(2).getId()));
		model.addAttribute("e3", informesService.getEdadPromedio(cursos.get(3).getId()));
		
		return "adminResumen";
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

	// ELIMINACION
	@RequestMapping(value = "/deleteInscripcion", method = RequestMethod.GET)
	public String getCursosInscritos(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");

		if (postulante != null) {
			List<Curso> cursos_inscritos = inscripcionService.getCursosByPostulanteId(postulante.getId());
			model.addAttribute("cursos_inscritos", cursos_inscritos);
			return "deleteInscripcion";
		} else {
			return "redirect:login.html";
		}
	}

	@RequestMapping(value = "/deleteInscripcion", method = RequestMethod.POST)
	public String deleteCursos(@RequestParam(value = "cid") Integer cid, @ModelAttribute("curso") Curso cursoEliminar,
			Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		inscripcionService.deleteInscripcion(cid.longValue(), postulante.getId());
		model.addAttribute("message", "Curso eliminado.");
		return getCursosInscritos(model, httpSession);
	}
	
	//VER CURSOS
	@RequestMapping(value = "/verCursos", method = RequestMethod.GET)
	public String getVistaCursos(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (postulante != null) {
			List<curso_inscripcion> cursos = inscripcionService.getVistaCursos(postulante.getId());
			model.addAttribute("cursos", cursos);
			return "verCursos";
		} else {
			return "redirect:login.html";
		}
	}
}