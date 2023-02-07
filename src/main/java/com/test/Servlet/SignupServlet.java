
package com.test.Servlet;

import com.test.entities.User;
import com.test.test.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author bhalc
 */
@WebServlet("/Signup")
public class SignupServlet extends HttpServlet{

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
     resp.setContentType("text/html; charset=UTF-8");
      try(PrintWriter out=resp.getWriter()){
          
          try{
            
           String name = req.getParameter("username");
           String email = req.getParameter("useremail");
           String password = req.getParameter("userpassword");
           String phone = req.getParameter("userphone");
           String address = req.getParameter("useraddress");
           
           //validations
           
           if(name.isEmpty()){
               
               out.println("Name is blank");
               return;
           }
           
              //Creating user Object to store data
              
            User user = new User(name,email,password,phone,address,"normal");
         
            Session hibernateSession =  FactoryProvider.getFactory().openSession();
               
            Transaction tx = hibernateSession.beginTransaction();
           
            int userId = (int) hibernateSession.save(user);
           
           
            tx.commit();
            hibernateSession.close();
            
            
            HttpSession httpSession = req.getSession();
                
            httpSession.setAttribute("message"," Registration Successful !!! ");
              
            resp.sendRedirect("signup.jsp");
            return;
          }
          
          catch(Exception e){
              
              e.printStackTrace();
          }
          
          
          
          
      }


    }
    
    
}
