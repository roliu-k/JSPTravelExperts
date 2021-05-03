<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>

<body>
<div class="container pt-4">

    <form action="account" id="">

        <h3 class="text-center" style="margin:1em auto;">Customer Info</h3>

        <div class="row d-flex justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">First Name</label>
                <input class="form-control" type="text" value=${customer.getCustFirstName()}>
                <span class="text-light" id="fname-validation"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Last Name</label>
                <input class="form-control" type="text" value=${customer.getCustLastName()}>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Address</label>
                <input class="form-control" type="text" value=${customer.getCustAddress()}>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">City</label>
                <input class="form-control" value=${customer.getCustCity()}>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Province</label>
                <input class="form-control" type="text" value=${customer.getCustProv()}>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Postal Code</label>
                <input class="form-control" type="text" value=${customer.getCustPostal()}>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Country</label>
                <input class="form-control" type="text" value=${customer.getCustCountry()}>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Home Phone</label>
                <input class="form-control" id="homePhone" type="text" value=${customer.getCustHomePhone()}>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Business Phone</label>
                <input class="form-control" id="busPhone" type="text" value=${customer.getCustBusPhone()}>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Email</label>
                <input class="form-control" type="email" value=${customer.getCustEmail()}>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Username</label>
                <input class="form-control" type="text" value= ${username}>
                <span class="text-light"></span>
            </div>
            <div class="form-group col-md-4">
                <label class="control-label">Password</label>
                <input class="form-control" type="password"/>
                <span class="text-light"></span>
            </div>
            <br />
        </div>

        <div class="row justify-content-center">
            <div class="form-group" action="#">
                <input type="submit" value="Update" class="btn btn-primary btn-lg" />
            </div>
        </div>
    </form>

</div>
</body>