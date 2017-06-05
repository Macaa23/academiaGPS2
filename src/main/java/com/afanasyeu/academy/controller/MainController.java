package com.afanasyeu.academy.controller;

import com.afanasyeu.academy.model.Curso;
import com.afanasyeu.academy.model.Inscripcion;
import com.afanasyeu.academy.model.Postulante;
import com.afanasyeu.academy.service.InscripcionService;
import com.afanasyeu.academy.service.PostulanteService;
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
	@Qualifier("studentValidator")
	private Validator studentValidator;

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
		Postulante curPostulante = postulanteService.getPostulanteByLogin(postulante.getUserName(),
				postulante.getPassword());
		if (curPostulante != null) {
			httpSession.setAttribute("curPostulante", curPostulante);
			return "redirect:addInscripcion2.html";
		} else {
			return "redirect:/";
		}
	}

	// INSCRIPCION
	@RequestMapping(value = "/addInscripcion2", method = RequestMethod.GET)
	public String getCursos(Model model, HttpSession httpSession) {
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		if (postulante != null) {
			List<Curso> cursos = inscripcionService.getAllCursos();
			model.addAttribute("cursos", cursos);
			return "addInscripcion2";
		} else {
			return "redirect:login.html";
		}
	}

	@RequestMapping(value = "/addInscripcion2", method = RequestMethod.POST)
	public String addCursos(@RequestParam(value = "cursoId") Integer cursoId, @ModelAttribute("course") Curso curso,
			Model model, BindingResult result, HttpSession httpSession) {
		// model.addAttribute("course_id", cursoId);
		// return "addInscripcion2";
		Postulante postulante = (Postulante) httpSession.getAttribute("curPostulante");
		// Long asdf = (long) 10;
		if (inscripcionService.getCursoInscrito(cursoId.longValue(), postulante.getId())) {
			model.addAttribute("message", "El curso ya está inscrito!");
			return "addInscripcion2";
		}
		inscripcionService.insertInscripcion(cursoId.longValue(), postulante.getId());
		// curso.setPostulanteId(postulante.getId());
		// cursoService.insertCurso(curso);
		return "redirect:/addInscripcion2.html";
	}

	/*
	 * @RequestMapping(value = "/cursos", method = RequestMethod.GET) public
	 * String getCursosByPostulante(Model model, HttpSession httpSession) {
	 * Postulante postulante = (Postulante)
	 * httpSession.getAttribute("curPostulante"); if (postulante != null) {
	 * model.addAttribute("curso",
	 * cursoService.getCursosByPostulanteId(postulante.getId())); return
	 * "cursos"; } else { return "redirect:login.html"; } }
	 * 
	 * @RequestMapping(value = "/students", method = RequestMethod.GET) public
	 * String getStudentsByPostulante(Model model, HttpSession httpSession) {
	 * Postulante postulante = (Postulante)
	 * httpSession.getAttribute("curPostulante"); if (postulante != null) {
	 * model.addAttribute("student",
	 * studentService.getStudentsByPostulanteId(postulante.getId())); return
	 * "students"; } else { return "redirect:login.html"; } }
	 * 
	 * @RequestMapping(value = "/students/{studentId}", method =
	 * RequestMethod.GET) public String deleteStudentsByPostulante(@PathVariable
	 * long studentId, HttpSession httpSession) { Postulante postulante =
	 * (Postulante) httpSession.getAttribute("curPostulante");
	 * studentService.deleteStudentById(studentId, postulante.getId()); return
	 * "redirect:/students.html"; }
	 * 
	 * @RequestMapping(value = "/addStudent", method = RequestMethod.GET) public
	 * String addStudent(Model model, HttpSession httpSession) { Postulante
	 * curPostulante = (Postulante) httpSession.getAttribute("curPostulante");
	 * if (curPostulante != null) { Student student = new Student();
	 * model.addAttribute("student", student); return "addStudent"; } else {
	 * return "login"; } }
	 * 
	 * @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
	 * public String addStudent(@ModelAttribute("student") Student student,
	 * Model model, BindingResult result, HttpSession httpSession) { if
	 * (studentService.getStudentByFNameLNameDBirth(student)) {
	 * model.addAttribute("message", "Student already exist!"); return
	 * "addStudent"; } studentValidator.validate(student, result); if
	 * (result.hasErrors()){ return "addStudent"; } Postulante curPostulante =
	 * (Postulante) httpSession.getAttribute("curPostulante");
	 * student.setPostulanteId(curPostulante.getId());
	 * studentService.insertStudent(student); return "redirect:/students.html";
	 * }
	 * 
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public
	 * String addStudent(HttpSession httpSession) { httpSession.invalidate();
	 * return "redirect:/"; }
	 */
}