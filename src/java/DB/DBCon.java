
package DB;
import java.sql.*;

public class DBCon {
 public Connection con;
 public Statement stmt;//qustion mark ki jagah value
 public PreparedStatement pstmt;// question mak dene ke liye
 public ResultSet rst;//contain result rst object of resultset
 public DBCon(){
     try{
    Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3307/library_db","root","root");
}
         catch(Exception e){
            e.printStackTrace();
        }
  }

    public void close() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}