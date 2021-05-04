package com.example.JSPTravelExperts;

import com.google.gson.Gson;
import model.Customer;

import javax.persistence.*;
import javax.print.attribute.standard.Media;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/customers")
public class AccountResource {
    @GET
    @Path("getaccount/{ username }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAccount(@PathParam("username") String username) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        TypedQuery<Customer> query = em.createQuery("select c from Customer c where c.custUsername =:username", Customer.class);
        query.setParameter("username", username);
        Customer customer = query.getSingleResult();

        return new Gson().toJson(customer);
    }

    @GET
    @Path("getpassword/{ username }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getPassword(@PathParam("username") String username) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select c.custPassword from Customer c where c.custUsername =:username");
        query.setParameter("username", username);
        String password = (String) query.getSingleResult();

        return new Gson().toJson(password);
    }
}