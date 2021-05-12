<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
  <jsp:param name="title" value="Book"/>
</jsp:include>
<body>
      ${packageId}
      <div class="container content-wrapper">
          <div class="container" style="padding-top:160px">
              <div class="card">
                  <div class="row g-0" style="min-height: 300px">
                      <div class="col-md-5">
                          <img src="images/Santorini.jpg" alt="..." style="width:100%;height:100%">
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
                              <button class="btn btn-primary btn-sm mt-4 col-4" id="bookpkg">Book</button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <jsp:include page="footer.jsp"></jsp:include>
</body>



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

    // it works as following
    var pkgid = <%=request.getAttribute("packageId") %>;
    console.log("the package id being passed is: " + pkgid);

    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });


    $.get("api/packages/getpackage/"+ pkgid, function (data){
        var startdate = new Date(data.PkgEndDate);
        var enddate = new Date(data.PkgEndDate)
        $("#name").text(data.PkgName);
        $("#description").text(data.PkgDesc);
        $("#price").text(formatter.format(data.PkgBasePrice));
        $("#startdate").text(toShortDate(startdate));
        $("#enddate").text(toShortDate(enddate));
    });
</script>
