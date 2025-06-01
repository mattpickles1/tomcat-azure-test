<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Azure Tomcat Test Application</title>
</head>
<body>
    <h2>Welcome to Azure Tomcat Test Application</h2>
    <p>Current Time: <%= new java.util.Date() %></p>
    <p>Server Info: <%= request.getServerInfo() %></p>
</body>
</html>
