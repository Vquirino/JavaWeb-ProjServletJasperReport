package persistence;

import java.sql.*;

public class Dao {
    
    protected Connection con;
    protected PreparedStatement stmt;
    protected CallableStatement call;
    protected ResultSet rs;
    
    public void abrirConexao()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/aula", "root", "quirino");
    }
    
    public void fecharConexao(){
        try{
            if (con != null)
                con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
