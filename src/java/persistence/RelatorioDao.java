package persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Relatorio;

public class RelatorioDao extends Dao{
    
    public List<Relatorio> consultar(){
        
        List<Relatorio> dados = new ArrayList<Relatorio>();
        
        try{
            abrirConexao();
            stmt = con.prepareStatement("select * from relatorio");
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Relatorio rel = new Relatorio();
                rel.setIdturma(rs.getInt("idturma"));
                rel.setTurma(rs.getString("turma"));
                rel.setProfessor(rs.getString("professor"));
                rel.setEmail(rs.getString("email"));
                rel.setCurso(rs.getString("curso"));
                rel.setDescricao(rs.getString("descricao"));
                
                dados.add(rel);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            fecharConexao();
        }
        return dados;
    }
    
    public ResultSet obterDados(String nome)throws Exception{
        call = con.prepareCall("call obterdados(?)");
        call.setString(1, nome);
        return call.executeQuery();
    }
    
}
