<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>

<%--The login page allows users to log into their accounts. The view is done by Ronnie and script is done by Julie--%>
<body>
<div class="content-wrapper">
    <div class="login-inner">
        <div class="container">
            <div class="col-6 float-left">
                <form>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                        <small class="text-danger" id="errMsg"></small>
                    </div>
                </form>
                <button class="btn btn-primary col-6 mt-2" id="authenticate">Submit</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>

<script>
    // authenticate user by reaching out the authentication api
    var username = $("#username").val();
    $("#authenticate").click(function(){
        $.ajax({
            type: "POST",
            data: $('form').serializeArray(),
            url: "api/authenticate/login/",
            async: false,
            success: function (data) {
                if (data.Message == "Update unsuccessful"){
                    // failure to authenticate will result in the showing of an error message
                    $("#errMsg").text("You have entered either wrong username or password.");
                }
                else {
                    // store the issued token in the session
                    sessionStorage.setItem("token", data.Token);
                    window.location.replace("index.jsp");
                }
            }
        });
    })
</script>

