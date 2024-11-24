package Controllers;

import dao.AccountDao;
import dao.impl.AccountDaoImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.EntityManagerFactoryUtil;

import java.io.IOException;

@WebServlet(name = "AccountController", urlPatterns = "/account")
public class AccountController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EntityManagerFactoryUtil entityManagerFactory;

    private AccountDao accountDao;
    public AccountController() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.entityManagerFactory = new EntityManagerFactoryUtil();
        this.accountDao = new AccountDaoImpl(this.entityManagerFactory.getEntityManager());
    }

    public void destroy() {
        this.entityManagerFactory.close();
        super.destroy();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
