
package java.Common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DbConnection.DbConnection;

@WebServlet("/AddNewUser")
public class AddNewUser extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
             String username = request.getParameter("username");
             String mail_Id = request.getParameter("mailid");
             String password = request.getParameter("password");
             String cpassword = request.getParameter("cpassword");
              String mnum = request.getParameter("mnum");
              String cid = request.getParameter("cid");
             
             Statement stmt = DbConnection.getConnection();
             
             String query="insert into register(username,mailid,password,cpassword,mobnum,category) values('"+username+"','"+mail_Id+"','"+password+"','"+cpassword+"','"+mnum+"','"+cid+"')";
            int dbresponse = stmt.executeUpdate(query);
            if(dbresponse ==1){
                RequestDispatcher requestDispatcher =request.getRequestDispatcher("/index.html");
                requestDispatcher.include(request, response);
                out.println("User Added Sucessfully");
            }else{
                RequestDispatcher requestDispatcher =request.getRequestDispatcher("/index.html");
                requestDispatcher.include(request, response);
                out.println("Failure to add NewUser");
            }
           
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

   
}
