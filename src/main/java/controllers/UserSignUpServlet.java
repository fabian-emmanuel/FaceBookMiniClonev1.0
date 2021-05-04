package controllers;

import dao.UserDao;
import models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "UserSignUpServlet", value = "/UserSignUpServlet")
public class UserSignUpServlet extends HttpServlet {
    private UserDao userDao;

    public void init(){
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
        String route = request.getServletPath();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String date_Of_Birth =  request.getParameter("birthday");
        Date dateOfBirth = Date.valueOf(date_Of_Birth);


        User newUser = new User(firstName, lastName, email, password, gender, dateOfBirth);
        try {
            boolean createUser = userDao.createUser(newUser);
            HttpSession httpSession = request.getSession();
            if (createUser){
                User getUserDetails = userDao.getUserByEmail(email);
                httpSession.setAttribute("userId", getUserDetails.getUserId());
                httpSession.setAttribute("firstName", getUserDetails.getFirstName());
                httpSession.setAttribute("lastName", getUserDetails.getLastName());
                System.out.println("redirected");
//                request.setAttribute("message","registration was successful");
                response.sendRedirect("/Success");
            }
            else {
                request.setAttribute("errorMessage" , "Email Address is Already in use");
                RequestDispatcher dispatcher =  request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }
//            request.setAttribute("errorMessage" , "An Error Occurred While Processing Your Request");
//            RequestDispatcher requestDispatcher =  request.getRequestDispatcher("index.jsp");
//            requestDispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
