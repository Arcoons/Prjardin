/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;
import ModeloVO.AcudienteVO2;
import util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;
/**
 *
 * @author chris
 */
public class AcudienteDAO2 extends ConexionBd implements Crud{
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    //variables para las opereaciones
    private boolean operacion = false;
    private String sql;
    private String ID_ACUD="", ID_ALUM="", NOM_ACUD1="", NOM_ACUD2="", APEL_ACUD1="", APEL_ACUD2="",
            NUMDOCU_ACUD="", TELE_ACUD="", DIREC_ACUD="", PARENT_ACUD="", ESTADOAUTO_ACUD="",
            FECHNACI_ACUD="", ESTA_ACUD="";

    public AcudienteDAO2() {
    }
    public AcudienteDAO2(AcudienteVO2 AcuVO2){
    super ();
    try{
        conexion = this.obtenerConexion();
        ID_ACUD = AcuVO2.getID_ACUD();
        ID_ALUM = AcuVO2.getID_ALUM();
        NOM_ACUD1 = AcuVO2.getNOM_ACUD1();
        NOM_ACUD2 = AcuVO2.getNOM_ACUD2();
        APEL_ACUD1 = AcuVO2.getAPEL_ACUD1();
        APEL_ACUD2 = AcuVO2.getAPEL_ACUD2();
        NUMDOCU_ACUD = AcuVO2.getNUMDOCU_ACID();
        TELE_ACUD = AcuVO2.getTELE_ACUD();
        DIREC_ACUD = AcuVO2.getDIREC_ACUD();
        ESTADOAUTO_ACUD = AcuVO2.getESTADOAUTO_ACUD();
        FECHNACI_ACUD = AcuVO2.getFECHNACI_ACUD();
        ESTA_ACUD = AcuVO2.getESTA_ACUD();
        
    } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
        public AcudienteVO2 consultarAcudientes(String alum_id) {    
           AcudienteVO2 AcuVO2 = null;
           try {
               conexion = this.obtenerConexion();
               sql = "SELECT acu.ID_ACUD, concat(alu.1NOM_ALUM, ' ',alu.1APEL_ALUM)"
                       + "AS niño, acu.1NOM_ACUD, acu.2NOM_ACUD, acu.1APEL_ACUD, "
                       + "acu.2APEL_ACUD, acu.NUMDOCU_ACUD, acu.TELE_ACUD, acu.DIREC_ACUD, "
                       + "acu.ESTADOAUTO_ACUD, acu.FECHNACI_ACUD, acu.ESTA_ACUD FROM acudientes "
                       + "AS acu INNER JOIN alumno AS alu ON acu.ID_ALUM = alu.ID_ALUM WHERE alu.ID_ALUM=?;";
               puente = conexion.prepareStatement(sql);
               puente.setString(1, alum_id);
               mensajero = puente.executeQuery();
               while (mensajero.next()) {

                   AcuVO2 = new AcudienteVO2(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), 
                           mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), 
                           mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), 
                           mensajero.getString(11),mensajero.getString(12));
               }

           } catch (SQLException e) {
               Logger.getLogger(AcudienteDAO2.class.getName()).log(Level.SEVERE, null, e);
           } finally {
               try {
                   this.deneterConexion();
               } catch (SQLException e) {
                   Logger.getLogger(AcudienteDAO2.class.getName()).log(Level.SEVERE, null, e);
               }
           }
           return AcuVO2;
       }
      public ArrayList<AcudienteVO2> lista() {
        ArrayList<AcudienteVO2> lista = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM acudientes AS acu INNER JOIN alumno AS alu ON acu.ID_ALUM = alu.ID_ALUM WHERE alu.ID_ALUM=?;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                AcudienteVO2 acuVO = new AcudienteVO2(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), 
                           mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), 
                           mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), 
                           mensajero.getString(11),mensajero.getString(12));
                lista.add(acuVO);

            }

        } catch (SQLException e) {
            Logger.getLogger(AcudienteDAO2.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(AcudienteDAO2.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return lista;
      }
      

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
