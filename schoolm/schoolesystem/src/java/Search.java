
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Search extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html"); 
       PrintWriter out=response.getWriter();
       String Adm_No=request.getParameter("na2");
       
       HttpSession Adm_session = request.getSession();
       Adm_session.setAttribute("Adm_sess", Adm_No);
       ArrayList al=new ArrayList();
        try{
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
Statement s1=con.createStatement();

ResultSet rs1=s1.executeQuery("select * from admission_tab where Admission_No='"+Adm_No+"'");

while(rs1.next()){
al.add(rs1.getString(1)+",");
al.add(rs1.getString(2)+",");
al.add(rs1.getString(3)+",");
al.add(rs1.getString(4)+",");
al.add(rs1.getString(5)+",");
al.add(rs1.getString(6)+",");
al.add(rs1.getString(7)+",");
al.add(rs1.getString(8)+",");
al.add(rs1.getString(9)+",");
al.add(rs1.getString(10)+",");
al.add(rs1.getString(11)+",");
al.add(rs1.getString(12)+",");
al.add(rs1.getString(13)+",");}
  

Iterator it=al.iterator();

while(it.hasNext())
{
out.print(it.next());
}
s1.close();
        }
        catch(Exception et){
            out.print(et);
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
