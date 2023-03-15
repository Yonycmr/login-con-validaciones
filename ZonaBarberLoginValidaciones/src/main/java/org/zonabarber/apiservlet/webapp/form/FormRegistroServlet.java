package org.zonabarber.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/form-registro")
public class FormRegistroServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        String username = req.getParameter("txtnombre");
        String usernamelastname = req.getParameter("txtapellido");
        String direccion = req.getParameter("txtdireccion");
        String tipodedocumento = req.getParameter("txttipo_Identificacion");
        String documento = req.getParameter("txtidentificacion");
        String celular = req.getParameter("txtcelular");
        String gmail = req.getParameter("txtcorreo");
        String password = req.getParameter("txtpassword");

        Map<String, String> erroresreg = new HashMap<>();

        if (username == null || username.isBlank()) {
            erroresreg.put("username","El Nombre es requerido");
        }
        if (usernamelastname == null || usernamelastname.isBlank()) {
            erroresreg.put("usernamelastname","El Apellido es requerido");
        }
        if (direccion == null || direccion.isBlank()) {
            erroresreg.put("direccion","La direccion es requerida");
        }
        if (tipodedocumento == null || tipodedocumento.isBlank()) {
            erroresreg.put("tipodedocumento","El tipode documento es requerido");
        }
        if (documento == null || documento.isBlank()) {
            erroresreg.put("documento","El documento es requerido");
        }
        if (celular == null || celular.isBlank()) {
            erroresreg.put("celular","El celular es requerido");
        }
        if (gmail == null || gmail.isBlank()) {
            erroresreg.put("gmail","El gmail es requerido");
        }
        if (password == null || password.isBlank()) {
            erroresreg.put("password","la contraseña es obligatoria");
        }


        if (erroresreg.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\">");
                out.println("        <title>Resultado form</title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>Resultado form</h1>");

                out.println("        <ul>");
                out.println("            <li>username:" + username + "</li>");
                out.println("            <li>apellido:" + usernamelastname + "</li>");
                out.println("            <li>Direccion:" + direccion + "</li>");
                out.println("            <li>tipo de documento:" + tipodedocumento + "</li>");
                out.println("            <li>documento:" + documento + "</li>");
                out.println("            <li>celular:" + celular + "</li>");
                out.println("            <li>gmail:" + gmail + "</li>");
                out.println("            <li>password:" + password + "</li>");
                out.println("        </ul>");
                out.println("    </body>");
                out.println("</html>");
            }
        } else {
                /*erroresreg.forEach(error -> {
                    out.println("<li>" + error + "</li>");
                });
                out.println("<p><a href=\"/ZonaBarber-1.0-SNAPSHOT/index.jsp\">volver</a>");*/
            req.setAttribute("erroresreg", erroresreg);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
