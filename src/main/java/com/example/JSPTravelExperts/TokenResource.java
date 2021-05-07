package com.example.JSPTravelExperts;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;

import javax.xml.stream.XMLStreamReader;

public class TokenResource {

    public static int verifyToken(String token) {
        int customerID = 0;
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("auth0")
                    .build(); //Reusable verifier instance
            DecodedJWT decodedJWT = verifier.verify(token);
            customerID = decodedJWT.getClaim("customerID").asInt();

        } catch (JWTVerificationException exception) {
            //Invalid signature/claims
        }
        return customerID;
    }
}
