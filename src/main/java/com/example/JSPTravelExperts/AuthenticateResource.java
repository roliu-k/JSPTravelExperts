package com.example.JSPTravelExperts;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.google.gson.JsonObject;
import org.jboss.resteasy.annotations.Body;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.security.interfaces.RSAPublicKey;
import java.sql.*;


@Path("/authenticate")
public class AuthenticateResource {
    @POST
    @Path("/login")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String authenticateUser(@FormParam("username") String username, @FormParam("password") String password) {
        JsonObject error = new JsonObject();
        error.addProperty("Message", "Update unsuccessful");
        error.addProperty("Token", 0);
        try {

            // Authenticate the user using the credentials provided
            int custID = authenticate(username, password);
            if(custID != 0) {
                // Issue a token for the user
                String token = issueToken(custID);
                // Return the token on the response

                JsonObject success = new JsonObject();
                success.addProperty("Message", "Update Success");
                success.addProperty("Token", token);


                return success.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return error.toString();
    }



    private int authenticate(String username, String password) throws Exception {
        Boolean authenticated = false;
        int custID = 0;
        try {
            String driver = "org.mariadb.jdbc.Driver";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "root", "");
            PreparedStatement stmt = conn.prepareStatement("Select CustomerId from customers where CustUsername=? and CustPassword=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                custID = rs.getInt("CustomerId");
            }
            conn.close();
        } catch (
                SQLException throwables) {
            throwables.printStackTrace();
        }
        return custID;
    }

    private String issueToken(int custID) {
        // Issue a token (can be a random String persisted to a database or a JWT token)
        // The issued token must be associated to a user
        // Return the issued token
        String token = "";
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            token = JWT.create()
                    .withClaim("customerID", custID)
                    .withIssuer("auth0")
                    .sign(algorithm);

        } catch (JWTCreationException exception){
            exception.printStackTrace();
        }
        return token;
    }

}
