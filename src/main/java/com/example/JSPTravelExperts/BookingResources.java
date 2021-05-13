package com.example.JSPTravelExperts;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Bookings;
import model.Customer;

import javax.persistence.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.lang.reflect.Type;
import java.util.List;

@Path("/bookings")
public class BookingResources {
    @GET
    @Path("getbookings/{ custID }")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAccount(@PathParam("custID") int custID) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select b from Bookings b where b.customerId =" + custID, Bookings.class);
        List<Bookings> list = query.getResultList();

        Gson gson = new Gson();
        Type type = new TypeToken<List<Bookings>>(){}.getType();

        return gson.toJson(list, type);

    }
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
