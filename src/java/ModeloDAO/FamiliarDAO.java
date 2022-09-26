/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.familiarVO;
import util.ConexionBd;
import util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author solan
 */
public class FamiliarDAO extends ConexionBd implements Crud {
    
    
    //1. Declarar 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;

    private String id_fami, nom1_fami, nom2_fami, apel1_fami, apel2_fami, parent_fami,numdocu_fami, ocupac_fami, lugatrab_fami,teletrab_fami,telecel_fami, fechnaci_fami, esta_fami;

    //2. Método principal para recibir datos de VO
    public FamiliarDAO(familiarVO famivo) {
        super();
        //conectar a la base de datos

        try {
            conexion = this.obtenerConexion();
            //datos del Vo   
           
            id_fami = famivo.getId_fami();
            nom1_fami = famivo.getNom1_fami();
            nom2_fami = famivo.getNom2_fami();
            apel1_fami = famivo.getApel1_fami();
            apel2_fami = famivo.getApel2_fami();
            parent_fami = famivo.getParent_fami();
            numdocu_fami = famivo.getNumdocu_fami();
            ocupac_fami = famivo.getOcupac_fami();
            lugatrab_fami = famivo.getLugatrab_fami();
            teletrab_fami = famivo.getTeletrab_fami();
            telecel_fami = famivo.getTelecel_fami();
            fechnaci_fami = famivo.getFechnaci_fami();
            esta_fami = famivo.getEsta_fami();

        } catch (Exception e) {
            Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "INSERT INTO familiar( 1NOM_FAMI, 2NOM_FAMI, 1APEL_FAMI, 2APEL_FAMI, PARENT_FAMI, NUMDOCU_FAMI, OCUPAC_FAMI, LUGATRAB_FAMI, TELETRAB_FAMI, TELECEL_FAMI, FECHNACI_FAMI, ESTA_FAMI) VALUES (?,?,?,?,?,?,?,?,?,?,?,? )";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, nom1_fami);
            puente.setString(2, nom2_fami);
            puente.setString(3, apel1_fami);
            puente.setString(4, apel2_fami);
            puente.setString(5, parent_fami);
            puente.setString(6, numdocu_fami);
            puente.setString(7, ocupac_fami);
            puente.setString(8, lugatrab_fami);
            puente.setString(9, teletrab_fami);
            puente.setString(10, telecel_fami);
            puente.setString(11, fechnaci_fami);
            puente.setString(12, esta_fami);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                 this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    @Override
    public boolean actualizarRegistro() {
         try {

            sql = "ATE familiar SET 1NOM_FAMI=?, 2NOM_FAMI=?, "
                    + "1APEL_FAMI=?, 2APEL_FAMI=?, PARENT_FAMI=?, "
                    + "NUMDOCU_FAMI=?, OCUPAC_FAMI=?, LUGATRAB_FAMI=?, "
                    + "TELETRAB_FAMI=?, TELECEL_FAMI=?, FECHNACI_FAMI=?,"
                    + " ESTA_FAMI=? WHERE ID_FAMI=?";
                    
              puente = conexion.prepareStatement(sql);

            puente.setString(1, nom1_fami);
            puente.setString(2, nom2_fami);
            puente.setString(3, apel1_fami);
            puente.setString(4, apel2_fami);
            puente.setString(5, parent_fami);
            puente.setString(6, numdocu_fami);
            puente.setString(7, ocupac_fami);
            puente.setString(8, lugatrab_fami);
            puente.setString(9, teletrab_fami);
            puente.setString(10, telecel_fami);
            puente.setString(11, fechnaci_fami);
            puente.setString(12, esta_fami);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                 this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
        //que muestre todos 
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        //actualizar estado
    }

    
}
