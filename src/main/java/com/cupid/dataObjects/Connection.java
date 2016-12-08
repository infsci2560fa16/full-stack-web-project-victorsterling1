package com.cupid.dataObjects;

import org.springframework.data.annotation.Id;

/**
 * Created by victorzhao on 12/7/16.
 */
public class Connection {
    @Id
    private long cid;

    private int ufrom;
    private int uto;

    public Connection(){}

    public long getCid() {
        return cid;
    }

    public void setCid(long cid) {
        this.cid = cid;
    }

    public int getUfrom() {
        return ufrom;
    }

    public void setUfrom(int ufrom) {
        this.ufrom = ufrom;
    }

    public int getUto() {
        return uto;
    }

    public void setUto(int uto) {
        this.uto = uto;
    }
}
