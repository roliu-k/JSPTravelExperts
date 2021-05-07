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
    var username = $("#username").val();
    $("#authenticate").click(function(){
        $.ajax({
            type: "POST",
            data: $('form').serializeArray(),
            url: "api/authenticate/login/",
            async: false,
            success: function (data) {
                if (data.Message == "Update unsuccessful"){
                    $("#errMsg").text("You have entered either wrong username or password.");
                }
                else {
                    sessionStorage.setItem("token", data.Token);
                    window.location.replace("index.jsp");
                }
            }
        });
    })
</script>

