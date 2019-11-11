import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saumya Joshi
 */
@WebServlet(name = "dbStoreDoc", urlPatterns = {"/dbStoreDoc"})
public class dbStoreDoc extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
       PrintWriter pw=response.getWriter(); 
       HttpSession session = request.getSession();
       String admn=(String)session.getAttribute("ADMN");
       String PhotoRadioReq=(String)session.getAttribute("PhotoRadioReq");
       String PhotoRadioSub=(String)session.getAttribute("PhotoRadioSub");
       String PSel=(String)session.getAttribute("PSel");
       String TCMREQ=(String)session.getAttribute("TCMREQ");
       String TcmrSub=(String)session.getAttribute("TcmrSub");
       String TSel=(String)session.getAttribute("TSel");
       String ReqMArkSRReq=(String)session.getAttribute("ReqMArkSRReq");
       
       String SubMArkSRSub=(String)session.getAttribute("SubMArkSRSub");
       String MSel=(String)session.getAttribute("MSel");
       String ReqBirthCRReq=(String)session.getAttribute("ReqBirthCRReq");
       String SubBirthCRSub=(String)session.getAttribute("SubBirthCRSub");
       String BSel=(String)session.getAttribute("BSel");
       String ReqCharacterCR=(String)session.getAttribute("ReqCharacterCR");
       String SubCharacterCR=(String)session.getAttribute("SubCharacterCR");
       String CSel=(String)session.getAttribute("CSel");
       
       String ReqCasteCR=(String)session.getAttribute("ReqCasteCR");
       String SubCasteCR=(String)session.getAttribute("SubCasteCR");
       String Ctsel=(String)session.getAttribute("Ctsel");
       String ReqDomicileCR=(String)session.getAttribute("ReqDomicileCR");
       String SubDomicileCR=(String)session.getAttribute("SubDomicileCR");
       String Dsel=(String)session.getAttribute("Dsel");
      
       
       String PhotoFilePath=(String)session.getAttribute("PhotoFilePath");
       String TCFilePath=(String)session.getAttribute("TCFilePath");
       String MarksFilePath=(String)session.getAttribute("MarksFilePath");
       String BirthFilePath=(String)session.getAttribute("BirthFilePath");
       String CharCFilePath=(String)session.getAttribute("CharCFilePath");
       String CasteFilePath=(String)session.getAttribute("CasteFilePath");
       String DFilePath=(String)session.getAttribute("DFilePath");
       
       
       
       
        
        PrintWriter out = response.getWriter();
        String path=(String)session.getAttribute("path_photo");
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erp7?zeroDateTimeBehavior=convertToNull","root","password");
        Statement stmt=con.createStatement();
int u=stmt.executeUpdate("UPDATE document_check_list SET isReqisSubP='"+PhotoRadioReq+"',isReqisSubT='"+TCMREQ+"',"
        + "isReqisSubM='"+ReqMArkSRReq+"',isReqisSubB='"+ReqBirthCRReq+"',isReqisSubC='"+ReqDomicileCR+"',isReqisSubCt='"+SubDomicileCR+"',isReqisSubD='"+Dsel+"',"
        + "PphotoCOrg='"+PSel+"',TphotoCOrg='"+TSel+"',MphotoCOrg='"+MSel+"',BphotoCOrg='"+BSel+"',CphotoCOrg='"+CSel+"',"
        + "CtphotoCOrg='"+Ctsel+"',DphotoCOrg='"+Dsel+"',UploadP='"+PhotoFilePath+"',UploadT='"+TCFilePath+"',UploadM='"+MarksFilePath+"',UploadB='"+BirthFilePath+"',"
        + "UploadC='"+CharCFilePath+"',UploadCt='"+CasteFilePath+"',UploadD='"+DFilePath+"' WHERE admission_no='"+admn+"'");
        if(u==0){
            out.println("oops something went wrong");
        }
        
        else{
                out.println(PhotoRadioReq);
                out.println(TCMREQ);
                out.println(ReqMArkSRReq);
                out.println(ReqBirthCRReq);
                out.println(ReqDomicileCR);
                out.println(Dsel);
                out.println(Ctsel);
                out.println(DFilePath);
               
                //String message="successfully uploaded";
                //request.setAttribute("message_doc",message);
                //request.getRequestDispatcher("Admission.jsp").forward(request, response); 
                
        }   
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
