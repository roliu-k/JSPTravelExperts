$(document).ready(function(){
    var user = sessionStorage.getItem("user");
    $.get("api/customers/getaccount/" + user, function(data){
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