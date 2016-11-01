/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Marco
 */
public class ActaDecomiso implements Serializable,Jsonable{
    private int idDecomiso;
    private Policia policia;
    private Testigo testigo;
    private Lugar lugar;
    private Date fecha;
    private String hora;
    private Interesado interesado;
    private List<Decomiso> decomisos;
    private String observaciones;
    
    
}
