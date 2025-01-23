<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d22.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container-section {
        background-color: #343a40;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
    }
    .container{
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.18);
        max-width: 600px;
        width: 100%;
    }
    form {
        box-shadow: 2px 6px 100px white;
    }

    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    .card{
        background-color: darkgray;
    }

    .card-img {
        object-fit: cover;
        height: 100%;
        width: 100%;
    }

    .form-control{
        height: 30px;
    }
    .form-label{
        font-size: 15px;
    }

    .links {
        text-align: center;
        margin-top: 20px;
    }
    .links a {
        color: #00d4ff;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
    }
    .links a:hover {
        color: #007bff;
        text-decoration: underline;
    }


</style>


<body>
<section class="container my-5  w-50 text-light p-3">
    <div class="container-section  text-light py-2">
        <header class="text-center mb-4">
            <h3>Login page</h3>
        </header>
    </div>

    <form class="row g-3 p-3 form-container" action="login" method="post">
        <div class="card mb-3" style="max-width: 840px;">
            <div class="row g-0">
                <div class="col-md-5">
                    <img src="<%= request.getContextPath() %>/resources/images/log.jpg" class="img-fluid rounded-start card-img" alt="Image" id="log">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <h5 class="card-title text-center mb-3">Welcome Back</h5>

                        <div class="mb-3">
                            <label for="userName" class="form-label">User name</label>
                            <input type="text" name="name" class="form-control" placeholder="User name" aria-label="User name" id="userName">
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Password" aria-label="password" id="exampleInputPassword1">
                        </div>

                        <div class="d-flex justify-content-center mt-4">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>



<%--                        <ul>--%>
<%--                            <li class="nav-item"><a class="nav-link" href="customerCat"></a></li>--%>
<%--                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="links">
            <p>Don't have an account? <a href="user-save.jsp">Create one</a></p>
            <p>Forgot your password? <a href="user-update.jsp">Change it here</a></p>
        </div>
    </form>

</section>

<%--<a href="user-save.jsp">Add new customer</a><br>--%>
<%--<a href="product-save.jsp">Add new product</a><br>--%>
<%--<a href="product-delete.jsp">Delete new product</a><br>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%--<script>--%>
<%--    window.onload = function() {--%>
<%--        window.location.href = "customerCat";--%>
<%--    };--%>
<%--</script>--%>
</body>
</html>
