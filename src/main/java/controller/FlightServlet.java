package controller;

import domain.FlightDetails;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/test")
public class FlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String check=request.getParameter("pageRequest");

        if(check.equalsIgnoreCase("addRecord"))
        {
            String name=request.getParameter("name");
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String paymentStatus=request.getParameter("paymentStatus");
            double price=Double.parseDouble(request.getParameter("price"));
            String sDate1=request.getParameter("date");
            Date date=new Date();
            try {
                date=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            FlightDetails.addFlight(name,phone,email,address,price,paymentStatus,date);
            response.sendRedirect("dashboard?pageRequest=list");
        }
        if(check.equalsIgnoreCase("editRecord"))
        {
            String name=request.getParameter("name");
            int id=Integer.parseInt(request.getParameter("id"));
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String paymentStatus=request.getParameter("paymentStatus");
            double price=Double.parseDouble(request.getParameter("price"));
            String sDate1=request.getParameter("flightDate");
            Date date=new Date();
            try {
                date=new SimpleDateFormat("yyyy-MM-dd").parse(sDate1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            FlightDetails.editFlight(id,name,phone,email,address,price,paymentStatus,date);
            response.sendRedirect("dashboard?pageRequest=list");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String check=request.getParameter("pageRequest");

        if(check.equalsIgnoreCase("create"))
        {
            RequestDispatcher rd = request.getRequestDispatcher("flightDetails/create.jsp");
            rd.forward(request, response);
        }

        if (check.equalsIgnoreCase("list"))
        {
            List<FlightDetails> flights= FlightDetails.getFlights();
            request.setAttribute("flights", flights);
            RequestDispatcher rd = request.getRequestDispatcher("flightDetails/index.jsp");
            rd.forward(request, response);
        }
        if(check.equalsIgnoreCase("delete"))
        {
            Integer id= Integer.parseInt(request.getParameter("id"));
            FlightDetails.deleteFlightDets(id);
            response.sendRedirect("dashboard?pageRequest=list");
        }

        if(check.equalsIgnoreCase("edit"))
        {
            int id= Integer.parseInt(request.getParameter("id"));
            FlightDetails flights=FlightDetails.getFlight(id);
            request.setAttribute("flights", flights);
            RequestDispatcher rd = request.getRequestDispatcher("flightDetails/edit.jsp");
            rd.forward(request, response);
        }

        if(check.equalsIgnoreCase("paidList"))
        {
            List<FlightDetails> flights= FlightDetails.getFlights("paid");
            request.setAttribute("flights", flights);
            RequestDispatcher rd = request.getRequestDispatcher("flightDetails/paid.jsp");
            rd.forward(request, response);
        }
        if(check.equalsIgnoreCase("unpaidList"))
        {
            List<FlightDetails> flights= FlightDetails.getFlights("unpaid");
            request.setAttribute("flights", flights);
            RequestDispatcher rd = request.getRequestDispatcher("flightDetails/unpaid.jsp");
            rd.forward(request, response);
        }
        if(check.equalsIgnoreCase("update"))
        {
            int id=Integer.parseInt(request.getParameter("id"));
            String paymentStatus=request.getParameter("status");
            FlightDetails.updateStatus(id,paymentStatus);
            response.sendRedirect("dashboard?pageRequest=list");
        }
    }
}
