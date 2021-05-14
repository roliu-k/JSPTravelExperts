package com.example.JSPTravelExperts;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.mariadb.jdbc.Driver;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.*;

// Written by Grayson
@Path("/bookingdetails")
public class BookingsResource {
    @GET
    @Path("/getbookingsbyid/{ custId }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getBookingsById(@PathParam("custId") int custId)
    {
        String response = null;
        try {
            DriverManager.registerDriver(new Driver());
            String sql = "SELECT * FROM bookings JOIN packages on bookings.PackageId = packages.PackageId " +
                    "JOIN triptypes on bookings.TripTypeId = triptypes.TripTypeId where CustomerId = ? order by BookingDate desc";
            Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", "");

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, custId);
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            JsonArray jsonArray = new JsonArray();
            while (rs.next())
            {
                JsonObject object = new JsonObject();
                for (int i = 1; i<=rsmd.getColumnCount(); i++)
                {
                    object.addProperty(rsmd.getColumnName(i), rs.getString(i));
                }
                jsonArray.add(object);
            }
            response = jsonArray.toString();
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return response;
    }

}
