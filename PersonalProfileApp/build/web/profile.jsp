<%@page import="bean.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Saved</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg border-0 rounded-lg">
                <div class="card-header bg-success text-white text-center py-4">
                    <h2 class="font-weight-light"><i class="fas fa-check-circle mr-2"></i>Profile Saved Successfully</h2>
                </div>
                <div class="card-body p-4">
                    <%
                        ProfileBean p = (ProfileBean) request.getAttribute("profile");
                    %>
                    <table class="table table-borderless">
                        <tr><th>Student ID</th><td><%= p.getStudentID() %></td></tr>
                        <tr><th>Name</th><td><%= p.getName() %></td></tr>
                        <tr><th>Program</th><td><%= p.getProgram() %></td></tr>
                        <tr><th>Email</th><td><%= p.getEmail() %></td></tr>
                        <tr><th>Hobbies</th><td><%= p.getHobbies() %></td></tr>
                        <tr><th>Introduction</th><td><%= p.getIntro() %></td></tr>
                    </table>
                    <div class="text-center mt-4">
                        <a href="index.html" class="btn btn-primary mr-2">Add Another</a>
                        <a href="ProfileServlet" class="btn btn-outline-secondary">View All Profiles</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>