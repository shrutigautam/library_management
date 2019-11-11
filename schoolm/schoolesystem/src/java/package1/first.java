package package1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunil
 */
public class first extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            String pass=request.getParameter("key");
          
            enterkey ek=new enterkey();
            encryptkey ek2=new encryptkey();
            String path="D:\\log.txt";
      //String readcontent;
	File file=new File(path);
	if(!file.exists()){
          
          String encryptedvalue=ek.cipertext(ek2.ekey);
          String encryptedvalue2=ek.cipertext(pass);
          if(encryptedvalue.equals(encryptedvalue2)){
              file.createNewFile();
              RequestDispatcher vi=request.getRequestDispatcher("dashboard.html");
                 vi.forward(request,response);
          }
          else{
              RequestDispatcher vi=request.getRequestDispatcher("login.jsp");
                 vi.forward(request,response);
          }
	                  }
        else{
            String encryptedvalue=ek.cipertext(ek2.ekey);
          String encryptedvalue2=ek.cipertext(pass);
          if(encryptedvalue.equals(encryptedvalue2)){
              RequestDispatcher vi=request.getRequestDispatcher("dashboard.html");
                 vi.forward(request,response);
        }
          else{
              RequestDispatcher vi=request.getRequestDispatcher("login.jsp");
                 vi.forward(request,response);
          }
        }
            
            //System.out.println(ek.ptext);
            //String pass1=ek.ptext;
            
            
            //ek1.enp(pass);
           // out.println(ek1.enp(pass));
            //encryptsave ek1=new encryptsave();
         //   enterkey ek3=new enterkey();
         //   if(ek1.save(pass)==null){
          //  ek2.enp(pass);
            //}
          //1  out.println(ek1.save(pass));
            //out.println(ek3.cipertext(pass));
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
