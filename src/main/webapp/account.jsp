<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Account"/>
</jsp:include>

<body>
<div class="container pt-4">

    <form>
        <h3 class="text-center" style="margin:1em auto;">Customer Info</h3>
        <!-- hidden field for customer ID -->
        <input class="form-control" type="text" id='custID' hidden>
        <div class="row d-flex justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">First Name</label>
                <input class="form-control" type="text" id='custFirstName' >
                <span class="text-light" id="fname-validation"></span>
            </div>

            <div class="form-group col-md-4 col-8">
                <label class="control-label">Last Name</label>
                <input class="form-control" type="text" id='custLastName' >
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Address</label>
                <input class="form-control" type="text" id='custAddress'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4 col-8">
                <label class="control-label">City</label>
                <input class="form-control" id = 'custCity'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Province</label>
                <select class="form-control" type="text" id="custProv">
                    <option value="AB">Alberta</option>
                    <option value="BC">British Columbia</option>
                    <option value="MB">Manitoba</option>
                    <option value="NB">New Brunswick</option>
                    <option value="NL">Newfoundland and Labrador</option>
                    <option value="NS">Nova Scotia</option>
                    <option value="NT">Northwest Territories</option>
                    <option value="NU">Nunavut</option>
                    <option value="ON">Ontario</option>
                    <option value="PE">Prince Edward Island</option>
                    <option value="QC">Quebec</option>
                    <option value="SK">Saskatchewan</option>
                    <option value="YK">Yukon</option>
                </select>

                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4 col-8">
                <label class="control-label">Postal Code</label>
                <input class="form-control" type="text" id='custPostal'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Country</label>
                <input class="form-control" type="text" id='custCountry'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4 col-8">
                <label class="control-label">Home Phone</label>
                <input class="form-control" type="text" id='custHomePhone'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Business Phone</label>
                <input class="form-control" type="text" id='custBusPhone'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4 col-8">
                <label class="control-label">Email</label>
                <input class="form-control" type="email" id='custEmail'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Username</label>
                <input class="form-control" type="text" id= 'custUsername'>
                <span class="text-light"></span>
            </div>
            <div class="form-group col-md-4 col-8">
                <label class="control-label">Password</label>
                <input class="form-control" id='custPassword' type="password"/>
                <span class="text-light"></span>
            </div>
            <br />
        </div>

    </form>
    <div class="row justify-content-center">
        <div class="form-group" action="#">
            <input type="submit" value="Update" id="updateCust" class="btn btn-primary" style="width:12rem"/>
        </div>
    </div>
    <p id="updateMsg" class="text-danger"></p>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>

<script>

    $(document).ready(function(){
        let token = sessionStorage.getItem("token");
        $.ajax({
            type: "POST",
            data: {"token" :token},
            url: "api/customers/getaccount/",
            async: false,
            success: function (data) {
                $("#custID").val(data.CustomerId);
                $("#custFirstName").val(data.CustFirstName);
                $("#custLastName").val(data.CustLastName);
                $("#custAddress").val(data.CustAddress);
                $("#custBusPhone").val(data.CustBusPhone);
                $("#custCity").val(data.CustCity);
                $("#custCountry").val(data.CustCountry);
                $("#custEmail").val(data.CustEmail);
                $("#custHomePhone").val(data.CustHomePhone);
                $("#custPassword").val(data.CustPassword);
                $("#custPostal").val(data.CustPostal);
                $("#custProv").val(data.CustProv);
                $("#custUsername").val(data.CustUsername);
            }
        });
    });

    $(document).ready(function(){
        $(document).on('click', '#updateCust', function(){
            var custID = $("#custID").val();
            var custFirstName = $("#custFirstName").val();
            var custLastName = $("#custLastName").val();
            var custAddress = $("#custAddress").val();
            var custBusPhone = $("#custBusPhone").val();
            var custCity = $("#custCity").val();
            var custCountry = $("#custCountry").val();
            var custEmail = $("#custEmail").val();
            var custHomePhone = $("#custHomePhone").val();
            var custPostal = $("#custPostal").val();
            var custProv = $("#custProv").val();
            var custUsername = $("#custUsername").val();
            var custPassword = $("#custPassword").val();

            let updateData= {
                CustomerId : custID,
                CustFirstName : custFirstName,
                CustLastName : custLastName,
                CustAddress : custAddress,
                CustCity : custCity,
                CustProv : custProv,
                CustPostal : custPostal,
                CustCountry : custCountry,
                CustHomePhone : custHomePhone,
                CustBusPhone : custBusPhone,
                CustEmail : custEmail,
                CustUsername : custUsername,
                CustPassword : custPassword
            }
            $.ajax({
                type: "PUT",
                url: "api/customers/updateaccount",
                contentType: "application/json",
                data: JSON.stringify(updateData),
                async: false
            }).always(function(data){
                $("#updateMsg").text(data.message);
            });

        });
    });
</script>

