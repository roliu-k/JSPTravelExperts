package com.example.JSPTravelExperts;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import model.Customer;
import org.json.JSONObject;
import org.springframework.security.access.annotation.Secured;

import javax.annotation.security.DenyAll;
import javax.persistence.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.Enumeration;

// Julie's work

@Path("/customers")
public class AccountResource {

    @POST
    @Path("/getaccount")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAccount(@FormParam("token") String token) {

        // get customer id from the token
        String custStr = TokenResource.verifyToken(token);
        JSONObject jsonObj = new JSONObject(custStr);
        int customerID = jsonObj.getInt("CustomerID");

        // connect to the database and return the customer object.
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
        // connect to database and return the message string whether it is being updated successfully or not
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