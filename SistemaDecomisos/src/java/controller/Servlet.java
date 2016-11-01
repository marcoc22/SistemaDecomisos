/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ActaDecomiso;
import model.Jsonable;
import model.Model;
import model.Usuario;

/**
 *
 * @author Marco
 */
public class Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class, "_class")
                    .registerSubtype(Usuario.class, "Usuario")
                    .registerSubtype(ActaDecomiso.class, "ActaDecomiso")
                    .registerSubtype(Usuario.class, "Usuario")
                    .registerSubtype(Usuario.class, "Usuario")
                    .registerSubtype(Usuario.class, "Usuario");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            Model model = (Model) request.getSession().getAttribute("model");
            switch (accion) {
                case "userLogin":
                    if(model==null)
                        model=new Model();
                    json = request.getParameter("user");// se obtiene un json del cliente, proviene de un objeto Usuario
                    Usuario usuario = gson.fromJson(json, Usuario.class);
                    usuario = model.login(usuario.getNick(),usuario.getContrasena());
                    if (usuario != null) {
                        //Funcionario funcionario=model.obtenerFuncionario(String id);
                        request.getSession().setAttribute("usuario", usuario);// El objeto Usuario es enviado a la sesión
                        //request.getSession().setAttribute("funcionario", funcionario);
                    }
                    json = gson.toJson(usuario);
                    out.write(json);// Se envía el objeto Usuario como json al cliente
                    break;
                case "userLogout":
                    request.getSession().removeAttribute("usuario");
                    request.getSession().removeAttribute("model");
                    request.getSession().invalidate();
                    break;
                case "guardarActa":
                    
                    break;

            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
