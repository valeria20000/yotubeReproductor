package com.ipartek.formacion.youtube.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutController
 */
@WebServlet("/logout")
public class LogOutController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// invalidar la session del usuario
			HttpSession session = request.getSession();
			if (session != null) {
				session.removeAttribute("usuario");
				session.invalidate();
				session = null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			response.sendRedirect(request.getContextPath() + "/inicio");
		}
	}

}