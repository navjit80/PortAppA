/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.portapp.model.port.service;

import com.portapp.model.port.dto.Port;
import java.util.List;

/**
 *
 * @author 1985j
 */
public interface PortService {
    public Port findById(Long id);
    
    public Port save(Port port);
    
    public List<Port> findAll();
    
    public void deleteById(long id);

    public void delete(Port port);

    public void deleteAll();

    public List<Port> findByName(String portName);
    
    public Port findByUuid(String uuid);
    
}
