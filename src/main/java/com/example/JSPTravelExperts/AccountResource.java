package com.example.JSPTravelExperts;

import com.google.gson.Gson;
import model.Customer;

import javax.persistence.*;
import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
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
            return "{\"message\" : 'Update Successful'}";
        }
        else {
            return "{\"message\" : 'Update not successful'}";
        }
    }
}