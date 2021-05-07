<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<body>
<header class="home-section">
    <div class="dark-overlay">
        <div class="container home-inner">
            <div class="d-flex flex-column">
                <h3 class="text-light display-4">Welcome to Travel Experts!</h3>
                <button class="btn btn-primary mt-4 align-self-start">Explore more</button>
            </div>
        </div>
    </div>
</header>

<div class="container popular-packages">
    <h3 class="text-light m-4">Popular Packages</h3>
    <hr>
    <div class="package-area">
        <div class='d-flex flex-column flex-md-row flex-column flex-sm-row align-items-center justify-content-center' id="package-row-one">

        </div>
        <div class="d-flex flex-column flex-md-row flex-column flex-sm-row align-items-center justify-content-center" id="package-row-two">

        </div>
        <form action="bookingdetail">
            <input type="hidden" name="packageId" id="pkgId" value="" />
        </form>
    </div>
</div>
</body>


<script>
    $.get("api/packages/getallpackages", function (data){
        var i;
        for(i=0; i<3; i++){
            $("#package-row-one").append("<div class='card package-card'> <img class='card-img-top' src='" +
                "images/Caribbean.jpg' " +
                "alt='Caribbean'> <div class='dark-overlay'></div>" +
                "<div class='card-body text-light'> <h5 class='card-title'>" +
                data[i].PkgName + "</h5> " +
                "<p class='card-text'>"+ data[i].PkgDesc + "</p>" +
                "<a class='btn btn-secondary btn-sm'>More Details</a></div></div>");
        }

        for(i=3; i<6; i++){
            $("#package-row-two").append("<div class='card package-card'> <img class='card-img' src='" +
                "images/Caribbean.jpg' " + "alt='Caribbean'> " +
                "<div class='card-img-overlay text-center text-light'>" +
                "<h5 class='card-title'>" + data[i].PkgName + "</h5> " +
                "<div class='card-hover-display'>" +
                "<p class='card-text'>"+ data[i].PkgDesc +"</p>" +
                "<button class='btn btn-secondary btn-sm' onclick='viewdetail()'>More Details</button>" +
                "</div></div></div>");
        }
    });

    $("#pkgId").val("1");

    function viewdetail()
    {
        $("form").submit();
    };


</script>
