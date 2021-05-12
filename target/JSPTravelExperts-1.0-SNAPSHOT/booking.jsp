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

<div class="content-wrapper">
  <div class="table-inner container">
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
<%--        <th>--%>
<%--          Destination--%>
<%--        </th>--%>
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
      <tbody id="table-content">

      </tbody>
    </table>
    <div class="row">
      <div class="col-8 text-right"><strong>Total: </strong></div>
      <div class="col-4" id="total"></div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>

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

  var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
  });

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
    $.get("api/bookingdetails/getbookingsbyid/" + customerId, function (data){
      var i;
      var total = 0;
      for(i=0; i<data.length; i++){
        var startdate = new Date(data[i].PkgStartDate);
        var enddate = new Date(data[i].PkgEndDate)
        var bookdate = new Date(data[i].BookingDate);
        $("#table-content").append("<tr><td>"+ toShortDate(bookdate) +
                "</td><td>" + data[i].PkgName +
                "</td><td>" + toShortDate(startdate) +
                "</td><td>" + toShortDate(enddate) +
                "</td><td>" + formatter.format(data[i].PkgBasePrice) +
                "</td><td>" + data[i].TravelerCount +
                "</td><td>" + data[i].TTName +
                "</td><td>" + data[i].BookingNo +"</td></tr>");
        total += parseInt(data[i].PkgBasePrice);
      }
      $("#total").text(formatter.format(total));
    });
  });


</script>