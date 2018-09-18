package com.ipartek.formacion.youtube.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.youtube.Usuario;
import com.ipartek.formacion.youtube.Video;
import com.ipartek.formacion.youtube.model.VideoArrayListDAO;

/**
 * Servlet implementation class ComentarioController
 */
@WebServlet("/crearComent")
public class AltaComentarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static VideoArrayListDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// Se ejecuta solo con la 1º petición, el resto de peticiones iran a "service"
		dao = VideoArrayListDAO.getInstance();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//obtenemos la sesion
			HttpSession session = request.getSession();
			
			//recogemos el id del video
			String id = request.getParameter("idVideoComentario");
			
			//recogemos el usuario de la sesion
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			
			//recogemos parametros del formulario home.jsp
			String comentario = request.getParameter("comentario");
			
			dao.addComentario(id, comentario, usuario);
			
			response.sendRedirect(request.getContextPath() + "/inicio" ); 

			
		} catch (Exception e) {
			
			// TODO: handle exception
		}
		
		
		
	}

}
