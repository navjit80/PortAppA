/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.portapp.model.port.dto;

import com.portapp.model.dock.dto.Dock;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author 1985j
 */
public class Port {

    private Long id;
    
    private String uuid = Long.toHexString(new Date().getTime());
    
    private String href = null;
    
    private String name;
    
    //TODO: Change to a Location type
    private String location;
    
    //TODO: Change to a Docks type
    private List<Dock> docks;
    
    //TODO: Do we need a port status dock status makes sence but not port?
    //if we do then Change to a type of ststus
    private String status;
    
    private Boolean enabled = true;

    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Dock> getDocks() {
        return docks;
    }

    public void setDocks(List<Dock> docks) {
        this.docks = docks;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
        
    // uuid is unique for identity
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Port other = (Port) obj;
        if (!Objects.equals(this.uuid, other.uuid)) {
            return false;
        }
        return true;

    }
}