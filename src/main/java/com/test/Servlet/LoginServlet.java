
package com.test.Servlet;

import com.test.dao.UserDao;
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

/**
 *
 * @author bhalc
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    
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
          
          String email = req.getParameter("email");
          String password = req.getParameter("password");
          
          //validation
          
          //authenticate
          
         UserDao userDao =new UserDao(FactoryProvider.getFactory());
          
        User user =  userDao.getUserByEmailAndPassword(email, password);
        
        
        HttpSession httpsession =  req.getSession();
          
        if(user==null){
            
           
            httpsession.setAttribute("message", "Invalid Details !! Try with another one");
            resp.sendRedirect("login.jsp");
            return;
        }
        else{
            
            out.println(" <h1>Welcome " + user.getUserName() + " </h1> ");
            
            //login
            httpsession.setAttribute("current-user", user);
            
            
            if(user.getUserType().equals("admin"))
            {
                //admin.jsp
                resp.sendRedirect("admin.jsp");
            }
            else if(user.getUserType().equals("normal"))
            {
                //normal.jsp
                resp.sendRedirect("normal.jsp");
            }
            else{
                
                out.println("we have not identified user type");
            }
        }
       
      }
           
      }
}
