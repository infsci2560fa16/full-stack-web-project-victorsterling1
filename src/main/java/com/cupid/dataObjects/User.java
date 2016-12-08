package com.cupid.dataObjects;

import org.springframework.data.annotation.Id;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by victorzhao on 11/4/16.
 */
@XmlRootElement(name = "User")
public class User {
    @Id
    private long uid;
    private String firstName;
    private String lastName;
    private int byear;
    private int bmon;
    private int bday;

    private String email;
    private String password;
    private boolean smoke;
    private String note;
    private int flower;
    private String photo;
    private boolean gender;
    private int relationship;

    public User() {
    }

    public User(long uid, String photo, String note) {
        this.uid = uid;
        this.photo = photo;
        this.note = note;
    }

    public User(long uid, int relationship, boolean gender, String photo, int flower, String note, boolean smoke,
                String password, String email, int bday, int bmon, int byear, String lastName, String firstName) {
        this.uid = uid;
        this.relationship = relationship;
        this.gender = gender;
        this.photo = photo;
        this.flower = flower;
        this.note = note;
        this.smoke = smoke;
        this.password = password;
        this.email = email;
        this.bday = bday;
        this.bmon = bmon;
        this.byear = byear;
        this.lastName = lastName;
        this.firstName = firstName;
    }

    public int getRelationship() {
        return relationship;
    }

    public void setRelationship(int relationship) {
        this.relationship = relationship;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getFlower() {
        return flower;
    }

    public void setFlower(int flower) {
        this.flower = flower;
    }

    public boolean isSmoke() {
        return smoke;
    }

    public void setSmoke(boolean smoke) {
        this.smoke = smoke;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBday() {
        return bday;
    }

    public void setBday(int bday) {
        this.bday = bday;
    }

    public int getBmon() {
        return bmon;
    }

    public void setBmon(int bmon) {
        this.bmon = bmon;
    }

    public int getByear() {
        return byear;
    }

    public void setByear(int byear) {
        this.byear = byear;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }
}
