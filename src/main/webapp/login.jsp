<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>

<body>
<div class="login-inner">
    <div class="container col-xs-6 col-8">
        <form>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" placeholder="Enter Username" name="user">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="Password" name="pwd">
                <small class="text-danger" id="errMsg"></small>
            </div>
        </form>

        <button class="btn btn-primary" id="authenticate">Submit</button>
    </div>
</div>
</body>

<script>
    $("#authenticate").click(function(){
        var username = $("#username").val();
        var pwd = $("#password").val();
        $.get("api/customers/getpassword/" + username, function(data){
            if(data != pwd){
                $("#errMsg").text("You have entered either wrong username or password.");
            }
            else{
                sessionStorage.setItem("user", username);
                window.location.replace("index.jsp");
            }
        });
    })
</script>