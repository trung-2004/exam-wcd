<%@ page import="com.entities.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <jsp:include page="/layout/header.jsp"/>
    <% Employee employee = (Employee) request.getAttribute("employee"); %>
    <h1 class="mb-3 mt-3 d-flex justify-content-center">Edit Employee</h1>
    <div class="row mt-5">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <form action="edit-employee?id=<%= employee.getEmployeeId() %>" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee Name:</label>
                    <input type="text" name="name" value="<%= employee.getEmployeeName() %>" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword2" class="form-label">Email:</label>
                    <input type="email" name="email" value="<%= employee.getEmail() %>" required class="form-control" id="exampleInputPassword2">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword5" class="form-label">BirthDay:</label>
                    <input type="date" name="birthday" value="<%= employee.getBirthday() %>" required class="form-control" id="exampleInputPassword5">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword3" class="form-label">Phone:</label>
                    <input type="text" name="phone" value="<%= employee.getPhoneNumber() %>" required class="form-control" id="exampleInputPassword3">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>
</body>
</html>
