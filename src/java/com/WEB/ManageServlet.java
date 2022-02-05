/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ToolsDAO;
import com.Model.Tools;
import com.Model.Job;
import com.Model.Team;
import com.DAO.TeamDAO;
import com.DAO.JobDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAD
 */
@WebServlet("/")
public class ManageServlet extends HttpServlet {

    private ToolsDAO toolsDAO;
    private TeamDAO teamDAO;
    private JobDAO jobDAO;

    public void init() {
        toolsDAO = new ToolsDAO();
        teamDAO = new TeamDAO();
        jobDAO = new JobDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {

                case "/login":
                    logIn(request, response);
                    break;
                case "/home":
                    Home(request, response);
                    break;
                case "/register":
                    register(request, response);
                    break;
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertTools(request, response);
                    break;
                case "/delete":
                    deleteTools(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/listtools":
                    listTools(request, response);
                    break;
                case "/updatetoolsbyid":
                    updateTools(request, response);
                    break;
                case "/newJob":
                    showNewJobForm(request, response);
                    break;
                case "/addnewjob":
                    addNewJob(request, response);
                    break;
                case "/listjob":
                    listJob(request, response);
                    break;
                case "/listjobbyid":
                    listJobById(request, response);
                    break;
                case "/editjob":
                    showEditJobForm(request, response);
                    break;
                case "/deletejob":
                    deleteJob(request, response);
                    break;
                case "/updatejob":
                    updateJob(request, response);
                    break;
                case "/listtoolsbyid":
                    listToolsById(request, response);
                    break;
                case "/newteamform":
                    showNewTeamForm(request, response);
                    break;
                case "/insertteam":
                    insertTeam(request, response);
                    break;
                case "/deleteteam":
                    deleteTeam(request, response);
                    break;
                case "/editteam":
                    showEditTeamForm(request, response);
                    break;
                case "/updateteam":
                    updateTeam(request, response);
                    break;
                case "/listteam":
                    listTeam(request, response);
                    break;
                case "/logout":
                    LogOut(request, response);
                    break;
                default:
                    Home(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTools(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< Tools> listTools = toolsDAO.selectAllTools();
        request.setAttribute("listTools", listTools);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ToolsList.jsp");
        dispatcher.forward(request, response);
    }

    private void listToolsById(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        List< Tools> listTools = toolsDAO.listToolsByID(id);
        if (listTools.isEmpty()) {
            request.setAttribute("jobid", id);
        } else {
            request.setAttribute("listTools", listTools);
            request.setAttribute("jobid", id);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ToolsList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ToolsForm.jsp");
        dispatcher.forward(request, response);
    }

    private void logIn(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    private void Home(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int more = 0;

        List<Job> allJob = jobDAO.selectAllJobs();
        List<Job> jobSummary = new ArrayList<Job>();
        for (int i = 0; i < 3; i++) {
            jobSummary.add(allJob.get(i));
        }
        if (allJob.size() <= 3) {
            more = 0;
        } else {
            more = allJob.size() - 3;
        }
        request.setAttribute("jobSummary", jobSummary);
        request.setAttribute("jobcount", allJob.size());
        request.setAttribute("more", more);

        List<Team> listTeam = teamDAO.selectAllTeam();
        request.setAttribute("listTeam", listTeam);
        request.setAttribute("staffcount", listTeam.size());

        List< Tools> listTools = toolsDAO.selectAllTools();
        request.setAttribute("listTools", listTools);
        request.setAttribute("toolsRecord", listTools.size());

        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
        dispatcher.forward(request, response);
    }

    private void LogOut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminRegister.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Tools existingTools = toolsDAO.selectTools(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ToolsForm.jsp");
        request.setAttribute("tools", existingTools);
        dispatcher.forward(request, response);

    }

    private void insertTools(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String tools = request.getParameter("tool");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int jobid = Integer.parseInt(request.getParameter("jobid"));
        Tools newTools = new Tools(tools, quantity, jobid);
        toolsDAO.insertTools(newTools);
        //request.setAttribute("ID", jobid);
        response.sendRedirect("listtoolsbyid?id=" + jobid + "");
    }

    private void updateTools(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tools = request.getParameter("tool");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int jobid = Integer.parseInt(request.getParameter("jobid"));
        Tools tool = new Tools(id, tools, quantity, jobid);
        toolsDAO.updateTools(tool);
        response.sendRedirect("listtools");
    }

    private void deleteTools(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        toolsDAO.deleteTools(id);
        response.sendRedirect("listtools");

    }

    private void showNewJobForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addJob.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditJobForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Job existingJob = jobDAO.selectJob(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addJob.jsp");
        request.setAttribute("job", existingJob);
        dispatcher.forward(request, response);

    }

    private void addNewJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String customerName = request.getParameter("customername");
        String customerHpNo = request.getParameter("customerhpno");
        String address = request.getParameter("address");
        String buildingType = request.getParameter("buildingtype");
        String date = request.getParameter("date");
        String addNote = request.getParameter("addnote");
        Job newJob = new Job(customerName, customerHpNo, address, buildingType, date, addNote);
        jobDAO.addNewJobs(newJob);
        response.sendRedirect("listjob");
    }

    private void listJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< Job> listJobs = jobDAO.selectAllJobs();
        request.setAttribute("listJobs", listJobs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jobsList.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        deleteToolsByJobID(id);
        jobDAO.deleteJob(id);
        response.sendRedirect("listjob");

    }

    private void deleteToolsByJobID(int jobid)
            throws SQLException, IOException {
        toolsDAO.deleteToolsByJobID(jobid);
    }

    private void updateJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String customerName = request.getParameter("customername");
        String customerHpNo = request.getParameter("customerhpno");
        String address = request.getParameter("address");
        String buildingType = request.getParameter("buildingtype");
        String date = request.getParameter("date");
        String addNote = request.getParameter("addnote");
        Job newJob = new Job(id, customerName, customerHpNo, address, buildingType, date, addNote);

        jobDAO.updateJob(newJob);
        response.sendRedirect("listjob");
    }

    private void listJobById(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        List< Job> listJobs = jobDAO.selectJobByID(id);
        request.setAttribute("listJobs", listJobs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jobsList.jsp");
        dispatcher.forward(request, response);
    }

    private void listTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Team> listTeam = teamDAO.selectAllTeam();
        request.setAttribute("listTeam", listTeam);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TeamList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewTeamForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Integer> jobIdList = jobDAO.listJobID();
        request.setAttribute("jobIdList", jobIdList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TeamForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditTeamForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        Team existingTeam = teamDAO.selectTeam(user_id);
        List<Integer> jobIdList = jobDAO.listJobID();
        request.setAttribute("jobIdList", jobIdList);
        request.setAttribute("team", existingTeam);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TeamForm.jsp");
        dispatcher.forward(request, response);
    }

    private void insertTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String ic_no = request.getParameter("ic_no");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String reg_date = request.getParameter("reg_date");
        int jobid = Integer.parseInt(request.getParameter("jobid"));
        Team newTeam = new Team(firstname, lastname, ic_no, address, contact, email, reg_date, jobid);
        teamDAO.insertTeam(newTeam);
        response.sendRedirect("listteam");
    }

    private void updateTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String ic_no = request.getParameter("ic_no");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String reg_date = request.getParameter("reg_date");
        int jobID = Integer.parseInt(request.getParameter("jobid"));

        Team team = new Team(user_id, firstname, lastname, ic_no, address, contact, email, reg_date, jobID);
        teamDAO.updateTeam(team);
        response.sendRedirect("listteam");

    }

    private void deleteTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        teamDAO.deleteTeam(user_id);
        response.sendRedirect("listteam");
    }
}
