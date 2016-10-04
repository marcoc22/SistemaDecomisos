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

    private Pool conexion;

    public Model() {
        try {
            conexion = new Pool();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Connection getConexion() throws SQLException {
        return conexion.dataSource.getConnection();
    }

    //------------USUARIO----------------
    public Usuario login(String nick, String pass) {
        Connection con = null;
        Usuario user = null;
        try {
            con = getConexion();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {
                String sql = "exec prclogin()";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    //cargar datos del user
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
