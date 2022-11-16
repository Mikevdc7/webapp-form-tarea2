package org.mvallesg.apiservlet.webapp.form.tarea2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet({"/crear", ""})
public class RegistroProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String nombre = req.getParameter("nombre");
        String precio = req.getParameter("precio");
        String fabricante = req.getParameter("fabricante");
        String categoria = req.getParameter("categoria");

        Map<String, String> errores = new HashMap<>();

        if(nombre==null || nombre.isBlank()){
            errores.put("nombre", "Debes indicar un nombre!");
        }
        if(precio==null || precio.isBlank()){
            errores.put("precio", "Debes indicar un precio!");
        }
        try{
            if(precio!=null && !precio.isBlank()){
                Integer.valueOf(precio);
            }
        } catch(NumberFormatException e){
            errores.put("precio", "El precio debe ser un entero!");
        }
        if(fabricante==null || fabricante.isBlank()){
            errores.put("fabricante", "Debes indicar un fabricante!");
        }
        if(fabricante !=null && (fabricante.length()<4 || fabricante.length()>10)){
            errores.put("fabricante", "El fabricante debe tener entre 4 y 10 caracteres");
        }
        if(categoria == null || categoria.isBlank()){
            errores.put("categoria", "Debes indicar una categoría!");
        }
        if(errores.isEmpty()){
            try(PrintWriter out = resp.getWriter()){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\" />");
                out.println("        <title>Información del producto</title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>Información del producto registrado</h1>");
                out.println("        <ul>");
                out.println("            <li>Nombre: " + nombre + "</li>");
                out.println("            <li>Precio: " + precio + "</li>");
                out.println("            <li>Fabricante: " + fabricante + "</li>");
                out.println("            <li>Categoría: " + categoria + "</li>");
                out.println("        </ul>");
                out.println("    </body>");
                out.println("</html>");
            }
        } else{
            req.setAttribute("errores", errores);
            req.getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
        }
    }
}
