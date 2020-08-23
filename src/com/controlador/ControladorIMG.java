package com.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modeloDao.ProductoDao;

/**
 * Servlet implementation class ControladorIMG
 */
@WebServlet("/ControladorIMG")
public class ControladorIMG extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductoDao pdao=new ProductoDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorIMG() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(pdao.urlImg(id));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
