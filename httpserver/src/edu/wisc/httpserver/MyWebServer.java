package edu.wisc.httpserver;
import java.io.* ;
import java.net.* ;
import java.util.* ;

public final class MyWebServer {
    public static void main(String argv[]) throws Exception {
		// Pick a port number 
		int port = 9477;
		
	    // Insert your code here to:
		// Establish the listen socket, defined as an object "socket"
		ServerSocket socket = new ServerSocket(port);
		System.out.println("Server started; listening at " + port);
		
		// Process HTTP service requests in an infinite loop.
		while (true) {
	        // Insert your code here to:
		    // Listen for a TCP connection request and establish a connection socket
	        // called "connection"
			Socket connection = socket.accept();
			System.out.println("Accepted connection from " + socket);
		    
		    // Construct an object to process the HTTP request message.
		    HandleHttpRequest request = new HandleHttpRequest(connection);
		    
		    // Create a new thread to process the request.
		    Thread thread = new Thread(request);
		    
		    // Start the thread.
		    thread.start();
		}
    }
}
