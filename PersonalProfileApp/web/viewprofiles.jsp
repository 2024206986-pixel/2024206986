<%@page import="java.util.List"%>
<%@page import="bean.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Registered Profiles Summary</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-light">

    <div class="container-fluid mt-5 px-4">
        <div class="card shadow border-0 rounded-lg">

            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center py-4">
                <h2 class="mb-0 font-weight-light">
                    <i class="fas fa-users-cog mr-2 text-info"></i>Profile Management Dashboard
                </h2>
                <a href="index.html" class="btn btn-primary shadow-sm">
                    <i class="fas fa-plus-circle mr-1"></i> Key In New Profile
                </a>
            </div>

            <div class="card-body">
                <form action="ProfileServlet" method="get" class="form-inline mb-3">
                    <input type="text" name="keyword" class="form-control mr-2" placeholder="Search by Student ID or Name">
                    <button type="submit" class="btn btn-info mr-2"><i class="fas fa-search"></i> Search</button>
                    <a href="ProfileServlet" class="btn btn-outline-secondary">Reset</a>
                </form>

                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0 text-center">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col" style="width: 5%">#</th>
                                <th scope="col" style="width: 15%">Student ID</th>
                                <th scope="col" style="width: 20%">Full Name</th>
                                <th scope="col" style="width: 10%">Program</th>
                                <th scope="col" style="width: 15%">Email Address</th>
                                <th scope="col" style="width: 15%">Hobbies</th>
                                <th scope="col" style="width: 20%">Self-Introduction</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");

                                if (profiles != null && !profiles.isEmpty()) {
                                    int counter = 1;
                                    for (ProfileBean profile : profiles) {
                            %>
                                        <tr>
                                            <td class="align-middle font-weight-bold text-muted"><%= counter++ %></td>
                                            <td class="align-middle font-weight-bold text-primary"><%= profile.getStudentID() %></td>
                                            <td class="align-middle text-dark font-weight-bold text-left"><%= profile.getName() %></td>
                                            <td class="align-middle"><span class="badge badge-secondary p-2"><%= profile.getProgram() %></span></td>
                                            <td class="align-middle"><a href="mailto:<%= profile.getEmail() %>"><%= profile.getEmail() %></a></td>
                                            <td class="align-middle text-muted"><%= profile.getHobbies() %></td>
                                            <td class="align-middle text-left text-secondary" style="font-size: 0.9rem;"><%= profile.getIntro() %></td>
                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="7" class="py-5 text-muted">
                                            <i class="fas fa-folder-open fa-3x mb-3 d-block text-secondary"></i>
                                            No profile data found.
                                        </td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card-footer bg-white text-muted text-right py-3" style="font-size: 0.85rem;">
                <i class="fas fa-info-circle mr-1 text-primary"></i> Data is stored permanently in the StudentProfilesDB database.
            </div>

        </div>
    </div>

</body>
</html>