/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Marco
 */
public class Interesado extends Persona implements Serializable, Jsonable{
    private Date fechaNacimiento;
    private Lugar domicilio;
}
