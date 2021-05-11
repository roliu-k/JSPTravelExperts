package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Bookings {
    private int BookingId;
    private String BookingDate;
    private String BookingNo;
    private Double TravelerCount;
    private Integer CustomerId;
    private String TripTypeId;
    private Integer PackageId;

    @Id
    @Column(name = "BookingId")
    public int getBookingId() {
        return BookingId;
    }

    public void setBookingId(int bookingId) {
        this.BookingId = bookingId;
    }

    @Basic
    @Column(name = "BookingDate")
    public String getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.BookingDate = bookingDate;
    }

    @Basic
    @Column(name = "BookingNo")
    public String getBookingNo() {
        return BookingNo;
    }

    public void setBookingNo(String bookingNo) {
        this.BookingNo = bookingNo;
    }

    @Basic
    @Column(name = "TravelerCount")
    public Double getTravelerCount() {
        return TravelerCount;
    }

    public void setTravelerCount(Double travelerCount) {
        this.TravelerCount = travelerCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bookings bookings = (Bookings) o;

        if (BookingId != bookings.BookingId) return false;
        if (BookingDate != null ? !BookingDate.equals(bookings.BookingDate) : bookings.BookingDate != null)
            return false;
        if (BookingNo != null ? !BookingNo.equals(bookings.BookingNo) : bookings.BookingNo != null) return false;
        if (TravelerCount != null ? !TravelerCount.equals(bookings.TravelerCount) : bookings.TravelerCount != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = BookingId;
        result = 31 * result + (BookingDate != null ? BookingDate.hashCode() : 0);
        result = 31 * result + (BookingNo != null ? BookingNo.hashCode() : 0);
        result = 31 * result + (TravelerCount != null ? TravelerCount.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "CustomerId")
    public Integer getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(Integer customerId) {
        this.CustomerId = customerId;
    }

    @Basic
    @Column(name = "TripTypeId")
    public String getTripTypeId() {
        return TripTypeId;
    }

    public void setTripTypeId(String tripTypeId) {
        this.TripTypeId = tripTypeId;
    }

    @Basic
    @Column(name = "PackageId")
    public Integer getPackageId() {
        return PackageId;
    }

    public void setPackageId(Integer packageId) {
        this.PackageId = packageId;
    }
}
