package com.controllers;

import com.entities.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(value = "/create-employee")
public class EmployeeCreateController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("employee/create.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setEmployeeId(req.getParameter("id"));
        employee.setEmployeeName(req.getParameter("name"));
        employee.setEmail(req.getParameter("email"));
        employee.setPhoneNumber(req.getParameter("phone"));

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthday = dateFormat.parse(req.getParameter("birthday"));
            employee.setBirthday(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<String> validationErrors = validateEmployee(employee);

        if (!validationErrors.isEmpty()) {
            req.setAttribute("validationErrors", validationErrors);
            req.getRequestDispatcher("employee/create.jsp").forward(req, resp);
        } else {
            try (Session session = sessionFactory.openSession()) {
                session.beginTransaction();
                session.save(employee);
                session.getTransaction().commit();
            }
            resp.sendRedirect("list-employee");
        }
    }

    private List<String> validateEmployee(Employee employee) {
        List<String> errors = new ArrayList<>();

        // Validate employeeId, employeeName, email, and other fields as needed
        if (employee.getEmployeeId() == null || employee.getEmployeeId().isEmpty()) {
            errors.add("Employee ID is required");
        }

        if (employee.getEmployeeName() == null || employee.getEmployeeName().isEmpty()) {
            errors.add("Employee Name is required");
        }

        if (employee.getEmail() == null || employee.getEmail().isEmpty()) {
            errors.add("Employee Email is required");
        }

        if (employee.getBirthday() == null) {
            errors.add("Employee Birthday is required");
        }

        if (employee.getPhoneNumber() == null || employee.getPhoneNumber().isEmpty()) {
            errors.add("Employee PhoneNumber is required");
        }

        return errors;
    }


}
