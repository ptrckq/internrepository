# JBoss Data Grid + Single Sign On + REST API
This tiny app is to test and have an overview about sending and retrieving data in memory with Red Hat JBoss Data Grid (through a WEB REST API), having a security layer (and single sign-on) when accessing webpages with Red Hat Single Sign-On (in this case only /index.jsp).

- Structure:
  It works very simples. It's a person register which we send the person name, age and ID and Data Grid receives the data through Hot Rod (we retrieve through ID only). To write some data you have to use index.jsp page which you need SSO login, but for retrieving it's possible to do it outside.
  

## Prerequisites
- JBoss EAP (on default port)
- JBoss Single Sign-On
- JBoss Data Grid

### Setup 

1 - After cloning the project, deploy /target/rh-maven.war on EAP.
2 - You should now run RH SSO with -Djboss.socket.binding.port-offset=100 and create a realm named "demo", insert a Client named rh pointing to http://localhost:8080/rh/* and it will generate an adapter in installation tab, it looks like this

```
<secure-deployment name="WAR MODULE NAME.war">
    <realm>demo</realm>
    <auth-server-url>http://localhost:8180/auth</auth-server-url>
    <public-client>true</public-client>
    <ssl-required>EXTERNAL</ssl-required>
    <resource>rh</resource>
</secure-deployment>
```

3 - Replace "WAR MODULE NAME.war" with rh.war
4 - Place this secure-deployment in EAP standalone.xml inside keycloack subsystem tag

```
<subsystem xmlns="urn:jboss:domain:keycloak:1.1">
            <secure-deployment name="rh.war">
                <realm>demo</realm>
                <resource>rh</resource>
                <public-client>true</public-client>
                <auth-server-url>http://localhost:8180/auth</auth-server-url>
                <ssl-required>EXTERNAL</ssl-required>
            </secure-deployment>
        </subsystem>
```
5 - No configurations may be needed on Data Grid, you just need to run with port-offset=200 so the app will be able to insert data on memory. 

6 - Use it!
>http://localhost:8080/rh/ 
This link may redirect you to index.jsp so you can post some data using INSERE PRODUTO and after that you can search for it using BUSCA PRODUTO.

7 - 







