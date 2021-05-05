<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>

<script src="account.js"></script>

<body>
<div class="container pt-4">

    <form>
        <h3 class="text-center" style="margin:1em auto;">Customer Info</h3>
        <!-- hidden field for customer ID -->
        <input class="form-control" type="text" id='custID' hidden>
        <div class="row d-flex justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">First Name</label>
                <input class="form-control" type="text" id='custFirstName' >
                <span class="text-light" id="fname-validation"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Last Name</label>
                <input class="form-control" type="text" id='custLastName' >
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Address</label>
                <input class="form-control" type="text" id='custAddress'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">City</label>
                <input class="form-control" id = 'custCity'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
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

            <div class="form-group col-md-4">
                <label class="control-label">Postal Code</label>
                <input class="form-control" type="text" id='custPostal'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Country</label>
                <input class="form-control" type="text" id='custCountry'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Home Phone</label>
                <input class="form-control" type="text" id='custHomePhone'>
                <span class="text-light"></span>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Business Phone</label>
                <input class="form-control" type="text" id='custBusPhone'>
                <span class="text-light"></span>
            </div>

            <div class="form-group col-md-4">
                <label class="control-label">Email</label>
                <input class="form-control" type="email" id='custEmail'>
                <span class="text-light"></span>
            </div>
        </div>



        <div class="row justify-content-center">
            <div class="form-group col-md-4">
                <label class="control-label">Username</label>
                <input class="form-control" type="text" id= 'custUsername'>
                <span class="text-light"></span>
            </div>
            <div class="form-group col-md-4">
                <label class="control-label">Password</label>
                <input class="form-control" id='custPassword' type="password"/>
                <span class="text-light"></span>
            </div>
            <br />
        </div>

        <div class="row justify-content-center">
            <div id="updateMsg"></div>
            <div class="form-group" action="#">
                <input type="submit" value="Update" id="updateCust" class="btn btn-primary btn-lg" />
                <input type="button" value="Delete" id="deleteCust" class="btn btn-primary btn-lg" />
            </div>

        </div>

    </form>

</div>
</body>
