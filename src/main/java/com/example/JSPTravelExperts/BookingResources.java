package com.example.JSPTravelExperts;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Bookings;

import javax.persistence.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.lang.reflect.Type;
import java.util.List;


//done by Julie
@Path("/bookings")
public class BookingResources {
    //get booking based on customer that's been logged in
    //parameters: customer ID
    //returns: GSON object of customer's booking
    @GET
    @Path("getbookings/{ custID }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAccount(@PathParam("custID") int custID) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select b from Bookings b where b.customerId =" + custID, Bookings.class);
        //get a list of bookings
        List<Bookings> list = query.getResultList();
        Gson gson = new Gson();
        Type type = new TypeToken<List<Bookings>>(){}.getType();

        return gson.toJson(list, type);
    }

    //add bookings to customer
    //parameters: JSON string of package selected for bookings
    //returns: success message
    @POST
    @Path("/addbooking")
    @Consumes (MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String addbooking(String jsonString) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Bookings bookings = gson.fromJson(jsonString, Bookings.class);
        em.getTransaction().begin();
        Bookings result = em.merge(bookings);
        em.getTransaction().commit();
        if (result == null){
            return "{\"message\" : \"There is an error. Please try again later or contact Travel Experts\"}";
        } else {
            return "{\"message\" : \"Package purchased!\"}";
        }


    }

    //delete bookings for package
    //parameters: booking ID
    //returns: success message
    @DELETE
    @Path("/deletebooking/{ bookingId }")
    @Consumes(MediaType.APPLICATION_JSON)
    public String deletebooking(@PathParam("bookingId") int bookingId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Bookings bookings = em.find(Bookings.class, bookingId);
        em.getTransaction().begin();
        em.remove(bookings);
        em.getTransaction().commit();
        if (em.contains(bookings)){
            em.getTransaction().rollback();
            em.close();
            return "{\"message\":\"Delete failed\"}";
        }else {
            em.close();
            return "{\"message\":\"Delete successful\"}";
        }

    }
}
