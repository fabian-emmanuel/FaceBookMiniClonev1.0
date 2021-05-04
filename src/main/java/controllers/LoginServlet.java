package controllers;

import dao.UserDao;
import models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    public void init(){
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String inputEmail = request.getParameter("email");
        String inputPassword = request.getParameter("password");

        User getUserDetails = null;
        try {
            getUserDetails = userDao.getUserByEmail(inputEmail);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (getUserDetails == null){
            request.setAttribute("errorMessage" , "Invalid Email");
            RequestDispatcher dispatcher =  request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
        else {
            String savedPassword  =  getUserDetails.getPassword();
            if (!inputPassword.equals(savedPassword)){
                request.setAttribute("errorMessage" , "Invalid Password");
                RequestDispatcher requestDispatcher =  request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }
            else {
                session.setAttribute("userId", getUserDetails.getUserId());
                session.setAttribute("userFirstName", getUserDetails.getFirstName());
                System.out.println("Login Successful!");
                response.sendRedirect("/ProfileServlet");
            }
        }
    }
}
