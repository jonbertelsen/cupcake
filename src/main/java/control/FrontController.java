package control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String destination = "index.jsp";
        String source = request.getParameter("source");

        response.setContentType("text/html;charset=UTF-8");

        switch (source) {
            case "customers":
                String customerID = request.getParameter("customerid");

                destination = "orders.jsp";
                break;
            case "addtocart":
                String bottom = request.getParameter("bottom");
                String top = request.getParameter("top");
                String number = request.getParameter("number");
                if (bottom != null && top != null && number != null){
                    request.setAttribute("status","ok");
                    request.setAttribute("message",
                            String.format("Bund: %s, Top: %s, Antal: %s er nu lagt i kurven",
                                    bottom, top, number));
                } else {
                    request.setAttribute("status","error");
                    request.setAttribute("message",
                            String.format("Du mangler at vælge bund, top eller antal!",
                                    bottom, top, number));
                }
                destination = "/index.jsp";
                break;

        }

        request.getRequestDispatcher(destination).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
