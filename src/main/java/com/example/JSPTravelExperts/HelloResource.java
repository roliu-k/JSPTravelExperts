package com.example.JSPTravelExperts;

import javax.print.attribute.standard.Media;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/hello-world")
public class HelloResource {
    @GET
    @Path("")
    @Produces(MediaType.APPLICATION_JSON)
    public String hello() {

        return "Hello, World!";
    }
}