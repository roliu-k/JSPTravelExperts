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

<div class="table-inner container">
  <table class="table table-striped table-dark">
    <thead>
    <tr>
      <th>
        Itinerary Number
      </th>
      <th>
        Trip Start Date
      </th>
      <th>
        Trip End Date
      </th>
      <th>
        Description
      </th>
      <th>
        Destination
      </th>
      <th>
        Base Price
      </th>
      <th>
        Fee
      </th>
      <th></th>
    </tr>
    </thead>
    <tbody id="table-content">

    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>

  // <tr>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  //   <td>
  //   </td>
  // </tr>
</script>