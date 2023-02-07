
package com.test.dao;

import com.test.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author bhalc
 */
public class UserDao {
    
    private SessionFactory factory;

    /**
     *
     * @param factory
     */
    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // getting user by email and password

    /**
     *
     * @param email
     * @param password
     * @return
     */
    
    public User getUserByEmailAndPassword(String email, String password){
        
        User user = null;
        
        try{
          
            String query = "from User where userEmail =: e and userPassword=: p";
            
            Session session = this.factory.openSession();
            
           Query q =  session.createQuery(query);
           
           q.setParameter("e", email);
           q.setParameter("p", password);
           
           user=(User) q.uniqueResult();
           
           session.close();
            
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        return user;
    }
}
