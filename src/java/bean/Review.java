/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.Date;

public class Review 
{
    private int revid;
    private int revusr;
    private String revtext;
    private String revusrname;
    private int recid;
    private Date postdate;
    boolean visible;

    public Date getPostdate() {
        return postdate;
    }

    public String getRevusrname() {
        return revusrname;
    }

    public void setRevusrname(String revusrname) {
        this.revusrname = revusrname;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }

    

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }
    
    

    public int getRevid() {
        return revid;
    }

    public void setRevid(int revid) {
        this.revid = revid;
    }

    public int getRevusr() {
        return revusr;
    }

    public void setRevusr(int revusr) {
        this.revusr = revusr;
    }

    public String getRevtext() {
        return revtext;
    }

    public void setRevtext(String revtext) {
        this.revtext = revtext;
    }

    public int getRecid() {
        return recid;
    }

    public void setRecid(int recid) {
        this.recid = recid;
    }
    
    
    
}
