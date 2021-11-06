/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.portapp.model.dock.dao;

import com.portapp.model.dock.dto.Dock;
import com.portapp.model.dock.dto.DockStatus;
import java.util.List;

/**
 *
 * @author 1985j
 */
public interface DockDAO {

    public Dock findById(Long id);
    
    public Dock save(Dock dock);
    
    public List<Dock> findAll();
    
    public List<Dock> findDockByPortId(Long id);
    
    public List<Dock> findDockByDockStatus(DockStatus status);
    
    public void deleteById(long id);

    public void delete(Dock dock);

    public void deleteAll();

    public List<Dock> findByName(String dockName);
    
    public Dock findByUuid(String uuid);
    
    
}
