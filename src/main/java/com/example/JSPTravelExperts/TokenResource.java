package com.example.JSPTravelExperts;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.stream.XMLStreamReader;
@Path("/token")

// Julie's work
//Token Resource for JWT
public class TokenResource {

    //Verifies token by applying algorithm
    //parameters: token
    //returns: customer ID
    @POST
    @Path("/verify")
    @Produces(MediaType.APPLICATION_JSON)
    public static String verifyToken(@FormParam("token") String token) {
        int customerID = 0;
        JsonObject custNull = new JsonObject();
        custNull.addProperty("CustomerID", 0);
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("auth0")
                    .build(); //Reusable verifier instance
            DecodedJWT decodedJWT = verifier.verify(token);
            // get the customer id value from the token and return it with its name as json string
            customerID = decodedJWT.getClaim("customerID").asInt();
            JsonObject custId = new JsonObject();
            custId.addProperty("CustomerID", customerID);
            return custId.toString();

        } catch (JWTVerificationException exception) {
            //Invalid signature/claims
        }
        return custNull.toString();
    }
}
