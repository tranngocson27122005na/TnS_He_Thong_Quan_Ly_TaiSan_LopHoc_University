package dal;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Properties properties = new Properties();
            // Cố gắng load từ classpath (thường là WEB-INF/classes hoặc src)
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("ConnectDB.properties");

            // Nếu không tìm thấy, thử đường dẫn tương đối (tùy cấu hình server)
            if (inputStream == null) {
                inputStream = getClass().getClassLoader().getResourceAsStream("../ConnectDB.properties");
            }

            if (inputStream != null) {
                properties.load(inputStream);
                String user = properties.getProperty("userID");
                String pass = properties.getProperty("password");
                String url = properties.getProperty("url");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(url, user, pass);
                System.out.println("Database Connection Successful!");
            } else {
                System.err.println("Cannot find ConnectDB.properties file!");
            }
        } catch (ClassNotFoundException | SQLException | IOException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Database Connection Failed!", ex);
        }
    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Failed to close connection", ex);
            }
        }
    }
}
