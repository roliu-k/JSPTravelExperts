<%@ page import="java.util.Random" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.JSPTravelExperts.BookingNoGenerator" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Book"/>
</jsp:include>

<%--The card to display details of booking is made by Ronnie and Julie made the view for booking the package--%>
<body>

<%--The card view to contain the image and details of the booking--%>
<div class="container content-wrapper">
    <div class="container mb-5" style="padding-top:160px">
        <div class="card">
            <div class="row g-0" style="min-height: 300px">
                <div class="col-md-5">
                    <img id="pkg-photo" style="height:300px">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <h5 class="card-title" id="name"></h5>
                        <div class="row">
                            <p class="card-text col-3"><i>Description: </i></p>
                            <p class="card-text col-9" id="description"></p>
                        </div>
                        <div class="row">
                            <p class="card-text col-3"><i>Price: </i></p>
                            <p class="card-text col-9" id="price"></p>
                        </div>
                        <div class="row">
                            <p class="card-text col-3"><i>Start Date: </i></p>
                            <p class="card-text col-9" id="startdate"></p>
                        </div>
                        <div class="row">
                            <p class="card-text col-3"><i>End Date: </i></p>
                            <p class="card-text col-9" id="enddate"></p>
                        </div>
                        <button class="btn btn-primary btn-sm mt-4 col-4" id="book-button">Book</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--The booking form for customer to book a new package--%>
    <div class="container">
        <form id="book-form">
            <input class="form-control" type="text" id='custID' hidden>
            <div class="row justify-content-center">
                <div class="form-group col-md-4">
                    <label class="control-label">Booking No</label>
                    <input class="form-control" type="text" id='bookingNo' value="<%
                                out.print(BookingNoGenerator.generateBookingNo());
                          %>" disabled>
                    <span class="text-light"></span>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Traveler Count</label>
                    <select class="form-control" type="text" id="travelCount">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    <span class="text-light"></span>
                </div>

                <div class="form-group col-md-4">
                    <label class="control-label">Trip Type</label>
                    <select class="form-control" type="text" id="tripType">
                        <option value="B">Business</option>
                        <option value="G">Group</option>
                        <option value="L">Leisure</option>
                    </select>
                    <span class="text-light"></span>
                </div>

            </div>
        </form>
        <div class="row justify-content-center">
            <div class="form-group" action="#">
                <input type="submit" value="Purchase" id="bookPackage" class="btn btn-primary" />
            </div>
        </div>
        <div class="row justify-content-center">
            <p id="bookMsg" class="lead"> </p>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<div id="login-section">
    <div class="login-inner">
        <div class="container">
            <div class="col-6 mx-auto">
                <h3 class="mb-3">Please login to purchase this package</h3>
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
</body>


<script>

    // convert date to YYYY-MM-DD format - Ronnie
    function toShortDate(date){
        year = date.getFullYear();
        month = date.getMonth()+1;
        dt = date.getDate();

        if (dt < 10) {
            dt = '0' + dt;
        }
        if (month < 10) {
            month = '0' + month;
        }
        return (year+'-' + month + '-'+dt);
    }

    // get the package id from request that has been passed to servlet - done by Ronnie
    var pkgid = <%=request.getAttribute("packageId") %>;

    // created the formatter used to display the price as currency
    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });

    // call the api to get the entire representation of the package and assign them to the proper fields in the view - done by Ronnie
    $.get("api/packages/getpackage/"+ pkgid, function (data){
        var startdate = new Date(data.PkgEndDate);
        var enddate = new Date(data.PkgEndDate)
        $("#name").text(data.PkgName);
        $("#description").text(data.PkgDesc);
        $("#price").text(formatter.format(data.PkgBasePrice));
        $("#startdate").text(toShortDate(startdate));
        $("#enddate").text(toShortDate(enddate));
        $("#pkg-photo").attr("src", data.Picture);
    });

    $(document).ready(function(){
        // hide the book form by default
        $("#book-form").hide();
        $("#bookPackage").hide();
        $("#login-section").hide();

        // attach an event handler to the button that adds a new booking to the database - done by Julie
        $(document).on('click', '#bookPackage', function(){
            //get current date
            var today = new Date();
            var travelerCount = $("#travelCount").val();
            var tripType = $("#tripType").val();
            var bookingNo =$("#bookingNo").val();
            var custID =$("#custID").val();

            let addData= {
                BookingDate : toShortDate(today),
                BookingNo : bookingNo,
                TravelerCount : travelerCount,
                CustomerId : custID,
                TripTypeId : tripType,
                PackageId : pkgid
            }

            // call the addbooking api to insert a new record of booking to the database
            $.ajax({
                type: "POST",
                url: "api/bookings/addbooking",
                contentType: "application/json",
                data: JSON.stringify(addData),
                async: false
            }).always(function(data) {
                debugger
                $("#bookMsg").text(data.message);
            });
        });

        /* check whether user is logged in or not. The customer is only allowed to book a package after logging in.
        The user credential is checked by the JWT token verification - done by Ronnie
         */
        $("#book-button").click(function (){

            // get the customer id from the token if the customer has logged in. If not, show the login section to ask user to login.
            let token = sessionStorage.getItem("token");
            if (token  == null){
                $("#login-section").show();
            }
            else {
                $.ajax({
                    type: "POST",
                    data: {"token": token},
                    url: "api/token/verify",
                    async: false,
                }).always(function (data) {
                    $("#custID").val(data.CustomerID);
                });

                $("#book-form").show();
                $("#bookPackage").show();
            }
        });
    });

    // validate user credential - written by Julie
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
                    $("#login-section").hide();
                    location.reload();
                }
            }
        });
    })
</script>
