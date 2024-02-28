<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <jsp:include page="/layout/header.jsp"/>
        <h1 class="mb-3 mt-3 d-flex justify-content-center">Create Employee</h1>
        <div class="row mt-5">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <form action="create-employee" method="post">
                    <div class="mb-3">
                        <label for="exampleInputEmail4" class="form-label">Employee Id:</label>
                        <input type="text" name="id" class="form-control" required id="exampleInputEmail4" aria-describedby="emailHelp">
                        <% if (request.getAttribute("validationErrors") != null) { %>
                        <div style="color: red;">
                            <% for (String error : (List<String>) request.getAttribute("validationErrors")) { %>
                            <% if (error.contains("Employee ID is required")) { %>
                            <%= error %><br>
                            <% } %>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Employee Name:</label>
                        <input type="text" name="name" class="form-control" required id="exampleInputEmail1" aria-describedby="emailHelp">
                        <% if (request.getAttribute("validationErrors") != null) { %>
                        <div style="color: red;">
                            <% for (String error : (List<String>) request.getAttribute("validationErrors")) { %>
                            <% if (error.contains("Employee Name is required")) { %>
                            <%= error %><br>
                            <% } %>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword2" class="form-label">Email:</label>
                        <input type="email" name="email" class="form-control" required id="exampleInputPassword2">
                        <% if (request.getAttribute("validationErrors") != null) { %>
                        <div style="color: red;">
                            <% for (String error : (List<String>) request.getAttribute("validationErrors")) { %>
                            <% if (error.contains("Employee Email is required")) { %>
                            <%= error %><br>
                            <% } %>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword5" class="form-label">BirthDay:</label>
                        <input type="date" name="birthday" class="form-control" required id="exampleInputPassword5">
                        <% if (request.getAttribute("validationErrors") != null) { %>
                        <div style="color: red;">
                            <% for (String error : (List<String>) request.getAttribute("validationErrors")) { %>
                            <% if (error.contains("Employee Birthday is required")) { %>
                            <%= error %><br>
                            <% } %>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword3" class="form-label">Phone:</label>
                        <input type="text" name="phone" class="form-control" required id="exampleInputPassword3">
                        <% if (request.getAttribute("validationErrors") != null) { %>
                        <div style="color: red;">
                            <% for (String error : (List<String>) request.getAttribute("validationErrors")) { %>
                            <% if (error.contains("Employee PhoneNumber is required")) { %>
                            <%= error %><br>
                            <% } %>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                    <button type="submit" class="btn btn-primary float-end">Submit</button>
                </form>
            </div>
            <div class="col-lg-2"></div>
        </div>
</div>
</body>
</html>
