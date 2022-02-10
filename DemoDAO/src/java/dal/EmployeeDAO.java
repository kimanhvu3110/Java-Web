/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;



/**
 *
 * @author black
 */
public class EmployeeDAO extends DBContext{
    public ArrayList<Employee> getAllEmployeesByDeptId(int deptID)
    {
        ArrayList<Employee> list = new ArrayList<>();
        try{
            String sql = "Select e.*, d.name[departmentname] from Employee e, Department d where e.department "
                    + "= d.ID and e.department = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, deptID);
            ResultSet rs = stm.executeQuery();           
            while (rs.next())
            {
                Employee e = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDate("dob").toLocalDate(),
                        rs.getString("sex"),
                        rs.getString("position"));
                e.addDepartment(rs.getInt("department"), rs.getString("departmentname"));
                list.add(e);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Employee getEmployeeById(int id)
    {       
        try{
            String sql = "Select id, name, dob, sex, position, department from Employee where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id );
            ResultSet rs = stm.executeQuery();     
            while (rs.next())
            {
              return new Employee(  
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3).toLocalDate(),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
              );                                                                          
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void addEmployee(Employee e){
        try{
            String sql = "insert into Employee(name, Dob, sex, position, department)"
                    + "values (?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(stm);
            stm.setString(1, e.getName());
            stm.setString(3, e.getSex());
            stm.setDate(2, Date.valueOf(e.getDob()));
            stm.setString(4, e.getPosition());
            stm.setInt(5, e.getDepartment().getId());
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
    
    public void editEmployee(Employee e){
        try{
            String sql = "update employee \n"
                    + "set name = ?, dob = ?, sex = ?, position = ?, department = ?"
                    + " where id = ?";        
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(stm);
            stm.setInt(6, e.getId()); 
            stm.setString(1, e.getName());         
            stm.setString(3, e.getSex());    
            stm.setDate(2, Date.valueOf(e.getDob()));        
            stm.setString(4, e.getPosition());             
            stm.setInt(5, e.getDepartment().getId());
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
    
    public void deleteEmployee(int id){
        try{
            String sql = "delete from employee \n"                   
                    + " where id = ?";        
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(stm);
            stm.setInt(1,id);
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }
    
    public ArrayList<String> getAllPosition(){
        ArrayList<String> list = new ArrayList<>();
        try{
            String sql = "select distinct position from employee";
            PreparedStatement stm = connection.prepareStatement(sql);       
            ResultSet rs = stm.executeQuery();           
            while (rs.next())
            {
                String e = rs.getString(1);
                list.add(e);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Employee> filterEmployee(String sex, String dobf, String dobt, String name, String position, int deptID){
        ArrayList<Employee> list = new ArrayList<>();
        String end = ""; int dem = 0;
            if(name.equals("")==false){               
                end = " and e.name like '%" + name +"%'";
                dem++;
            }
                
            if(sex.equals("All")){
                    end = end + "";
                }
            else{              
                end = end + " and sex = ? ";                 
                dem++;
            }            
            
            if(dobf.equals("")==false){               
                end = end + " and dob > ? ";                
                dem++;
            }
            if(dobt.equals("")==false){               
                end = end + " and dob < ? ";               
                dem++;
            }            
            if(position.equals("All")){
                    end = end + "";
             }
            else{              
                end = end + " and position = ? ";                 
                dem++;            
            }
            if(deptID == 0){
                end = end + "";
            }else{
                end = end + " and e.department = ? ";
            }
            System.out.println(end);
            int demt = dem-1;
        try{
                       
            String sql = "Select e.*, d.name[departmentname] from Employee e, Department d "                   
                    + " where e.department = d.ID " + end;        
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(stm);
            
                if(sex.equals("All")){                    
                }else{
                stm.setString(dem-demt,sex);
                demt--;
                }
            
            if(dobf.equals("")==false) {
                stm.setString(dem-demt,dobf);
                demt--;
            }
            if(dobt.equals("")==false) {
                stm.setString(dem-demt,dobt);
                demt--;
            }
            
                if(position.equals("All")){                    
                }else{
                stm.setString(dem-demt,position);
                demt--;
            }     
            
           if(deptID == 0){                    
                }else{
                stm.setInt(dem-demt,deptID);
                demt--;
            } 
           
            ResultSet rs = stm.executeQuery();                     
            while (rs.next())
            {
                Employee e = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDate("dob").toLocalDate(),
                        rs.getString("sex"),
                        rs.getString("position"));
                e.addDepartment(rs.getInt("department"), rs.getString("departmentname"));
                list.add(e);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return list;
    }
    
}
