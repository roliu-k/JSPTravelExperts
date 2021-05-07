package com.example.JSPTravelExperts;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.gson.Gson;
import model.Customer;
import org.springframework.security.access.annotation.Secured;

import javax.persistence.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.Enumeration;


@Path("/customers")
public class AccountResource {

    @POST
    @Path("/getaccount")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAccount(@FormParam("token") String token) {

        int customerID = TokenResource.verifyToken(token);
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        TypedQuery<Customer> query = em.createQuery("select c from Customer c where c.customerId =:customerID", Customer.class);
        query.setParameter("customerID", customerID);
        Customer customer = query.getSingleResult();

        return new Gson().toJson(customer);
    }


    @PUT
    @Path("/updateaccount")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateAccount(String jsonString) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Customer customer = gson.fromJson(jsonString, Customer.class);
        em.getTransaction().begin();
        Customer result = em.merge(customer);
        em.getTransaction().commit();

        if (result != null){
            return "{\"message\" : \"Update Successful\"}";
        }
        else {
            return "{\"message\" : \"Update not successful\"}";
        }
    }


}