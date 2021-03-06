package edu.wisc.httpserver;
import java.io.* ;
import java.net.* ;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.* ;

final class HandleHttpRequest implements Runnable {
    final static String CRLF = "\r\n";
    Socket socket;

	public HandleHttpRequest(Socket socket) throws Exception {
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
    	
    	System.out.println();
    	System.out.println("Parsing HTTP Request...");
    	
    	// Create Stream Reader/Writers
    	BufferedReader inFromClient = 
    			new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
    	DataOutputStream outToClient = 
    			new DataOutputStream(this.socket.getOutputStream());
    	
		// Get the request line of the HTTP request message.    	
    	String currString;
    	ArrayList<String> HTTPStrings = new ArrayList<String>();
    	while(!(currString = inFromClient.readLine()).equals(""))
    	{
    		HTTPStrings.add(currString);	
    	}
    	
    	// Print out the HTTP request
    	System.out.println();
    	System.out.println("---------Received Request---------");
    	for (String s : HTTPStrings)
    	{
    		System.out.println(s);
    	}
    	System.out.println("----------------------------------");

    	
        // Extract the filename from the request line. 
		// Hint: use java  StringTokenizer class; be careful about the file
		// directory.    	
    	String[] requestLine = HTTPStrings.get(0).split("\\s");
    	
    	System.out.println();
    	System.out.println("---------Tokenized Request Line---------");
    	for(String s : requestLine)
    	{
    		System.out.println(s);
    	}
    	System.out.println("----------------------------------------");
    	
    	System.out.println();
    	if (requestLine[0].equals("GET"))
    	{
    		System.out.println("This is a GET request.");
    	}
    	else
    	{
    		System.out.println("ERROR:  This is not a GET request.");
    	}
    	
    	System.out.println();
    	System.out.println("Finished parsing HTTP request.");
    	
    	System.out.println();
    	System.out.println("Formatting HTTP Response...");
    	
    	// Prepare File object for existence check, and path string for 
    	// private contentType method
    	File f = new File(requestLine[1]);
    	String fileName = requestLine[1];
    	BufferedInputStream in =
    			new BufferedInputStream(new FileInputStream(fileName));
    	byte[] buffer = new byte[1024];
    	int count;
    	
		// Open the requested file.
		// Construct the header part of the response message.
        String statusLine = null;
        String contentTypeLine = null;
        String entityBody = "DEBUG MESSAGE: The entityBody variable was not used.";
    	if(f.exists() && !f.isDirectory()) { // Check if request file exists locally
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
    	
    	System.out.println();
    	System.out.println("---------HTTP Response---------");
    	System.out.print(statusLine);
    	System.out.print(contentTypeLine);
    	System.out.println(entityBody);
    	System.out.println("-------------------------------");
    	
    	System.out.println();
    	System.out.println("Finished formatting HTTP response.");
    	
    	System.out.println();
    	System.out.println("Sending HTTP response...");
		 

        // Insert your own code here to:
    	// Send the status line, content type line, and a blank line to
    	// indicate the end of the header lines.  Then, Send the entity body
    	// and close socket.
    	
    	outToClient.writeBytes(statusLine);
    	outToClient.writeBytes(contentTypeLine);
    	outToClient.writeBytes("");
    	if(f.exists() && !f.isDirectory())
    	{
    		while((count = in.read(buffer)) >= 0)
    		{
    			outToClient.write(buffer, 0, count);
    		}
    	}
    	else
    	{
    		outToClient.writeBytes(entityBody);
    	}
    	
    	System.out.println();
    	System.out.println("Finished sending HTTP response.");
    	
    	inFromClient.close();
    	outToClient.close();
    	in.close();
    	socket.close();
    }
    
    private String contentType(String fileName)
    {
    	Path path = Paths.get(fileName);
    	String contentType = null;
		try {
			contentType = Files.probeContentType(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return contentType;
    }
}
