/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;




import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modele.Enfant;

import javax.servlet.http.HttpSession;

/**
 *
 * @author morel2
 */
@WebServlet(name = "Controleur", urlPatterns = {"/controleur"})
public class Controleur extends HttpServlet {
    
    @Resource(name = "jdbc/acol")
    private DataSource ds;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controleur</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controleur at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            actionAccueil(request, response);
        }      
    }
    
    private void actionAccueil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/accueil.html").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : fichier accueil.html introuvable");
            return;
        }
    }
    
    private void actionLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        try {
            if (type.equals("parents")) {
                CheckParentDao checkParent = new CheckParentDao(ds);
                if (checkParent.isLoginValid(request, response)) {
                    ParentDao parent = new ParentDao(ds, request.getParameter("login"));
                    HttpSession session = request.getSession();
                    session.setAttribute("utilisateur", request.getParameter("login"));
                    session.setAttribute("parent", parent);
                    request.getRequestDispatcher("WEB-INF/AccueilParents.html").forward(request, response);
                    
                }
                else{
                    request.getRequestDispatcher("WEB-INF/accueil.html").forward(request, response);
                }
            } else if (type.equals("mairie")) {
                CheckMairieDao checkMairie = new CheckMairieDao(ds);
                if (checkMairie.isLoginValid(request, response)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("utilisateur", request.getParameter("login"));
                    request.getRequestDispatcher("WEB-INF/AccueilMairie.html").forward(request, response);
                    
                }
                else {
                    request.getRequestDispatcher("WEB-INF/accueil.html").forward(request, response);
                }
            } else {
                CheckEtablissementDao checkEtabli = new CheckEtablissementDao(ds);
                if (checkEtabli.isLoginValid(request, response)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("utilisateur", request.getParameter("login"));
                    request.getRequestDispatcher("WEB-INF/AccueilEtablissement.html").forward(request, response);
                    
                }
                else{
                    request.getRequestDispatcher("WEB-INF/accueil.html").forward(request, response);
                }
            }
            
        } catch (Exception e) {
            if (type.equals("parents")) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : AccueilParents.html introuvable");
            } else if (type.equals("mairie")) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : AccueilMairie.html introuvable");
            } else if (type.equals("etablissement")) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : AccueilEtablissement introuvable");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : choix introuvable");
            }
            return;
        }
    }
    
    private void actionInfos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/RemplissageCoordonnes.html").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : infos.html introuvable");
            return;
        }
    }
    
    private void actionInfosRemplies(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        try {
            ((ParentDao) session.getAttribute("parent")).updateInfos(request.getParameter("telephone"), request.getParameter("adresse"));
        } catch (SQLException ex) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : Update des informations impossible");        
        }
        request.getRequestDispatcher("WEB-INF/AccueilParents.html").forward(request, response);
    }

    private void actionFacture(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/facture.html").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : facture.html introuvable");
            return;
        }
    }
    
    private void actionGroupe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/recuperation.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : recuperation.jsp introuvable");
            return;
        }
    }
    
    private void actionRegime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/regimes.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : regimes.jsp introuvable");
            return;
        }
    }
    
    private void actionAjouterRegime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String regime = request.getParameter("regime");
            regimeDao regDao = new regimeDao(ds);
            regDao.ajoutRegime(regime);
            request.getRequestDispatcher("WEB-INF/regimes.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : regimes.jsp introuvable");
            return;
        }
    }

    private void actionEnfants(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            enfantsDao enf = new enfantsDao(ds, (String) request.getSession().getAttribute("utilisateur"));
            request.setAttribute("enfants", enf);
            request.getRequestDispatcher("WEB-INF/enfants.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : enfants.jsp introuvable");
            return;
        }
    }
    
    private void actionSupprimerRegime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String act = request.getParameter("action");
            regimeDao regDao = new regimeDao(ds);
            regDao.enleveRegime(act.substring(12));
            request.getRequestDispatcher("WEB-INF/regimes.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : regimes.jsp introuvable");
            return;
        }
    }
    
    private void actionFormulaireInscription(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String act = request.getParameter("action");
            enfantsDao enf = new enfantsDao(ds, (String) request.getSession().getAttribute("utilisateur"));
            Enfant enfant = enf.getEnfant(act.substring(16));
            request.setAttribute("enfant", enfant);
            request.getRequestDispatcher("WEB-INF/regimes.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : regimes.jsp introuvable");
            return;
        }
    }
        
    private void actionAnimations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.getRequestDispatcher("WEB-INF/AjoutAnimation.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "erreur : recuperation.jsp introuvable");
            return;
        }
        
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("login")) {
            actionLogin(request,response);
        } else if (action.equals("infos")) {
            actionInfos(request,response);
        } else if (action.equals("facture")) {
            actionFacture(request,response);
        } else if (action.equals("groupes")) {
            actionGroupe(request,response);
        } else if (action.equals("regime")) {
            actionRegime(request,response);
        } else if (action.equals("ajouterRegime")) {
            actionAjouterRegime(request,response);
        } else if (action.equals("enfants")) {
            actionEnfants(request,response);
        } else if (action.substring(0,11).equals("supprRegime")) {
            actionSupprimerRegime(request,response);
        } else if (action.substring(0,15).equals("allerFormulaire")) {
            actionFormulaireInscription(request, response);
        } else if (action.equals("inforemplies")) {
            actionInfosRemplies(request, response);
        } else if (action.equals("animations")) {
            actionAnimations(request, response);
        } 
        else {
            System.out.println(action);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


    

}
