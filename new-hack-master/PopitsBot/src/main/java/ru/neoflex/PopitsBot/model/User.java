package ru.neoflex.PopitsBot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue
    private Long id;

    private Long chatId;                        //ID пользователя
    private Integer stateId;                    //ID state
    private String crypto;
    private String client;
    private Boolean admin;
    private Boolean notified = false;

    public User() {
    }

    public User(Long chatId, Integer state) {
        this.chatId = chatId;
        this.stateId = state;
    }

    public User(Long chatId, Integer stateId, String crypto,String client, Boolean admin) {
        this.chatId = chatId;
        this.stateId = stateId;
        this.admin = admin;
        this.crypto = crypto;
        this.client = client;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getChatId() {
        return chatId;
    }

    public void setChatId(Long chatId) {
        this.chatId = chatId;
    }

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public Boolean getNotified() {
        return notified;
    }

    public void setNotified(Boolean notified) {
        this.notified = notified;
    }

    public String getCrypto() {
        return crypto;
    }

    public void setCrypto(String crypto) {
        this.crypto = crypto;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String crypto) {
        this.client = client;
    }
}
