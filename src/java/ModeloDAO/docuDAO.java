/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.docuVO;
import util.ConexionBd;
import util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author solan
 */
public class docuDAO extends ConexionBd implements Crud {
    //1. Declarar 

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;

    private String id_alum = "", tipo_docu = "", fechcreac_docu = "", archivo_docu = "";

    //2. Método principal para recibir datos de VO
    public docuDAO(docuVO docuvo) {
        super();
        //conectar a la base de datos

        try {
            conexion = this.obtenerConexion();

            id_alum = docuvo.getId_alum();
            tipo_docu = docuvo.getTipo_docu();
            fechcreac_docu = docuvo.getFechcreac_docu();
            archivo_docu = docuvo.getArchivo_docu();

        } catch (Exception e) {
            Logger.getLogger(AlumnoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {

        try {

            sql = "INSERT INTO documentos (ID_ALUM, TIPO_DOCU, ARCHIVO_DOCU) VALUES (?,?,?)";

            puente = conexion.prepareStatement(sql);

            puente.setString(1, id_alum);
            puente.setString(2, tipo_docu);
            puente.setString(3, archivo_docu);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    public boolean actualizarRegistro(String alumnid, String docu_tipo) {

        try {

            sql = "UPDATE documentos SET FECHCREAC_DOCU=CURRENT_TIMESTAMP, ARCHIVO_DOCU=? WHERE ID_ALUM=?";

            puente = conexion.prepareStatement(sql);

            puente.setString(1, alumnid);
            puente.setString(2, docu_tipo);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    public docuVO consultarDocu(String id_alum) {

        docuVO doVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "SELECT * FROM documentos WHERE ID_ALUM=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_alum);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                doVO = new docuVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }

        } catch (SQLException e) {
            Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(docuDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return doVO;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
