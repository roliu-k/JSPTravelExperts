<%@ page import="java.util.Random" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.JSPTravelExperts.bookingNo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
  <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
    <!-- hidden field for customer ID -->

      ${packageId}
      <div class="container">
          <div class="container" style="padding-top:160px">
              <div class="card">
                  <div class="row g-0" style="min-height: 300px">
                      <div class="col-md-5">
                          <img src="images/Santorini.jpg" alt="..." style="width:100%;height:100%">
                      </div>
                      <div class="col-md-7">
                          <div class="card-body">
                              <h5 class="card-title" id="name"></h5>
                              <p class="card-text" id="description"></p>
                              <p class="card-text" id="price"></p>
                              <p class="card-text" id="startdate"></p>
                              <p class="card-text" id="enddate"></p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <div>
          <form>
              <input class="form-control" type="text" id='custID' hidden>
              <div class="row justify-content-center">
                  <div class="form-group col-md-4">
                      <label class="control-label">Booking No</label>
                      <input class="form-control" type="text" id='bookingNo' value="<%
                            out.print(bookingNo.generateBookingNo());
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
          </div>
          <div class="row justify-content-center">
              <div id="tokenCheck" class="form-group" action="#">
                  <input type="submit" value="Purchase" id="bookPackage" class="btn btn-primary btn-lg" />
              </div>
          </div>
          <div class="row justify-content-center">
              <p id="successMsg"> </p>
          </div>
      </div>
</body>
</html>

<script>

    // it works as following
    var pkgid = <%=request.getAttribute("packageId") %>;
    console.log("the package id being passed is: " + pkgid);

    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });

    formatter.format(2500); /* $2,500.00 */

    $.get("api/packages/getpackage/"+ pkgid, function (data){
        $("#name").text(data.PkgName);
        $("#description").text("Description: " + data.PkgDesc);
        $("#price").text("Price: " + data.PkgBasePrice);
        $("#startdate").text("Start Date: " + data.PkgStartDate);
        $("#enddate").text("End Date" + data.PkgEndDate);
    });

    //get customer ID from token
    $(document).ready(function(){
        let token = sessionStorage.getItem("token");
        if (token  == null){
            $("#tokenCheck").text("Login to purchase this package");
            $("#bookPackage").hide();
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
        }
    });


    $(document).ready(function(){
        $(document).on('click', '#bookPackage', function(){
            //get current date
            var today = new Date();
            var month = today.getUTCMonth() + 1;
            var day = today.getUTCDate();
            var year = today.getUTCFullYear();


            var travelerCount = $("#travelCount").val();
            var tripType = $("#tripType").val();
            var bookingNo =$("#bookingNo").val();
            var custID =$("#custID").val();

            let addData= {
                BookingDate : year + "/" + month + "/" + day,
                BookingNo : bookingNo,
                TravelerCount : travelerCount,
                CustomerId : custID,
                TripTypeId : tripType,
                PackageId : pkgid
            }
            $.ajax({
                type: "POST",
                url: "api/bookings/addbooking",
                contentType: "application/json",
                data: JSON.stringify(addData),
                async: false
            }).always(function(data) {
                debugger
                $("#successMsg").text(data.message);
            });
        });
    });
</script>
