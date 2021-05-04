package model;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "customers", schema = "travelexperts")
public class Customer {
    private int CustomerId;
    private String CustFirstName;
    private String CustLastName;
    private String CustAddress;
    private String CustCity;
    private String CustProv;
    private String CustPostal;
    private String CustCountry;
    private String CustHomePhone;
    private String CustBusPhone;
    private String CustEmail;
    private String CustUsername;
    private String CustPassword;

    @Id
    @Column(name = "CustomerId", nullable = false)
    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int customerId) {
        CustomerId = customerId;
    }

    @Basic
    @Column(name = "CustFirstName", nullable = false, length = 25)
    public String getCustFirstName() {
        return CustFirstName;
    }

    public void setCustFirstName(String custFirstName) {
        CustFirstName = custFirstName;
    }

    @Basic
    @Column(name = "CustLastName", nullable = false, length = 25)
    public String getCustLastName() {
        return CustLastName;
    }

    public void setCustLastName(String custLastName) {
        CustLastName = custLastName;
    }

    @Basic
    @Column(name = "CustAddress", nullable = false, length = 75)
    public String getCustAddress() {
        return CustAddress;
    }

    public void setCustAddress(String custAddress) {
        CustAddress = custAddress;
    }

    @Basic
    @Column(name = "CustCity", nullable = false, length = 50)
    public String getCustCity() {
        return CustCity;
    }

    public void setCustCity(String custCity) {
        CustCity = custCity;
    }

    @Basic
    @Column(name = "CustProv", nullable = false, length = 2)
    public String getCustProv() {
        return CustProv;
    }

    public void setCustProv(String custProv) {
        this.CustProv = custProv;
    }

    @Basic
    @Column(name = "CustPostal", nullable = false, length = 7)
    public String getCustPostal() {
        return CustPostal;
    }

    public void setCustPostal(String custPostal) {
        CustPostal = custPostal;
    }

    @Basic
    @Column(name = "CustCountry", nullable = true, length = 25)
    public String getCustCountry() {
        return CustCountry;
    }

    public void setCustCountry(String custCountry) {
        CustCountry = custCountry;
    }

    @Basic
    @Column(name = "CustHomePhone", nullable = true, length = 20)
    public String getCustHomePhone() {
        return CustHomePhone;
    }

    public void setCustHomePhone(String custHomePhone) {
        CustHomePhone = custHomePhone;
    }

    @Basic
    @Column(name = "CustBusPhone", nullable = false, length = 20)
    public String getCustBusPhone() {
        return CustBusPhone;
    }

    public void setCustBusPhone(String custBusPhone) {
        CustBusPhone = custBusPhone;
    }

    @Basic
    @Column(name = "CustEmail", nullable = false, length = 50)
    public String getCustEmail() {
        return CustEmail;
    }

    public void setCustEmail(String custEmail) {
        CustEmail = custEmail;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (CustomerId != customer.CustomerId) return false;
        if (CustFirstName != null ? !CustFirstName.equals(customer.CustFirstName) : customer.CustFirstName != null)
            return false;
        if (CustLastName != null ? !CustLastName.equals(customer.CustLastName) : customer.CustLastName != null)
            return false;
        if (CustAddress != null ? !CustAddress.equals(customer.CustAddress) : customer.CustAddress != null)
            return false;
        if (CustCity != null ? !CustCity.equals(customer.CustCity) : customer.CustCity != null) return false;
        if (CustProv != null ? !CustProv.equals(customer.CustProv) : customer.CustProv != null) return false;
        if (CustPostal != null ? !CustPostal.equals(customer.CustPostal) : customer.CustPostal != null) return false;
        if (CustCountry != null ? !CustCountry.equals(customer.CustCountry) : customer.CustCountry != null)
            return false;
        if (CustHomePhone != null ? !CustHomePhone.equals(customer.CustHomePhone) : customer.CustHomePhone != null)
            return false;
        if (CustBusPhone != null ? !CustBusPhone.equals(customer.CustBusPhone) : customer.CustBusPhone != null)
            return false;
        if (CustEmail != null ? !CustEmail.equals(customer.CustEmail) : customer.CustEmail != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = CustomerId;
        result = 31 * result + (CustFirstName != null ? CustFirstName.hashCode() : 0);
        result = 31 * result + (CustLastName != null ? CustLastName.hashCode() : 0);
        result = 31 * result + (CustAddress != null ? CustAddress.hashCode() : 0);
        result = 31 * result + (CustCity != null ? CustCity.hashCode() : 0);
        result = 31 * result + (CustProv != null ? CustProv.hashCode() : 0);
        result = 31 * result + (CustPostal != null ? CustPostal.hashCode() : 0);
        result = 31 * result + (CustCountry != null ? CustCountry.hashCode() : 0);
        result = 31 * result + (CustHomePhone != null ? CustHomePhone.hashCode() : 0);
        result = 31 * result + (CustBusPhone != null ? CustBusPhone.hashCode() : 0);
        result = 31 * result + (CustEmail != null ? CustEmail.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "CustUsername", nullable = false, length = 50)
    public String getCustUsername() {
        return CustUsername;
    }

    public void setCustUsername(String custUsername) {
        CustUsername = custUsername;
    }

    @Basic
    @Column(name = "CustPassword", nullable = false, length = 50)
    public String getCustPassword() {
        return CustPassword;
    }

    public void setCustPassword(String custPassword) {
        CustPassword = custPassword;
    }
}

