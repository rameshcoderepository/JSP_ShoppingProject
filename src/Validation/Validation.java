package Validation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DbConnection.DbConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Validation")
public class Validation extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.getRequestDispatcher("link.html").include(request, response);

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String cid = request.getParameter("cid");

            if (username.equals("admin") && password.equals("admin") && cid.equals("3")) {

                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AdminHome.jsp");
                requestDispatcher.include(request, response);

            } else {

                Statement stmt = DbConnection.getConnection();
                ResultSet rs = stmt.executeQuery("select * from register");
                int flag = 0;
                while (rs.next()) {
                    String user_name = rs.getString("username");
                    String pass_word = rs.getString("password");
                    //  String cus_id =rs.getString("category");
                    int cus_id = rs.getInt("cusid");

                    if (user_name.equals(username) && pass_word.equals(password) && cid.equals("1")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", user_name);
                        session.setAttribute("password", pass_word);
                        session.setAttribute("cusid", cus_id);

                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/UserHome.jsp");
                        requestDispatcher.include(request, response);

                        flag = 1;
                    } else if (user_name.equals(username) && pass_word.equals(password) && cid.equals("2")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", user_name);
                        session.setAttribute("password", pass_word);
                        session.setAttribute("cusid", cus_id);

                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/SupplierHome.jsp");
                        requestDispatcher.include(request, response);

                        flag = 1;
                    }
                }
                if (flag == 0) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
                    requestDispatcher.include(request, response);
                    out.println("Sorry! Username & Password is incorrect");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}
