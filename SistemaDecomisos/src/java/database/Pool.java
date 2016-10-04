/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;

/**
 *
 * @author Marco
 */
public class Pool {
    
    public DataSource dataSource;
    public String db="decomisos";
    public String url = "jdbc:mysql://localhost:3306/"+db;
    public String user="user";
    public String pw="user";
    
    public Pool(){
        initDataSource();
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }
    
    private void initDataSource(){
        BasicDataSource basicDataSource=new BasicDataSource();
        basicDataSource.setDriverClassName("org.gjt.mm.mysql.Driver");
        basicDataSource.setUsername(user);
        basicDataSource.setPassword(pw);
        basicDataSource.setUrl(url);
        basicDataSource.setMaxActive(25000);
        dataSource=basicDataSource;
    }
}
