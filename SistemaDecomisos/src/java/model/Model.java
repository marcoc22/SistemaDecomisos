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
                String sql = "select 1 from UsuarioM where UsuarioM.IdUser='" + nick + "' and UsuarioM.contrasena='" + pass + "'";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    user = new Usuario();
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

    public int guardarActaDecomiso(ActaDecomiso acta) throws SQLException {
        Connection con = null;
        int res = 0;
        try {
            con = conexion.dataSource.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String mysql = "exec prc_ins_adecomiso("
                        + "'"+acta.getIdDecomiso()+"',"
                        + "'"+acta.getPolicia().getIdPolicia()+"',"
                        + "'"+acta.getInteresado().get+"',"
                        + "Plugar in number,"
                        + "Pfecha in date,"
                        + "PidAcompanante in varchar2,"
                        + "Pobservaciones in varchar2,"
                        + "Pidtest in number);";

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                pstmt = con.prepareStatement(mysql);
                pstmt.setString(1, p.getCedula());
                pstmt.setInt(2, p.getIdCliente());
                pstmt.setString(3, p.getEmpleado().getCedula());
                pstmt.setString(4, p.getPadre());
                pstmt.setString(5, p.getMadre());
                pstmt.setDate(6, convertFromJAVADateToSQLDate(sdf.parse(p.getFecharc())));
                pstmt.setString(7, p.getFecharc());
                pstmt.setString(8, p.getLugar_nacimiento());
                pstmt.setInt(9, p.getTipo_id());
                pstmt.setInt(10, p.getSexo());
                pstmt.setString(11, p.getNombre());
                pstmt.setString(12, p.getApellido1());
                pstmt.setString(13, p.getApellido2());
                pstmt.setString(14, p.getNombre_padre());
                pstmt.setString(15, p.getNombre_madre());
                pstmt.setString(16, p.getNombre_completo());
                pstmt.setString(17, p.getNacionalidad());
                pstmt.setString(18, p.getFuente());

                pstmt.executeUpdate();
                res = 1;
            }

        } catch (SQLException e) {
            res = 2;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                res = 2;
            }
        }
        return res;
    }
}
