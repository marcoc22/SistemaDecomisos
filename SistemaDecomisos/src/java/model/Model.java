/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Marco
 */
public class Model {

    

    public Model() {
       
    }

    

    //------------USUARIO----------------
    public Usuario login(String nick, String pass) {
        Connection con = null;
        Usuario user = null;
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {
                String sql = "select 1 from UsuarioM where UsuarioM.IdUser='"+nick+"' and UsuarioM.contrasena='"+pass+"'";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    user=new Usuario();
                    user.setNick(nick);
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            user = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                user = null;
            }
        }
        return user;
    }
}
