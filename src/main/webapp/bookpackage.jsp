<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
  <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
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
                              <button class="btn btn-primary btn-sm mt-4 col-4" id="bookpkg">Book</button>
                          </div>
                      </div>
                  </div>
              </div>
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
</script>
