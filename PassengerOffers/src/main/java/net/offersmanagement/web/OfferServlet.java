package net.offersmanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.offersmanagement.dao.Offer;
import net.offersmanagement.model.OfferDAO;

@WebServlet("/")
public class OfferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OfferDAO offerDAO;

    @Override
    public void init() throws ServletException {
        offerDAO = new OfferDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertOffer(request, response);
                    break;
                case "/delete":
                    deleteOffer(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateOffer(request, response);
                    break;
                default:
                    listOffer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listOffer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Offer> listOffer = offerDAO.selectAllOffer();
        request.setAttribute("listOffer", listOffer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("offer-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("offer-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Offer existingOffer = offerDAO.selectOffer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("offer-form.jsp");
        request.setAttribute("offer", existingOffer);
        dispatcher.forward(request, response);
    }

    private void insertOffer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String type = request.getParameter("type");
        String range = request.getParameter("range");
        String code = request.getParameter("code");
        Offer newOffer = new Offer(name, email, type, range, code);
        offerDAO.insertOffer(newOffer);
        response.sendRedirect("list");
    }

    private void updateOffer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String type = request.getParameter("type");
        String range = request.getParameter("range");
        String code = request.getParameter("code");
        Offer updatedOffer = new Offer(id, name, email, type, range, code);	
        offerDAO.updateOffer(updatedOffer);
        response.sendRedirect("list");
    }

    private void deleteOffer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        offerDAO.deleteOffer(id);
        response.sendRedirect("list");
    }
}
