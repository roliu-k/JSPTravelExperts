package com.example.JSPTravelExperts;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.mariadb.jdbc.Driver;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.*;

@Path("/packages")
public class PackageResource {
    @GET
    @Path("/getallpackages")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllPackages()
    {
        String response = null;
        try {
            DriverManager.registerDriver(new Driver());
            Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM packages");
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

    @GET
    @Path("/getpackage/{ packageId }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getPackage(@PathParam("packageId") int packageId)
    {
        String response = null;
        try {
            DriverManager.registerDriver(new Driver());
            Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", "");
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM packages WHERE PackageId = ?");
            stmt.setInt(1, packageId);
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            JsonObject jsonObject = new JsonObject();
            if (rs.next())
            {
                for (int i = 1; i<=rsmd.getColumnCount(); i++)
                {
                    jsonObject.addProperty(rsmd.getColumnName(i), rs.getString(i));
                }
            }
            response = jsonObject.toString();
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return response;
    }

}

