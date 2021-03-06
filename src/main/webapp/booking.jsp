<%--
  Created by IntelliJ IDEA.
  User: 860234
  Date: 5/5/2021
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="layout.jsp">
  <jsp:param name="title" value="My Bookings"/>
</jsp:include>

<%--The booking page is completely done by Ronnie. It summarises all the bookings for the specific customer and
contains two sections to separate past trips from the trips that has not happened yet.--%>
<%--We also offer the ability for user to cancel future trips.--%>

<div class="content-wrapper">
  <div class="table-inner container">
      <h5 class="text-white">Past Trips</h5>
    <table class="table table-striped table-dark">
      <thead>
      <tr>
        <th>
          Booking Date
        </th>
        <th>
          Package Name
        </th>
        <th>
          Trip Start Date
        </th>
        <th>
          Trip End Date
        </th>
        <th>
          Price
        </th>
        <th>
          Traveler Count
        </th>
        <th>
          Trip Type
        </th>
        <th>
          Booking No.
        </th>
      </tr>
      </thead>
      <tbody id="past-trips">

      </tbody>
    </table>
      <hr>
      <h5 class="text-white">Future Trips</h5>
      <table class="table table-striped table-dark">
          <thead>
          <tr>
              <th>
                  Booking Date
              </th>
              <th>
                  Package Name
              </th>
              <th>
                  Trip Start Date
              </th>
              <th>
                  Trip End Date
              </th>
              <th>
                  Price
              </th>
              <th>
                  Traveler Count
              </th>
              <th>
                  Trip Type
              </th>
              <th>
                  Booking No.
              </th>
              <th></th>
          </tr>
          </thead>
          <tbody id="future-trips">

          </tbody>
      </table>
      <div>
          <blockquote id="deleteMsg"></blockquote>
      </div>
    <div class="row">
      <div class="col-8 text-right"><strong>Total: </strong></div>
      <div class="col-4" id="total"></div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>

    $(document).ready(function(){
        // attach an event handler function for onclick events to the input button elements that removes the booking from current database
        $(document.body).on( "click", "input[type='button']", function() {
            debugger
            let bookingId = $(this).siblings().val();  // find the value of bookingId
            // call the api to perform delete task
            $.ajax({
                url: 'api/bookings/deletebooking/' + bookingId,
                type: 'DELETE',
                success: function(result) {
                    $("#deleteMsg").val(result);
                    //reload the page
                    location.reload();
                }
            });
        });
    });

    // convert date to YYYY-MM-DD format
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

    // convert price to be in currency format
    var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    });

    // get the customer id from token
    let token = sessionStorage.getItem("token");
    var customerId = 0;
    $.ajax({
    type: "POST",
    data: {"token" :token},
    url: "api/token/verify",
    success: function (data) {
      customerId = data.CustomerID;
    }
    }).done(function (){
        // find all the bookings for the customer and populate data to the table according to their start dates
        $.get("api/bookingdetails/getbookingsbyid/" + customerId, function (data){
          var i;
          var total = 0;
          for(i=0; i<data.length; i++){
            var startdate = new Date(data[i].PkgStartDate);
            var enddate = new Date(data[i].PkgEndDate)
            var bookdate = new Date(data[i].BookingDate);
            var today = new Date();

            if(startdate <= today) {
                // fill in the details for the past trip
                $("#past-trips").append("<tr><td>" + toShortDate(bookdate) +
                    "</td><td>" + data[i].PkgName +
                    "</td><td>" + toShortDate(startdate) +
                    "</td><td>" + toShortDate(enddate) +
                    "</td><td>" + formatter.format(data[i].PkgBasePrice) +
                    "</td><td>" + data[i].TravelerCount +
                    "</td><td>" + data[i].TTName +
                    "</td><td>" + data[i].BookingNo + "</td></tr>");
                total += parseInt(data[i].PkgBasePrice);
            }
            else{
                // fill in the details for the future trip
                $("#future-trips").append(
                    "<tr><td>" + toShortDate(bookdate) +
                    "</td><td>" + data[i].PkgName +
                    "</td><td>" + toShortDate(startdate) +
                    "</td><td>" + toShortDate(enddate) +
                    "</td><td>" + formatter.format(data[i].PkgBasePrice) +
                    "</td><td>" + data[i].TravelerCount +
                    "</td><td>" + data[i].TTName +
                    "</td><td>" + data[i].BookingNo +
                    "</td><td>" + "<form><input type='text' value='"+ data[i].BookingId +"' hidden>" +
                    "<input type='button' value='Cancel' class='btn-primary'></form>" +
                    "</td></tr>");
                total += parseInt(data[i].PkgBasePrice);
            }
          }

          // display the total spending of all the trips
          $("#total").text(formatter.format(total));

    });
    });


</script>