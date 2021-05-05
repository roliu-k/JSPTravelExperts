$(document).ready(function(){
    var user = sessionStorage.getItem("user");
    $.get("api/customers/getaccount/" + user, function(data){
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
        var message = "";
        $.ajax({
            type: "PUT",
            url: "api/customers/updateaccount",
            contentType: "application/json",
            data: JSON.stringify(updateData),
            async: false
        }).always(function(data){
            debugger
            alert(data.message);
            $("#updateMsg").text(data.message);

        });

    });
});

