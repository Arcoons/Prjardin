/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.MatriculaVO;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;
import util.Crud;

/**
 *
 * @author Minguihobi
 */
public class MatriculaDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;

    private String idMatr = "", idAlum = "", idUsua = "", regiMatr = "", fechMatr = "", estaMatr = "";

    public MatriculaDAO() {
    }

    public MatriculaDAO(MatriculaVO matVo) {

        super();
        try {

            conexion = this.obtenerConexion();

            idMatr = matVo.getIdMatr();
            idAlum = matVo.getIdAlum();
            idUsua = matVo.getIdUsua();
            regiMatr = matVo.getRegiMatr();
            fechMatr = matVo.getFechMatr();
            estaMatr = matVo.getEstaMatr();

        } catch (Exception e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    
    
    public MatriculaVO ModificarEstado(String idUsua, String idMatr) {
        MatriculaVO matVO = null;
        
        try {
            sql = "update matricula set FECH_MATR=CURRENT_TIMESTAMP,ID_USUA=?, estado_matr='inactivo' where id_matr=?";

            puente = conexion.prepareStatement(sql);

          
            puente.setString(1, idUsua);
            puente.setString(2, idMatr);
           

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
            
        return matVO;
    }
    
    
    public MatriculaVO ModificarEstadoActivo( String idUsua, String idMatr) {
        MatriculaVO matVO = null;
        
        try {
            sql = "update matricula set FECH_MATR=CURRENT_TIMESTAMP,ID_USUA=?, estado_matr='activo' where id_matr=?";

            puente = conexion.prepareStatement(sql);

            puente.setString(1, idUsua);
            puente.setString(2, idMatr);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
            
        return matVO;
    }


    public MatriculaVO ConsultarMatricula(String regiMatr) {
        MatriculaVO matVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from matricula where regis_matr=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, regiMatr);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                matVO = new MatriculaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }

        } catch (SQLException e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return matVO;
    }

    /*public ArrayList<MatriculaVO> listar() {

        ArrayList<MatriculaVO> listaMatr = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "SELECT matricula.ID_MATR, concat(usuario.1NOM_USUA,' ',usuario.2NOM_USUA) as director, \n"
                    + "concat(alumno.1NOM_ALUM,' ',alumno.2NOM_ALUM) as alum, matricula.REGIS_MATR, matricula.FECH_MATR, matricula.ESTADO_MATR \n"
                    + "FROM matricula INNER JOIN usuario on matricula.ID_USUA = usuario.ID_USUA \n"
                    + "JOIN alumno on matricula.ID_ALUM = alumno.ID_ALUM WHERE ESTADO_MATR=\"activo\";";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                MatriculaVO matVO = new MatriculaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
                listaMatr.add(matVO);
            }
        } catch (SQLException e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaMatr;
    }*/

    public ArrayList<MatriculaVO> listarEst() {

        ArrayList<MatriculaVO> listaMatrEst = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "SELECT matricula.ID_MATR, concat(usuario.1NOM_USUA,' ',usuario.1APEL_USUA) as director, "
                    + "concat(alumno.1NOM_ALUM,' ',alumno.1APEL_ALUM) as alum, matricula.REGIS_MATR, matricula.FECH_MATR, "
                    + "matricula.ESTADO_MATR FROM matricula INNER JOIN usuario on matricula.ID_USUA = usuario.ID_USUA JOIN "
                    + "alumno on matricula.ID_ALUM = alumno.ID_ALUM ";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                MatriculaVO matVO = new MatriculaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
                listaMatrEst.add(matVO);
            }
        } catch (SQLException e) {
            Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MatriculaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaMatrEst;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
