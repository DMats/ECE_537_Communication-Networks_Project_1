package edu.wisc.httpserver;
import java.io.* ;
import java.net.* ;
import java.util.* ;

final class HandleHttpRequest implements Runnable {
    final static String CRLF = "\r\n";
    Socket socket;
    
    // Constructor
    public HttpRequest(Socket socket) throws Exception {
	this.socket = socket;
    }
    
    // Implement the run() method of the Runnable interface.
    public void run() {
	try {
	    processRequest();
	} catch (Exception e) {
	    System.out.println(e);
	}
    }

    private void processRequest() throws Exception {
        // Insert your own code here to:
		// Get the request line of the HTTP request message.
        // Extract the filename from the request line.
		// Hint: use java  StringTokenizer class; becareful about the file
		// directory
	
	

		// Open the requested file.
		// Construct the header part of the response message.
        String statusLine = null;
        String contentTypeLine = null;
        String entityBody = null;
        if (fileExists) { // Check if request file exists locally
	    statusLine = "HTTP/1.0 200 OK" + CRLF;
	    contentTypeLine = "Content-Type: " + 
		contentType(fileName) + CRLF;
        } else {
	    statusLine = "HTTP/1.0 404 Not Found" + CRLF;
	    contentTypeLine = "Content-Type: text/html" + CRLF;
	    entityBody = "<HTML>" + 
		"<HEAD><TITLE>Not Found</TITLE></HEAD>" +
		"<BODY>Not Found</BODY></HTML>";
        }
		 

        // Insert your own code here to:
		// Send the status line, content type line, and a blank line to
		// indicate the end of the header lines.  Then, Send the entity body
		// and close socket.
    }
}
