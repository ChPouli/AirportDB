package myPack;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import tuc.eced.cs201.io.*;

public class ConnectWithDatabase {
	StandardInputRead sir= new StandardInputRead();
	Connection conn;
	
	public void menu() {
		while(true) {
			System.out.println("MENU"); 
			System.out.println("1.Connect with the database");
			System.out.println("2.Start transaction");
			System.out.println("3.Abort transaction");
			System.out.println("4.Commit transaction"); 
			System.out.println("5.Find flight by date and destination");
			System.out.println("6.Buy/Reserve ticket for a specific flight");
			System.out.println("7.Print reservations for a specific flight");
			System.out.println("8.Exit program");
	 		int choice = sir.readPositiveInt("Enter choice:");
	    		switch (choice) {
	         	 		case 1: connectDB(); break;
	         	 		case 2: startTr(); break;
	         	 		case 3: abortTr(); break;
	         	 		case 4: commitTr(); break;
	         	 		case 5: 
	         	 			int dest = sir.readPositiveInt("Give destination country: ");
	         	 			String datetime  = sir.readString("Give departure date as yyyy-mm-dd hh:mm:ss: ");

	         	 			findFlightByDateDest(dest, datetime);
	         	 			break;
	         	 		case 6: buy_reserveTicket(); break;
	         	 		case 7: printReservations(); break;
	         	 		case 8: phgeGiaBroubes(); break;
	         	 		default:System.out.println("Wrong choice! Try again");
	    		}
	    	if(choice == 8) return;
		}
	}
	

	private void phgeGiaBroubes() {
		if (conn != null)
        {
            try
            {
                conn.close ();
                System.out.println ("Database connection terminated");
                System.out.println("You chose to exit our application");
        		System.out.println("Your fault!!!");
        		System.out.println("Bye bye");
            }
            catch (Exception e) { System.out.println("SQLException error"+e); }
        }
		else{
			System.out.println("No open connection found");
			System.out.println("You chose to exit our application");
    		System.out.println("Your fault!!!");
    		System.out.println("Bye bye");
		}
		return;	
	}


	private void printReservations() {
		int dep = sir.readPositiveInt("Give the flight departure town code");
		int dest = sir.readPositiveInt("Give the flight destination town code");
		String date  = sir.readString("Give departure date as yyyy-mm-dd: ");
		String time  = sir.readString("Give departure date as hh:mm:ss: ");
		ResultSet rs = null;
		try{
			String command = "{call reservations_by_dest_dep_date_time(?,?,?,?)}";     
		      CallableStatement cstmt = conn.prepareCall (command);
		      cstmt.setInt(1, dest);  
		      cstmt.setInt(2, dep);
		      cstmt.setString(3, date);
		      cstmt.setString(4, time);
		     
		      rs =cstmt.executeQuery();
		      if(!rs.next())
		    	  System.out.println("No matching results!");
		      else
		    	  do{
		    		  int res_id = rs.getInt ("tid");
			    	  int cust_id = rs.getInt ("c_id");
			    	  String fname = rs.getString("fname");
			    	  String lname = rs.getString("lname");
			    	  String phone = rs.getString("phone");
			    	 
			          System.out.println (
			                  "transaction id = " + res_id
			                  + ", customer's id = " + cust_id
			                  + ", customer's first name = " + fname
			                  + ", customer's last name = " + lname
			                  + ", customer's phone = " + phone);
			    	  
			    	  
		    	  }while (rs.next());
		        rs.close();
		        cstmt.close();
		}catch(SQLException e){
			System.out.println("SQLException error "+e);
		}
	}




	private void buy_reserveTicket() {
		
		int cust_id =0;
		String fname = sir.readString("Give customer's first name: ");
		String lname = sir.readString("Give customer's last name: ");
		int age = sir.readPositiveInt("Give the customer's age: ");
		String phone = sir.readString("Give customer's phone: ");
		
		ResultSet rs = null ;
		try{
			String command = "{call find_client(?,?,?,?)}"; 
			CallableStatement cstmt = conn.prepareCall (command);
		    cstmt.setString(1, fname);  
		    cstmt.setString(2, lname);
		    cstmt.setFloat(3, age);
		    cstmt.setString(4, phone);
		    rs =cstmt.executeQuery();
		    
		    
	    	
	    	if(rs.next()) {
	    		System.out.println("Client exists");
	    		cust_id = rs.getInt ("cid");
	    	}
	    	else{
	    		System.out.println("Insert a new client with the above characteristics.");
	    		int sex = sir.readPositiveInt("Give customer's sex: ");
	    		command = "{call insert_customer(?,?,?,?,?)}";     
	    		cstmt = conn.prepareCall (command);
	    		cstmt.setString(1, fname);  
	  	      	cstmt.setString(2, lname);
	  	      	cstmt.setFloat(3, age);
	  	      	cstmt.setInt(4, sex);
	  	      	cstmt.setString(5, phone);
	  	      	rs =cstmt.executeQuery();
	  	      	//commitTr();
	  	      	rs.next();
	  	      	cust_id = rs.getInt("cid");
	    	}
	    	int res =0;
	    	do{
	    		System.out.println("1. Continue with the above inputs");
	    		System.out.println("2. Cancel");
	    		
	    		res = sir.readPositiveInt("Your choise : ");
	    	}while(res < 1 || res >2);
	    	switch(res){
	    	case 1:
	    		commitTr();
	    		int code = sir.readPositiveInt("Give the flight destination: ");
	    		String datetime = sir.readString("Give departure date as yyyy-mm-dd hh:mm:ss: ");
	    		int fcode = findFlightByDateDest(code, datetime);
	    		if(fcode < 0){
	    			System.out.println("No such flight");
	    			return;
	    		}
	    		else{
		    		System.out.println(fcode+""+datetime);
		    		String query ="select fs.fschedule_id as fsid from  flight f, flightschedule fs, flightsprogramm fp\n" +
		    				"where "+fcode+" = fp.flight_code and fp.programm_id = fs.fprogram_id\n" +
		    				"and fs.fdate = date('"+datetime+"') and f.fcode ="+fcode+" and f.dep_time = time('"+datetime+"')" +
		    				"limit 1;";
		    		rs = cstmt.executeQuery(query);
		    		rs.next();
		    		int fs_id = rs.getInt("fsid");
		    		System.out.println(fcode+""+cust_id+""+fs_id);
		    		int tid = sir.readNegativeInt("Give your id: ");
		    		String type = sir.readString("Give the type(tagent/gstaff): ");
		    		String res_bye  = sir.readString("What do you want to do?(reserve/bye ticket): ");
		    		command = "call insertTransaction(?,?,?,?,?)";
		    		cstmt = conn.prepareCall (command);
		    		cstmt.setInt(1, fs_id);  
				    cstmt.setString(2, res_bye);
				    cstmt.setInt(3, cust_id);
				    cstmt.setInt(4, tid);
				    cstmt.setString(5, type);
				    rs =cstmt.executeQuery();
				    
		    		/*in fschedule_id integer,
	in t_action ENUM('bye', 'reserve', 'cancel'), in c_id integer,
	in id integer, in typee varchar(45)*/
	    		}

	    		 
	    		break;
	    	case 2:
	    		abortTr();
	    		System.out.println("Rollback if wrong");
	    		break;
	    	}
	        rs.close();

	      cstmt.close();
		}catch(SQLException e){
			System.out.println("SQLException error"+e);
		}
		
		
	}




	private int findFlightByDateDest(int dest, String datetime){
		int code =0;
		ResultSet rs = null ;
		try{
		String command = "{call get_flight_by_dest_date_time(?,?)}";     
	      CallableStatement cstmt = conn.prepareCall (command);
	      cstmt.setInt(1, dest);  
	      cstmt.setString(2, datetime);
	      
	      rs =cstmt.executeQuery();

	      if(!rs.next())
	    	  System.out.println("No matching results!");
	      else
	    	  do{
	    		  code = rs.getInt ("fcode");
		    	  float price = rs.getFloat ("tamount");
		    	  int fseats = rs.getInt ("free_seats");
		          System.out.println (
		                  "fcode = " + code
		                  + ", tamount = " + price
		                  + ", free_seats = " + fseats);
		    	  
		    	  
	    	  }
	      while (rs.next());
	        rs.close();
	      
	      cstmt.close();
		}catch(SQLException e){
			System.out.println("SQLException error"+e);
		}
		
		if (code>0)return code;
		else return -1;
		
	}
	
	private void commitTr() {
		try {
			conn.commit();
		} catch (SQLException e) {
			System.out.println("SQLException "+e);
			e.printStackTrace();
		}
		
	}
	

	private void abortTr() {
		try {
			conn.rollback();
		} catch (SQLException e) {
			System.out.println("SQLException "+e);
			e.printStackTrace();
		}
		
	}
	

	private void startTr() {
		if(conn==null){
			System.out.println("\nNo connection to a database found");
			System.out.println("Please try first choise '1'\n");
			return;
		}
		try {
			conn.setAutoCommit(false);
		} catch (SQLException ex) {
				System.out.println("Error occured in SQL execution. Errno="+ex.getErrorCode());
				System.out.println("Current transaction is aborted");
				System.out.println("Starting new transaction");
				try {conn.rollback(); }catch (Exception ex2){ex2.printStackTrace();}
			}
		
		System.out.println("Transaction started\n");
			
		
	}




	private void connectDB() {
		
        
		String userName = sir.readString("Enter username: ");
		String password = sir.readString("Enter password: ");
		String database = sir.readString("Enter database name: ");
		
		
		try {
			
            String url = "jdbc:mysql://localhost:3306/"+database;
            Class.forName ("com.mysql.jdbc.Driver").newInstance ();
            conn = DriverManager.getConnection (url, userName, password);
            System.out.println ("Database connection established\n");
			
			
		} catch(Exception e) {
            e.printStackTrace();
       }
		
	}




	public static void main(String[] args) {
		ConnectWithDatabase db = new ConnectWithDatabase();
		db.menu();
	}

	
}
