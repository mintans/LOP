/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "documention")
public class Documention {
    @Id
    private String id;
    private String userId;
    private String requestedDocuments;
    private String amount;
    private String date;
    private String objectivity;
    private boolean admin;

    public Documention() {
    }

    public Documention(String id, String userId, String requestedDocuments, String amount, String date, String objectivity, boolean admin) {
        this.id = id;
        this.userId = userId;
        this.requestedDocuments = requestedDocuments;
        this.amount = amount;
        this.date = date;
        this.objectivity = objectivity;
        this.admin = admin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRequestedDocuments() {
        return requestedDocuments;
    }

    public void setRequestedDocuments(String requestedDocuments) {
        this.requestedDocuments = requestedDocuments;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getObjectivity() {
        return objectivity;
    }

    public void setObjectivity(String objectivity) {
        this.objectivity = objectivity;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    
}
