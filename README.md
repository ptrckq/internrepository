# JBoss Data Grid + Single Sign On + REST API

## Overview
This tiny app is to test and have an overview about sending and retrieving data in memory with Red Hat JBoss Data Grid (through a WEB REST API), having a security layer (and single sign-on) when accessing webpages with Red Hat Single Sign-On (in this case only /index.jsp).
 

# Standalone Deployment

- Structure:
  Project source code is in src/main/java. 
  * Model: Produto.java
  * Webservice: AplicacaoRest.java & RestMetodos.java


### Requirements
- JBoss EAP (on default port)
- JBoss Single Sign-On
- JBoss Data Grid

### Setup and Deploy

1. Deploy project on EAP. (Mine is not working if I run the project directly so everytime I need run a maven install is necessary to generate .war, you can do this also if needed)

2. You should now run RH SSO with -Djboss.socket.binding.port-offset=100 and create a realm named "demo", insert a Client named rh pointing to http://localhost:8080/rh/* and it will generate an adapter in installation tab, it looks like this

```
<secure-deployment name="WAR MODULE NAME.war">
    <realm>demo</realm>
    <auth-server-url>http://localhost:8180/auth</auth-server-url>
    <public-client>true</public-client>
    <ssl-required>EXTERNAL</ssl-required>
    <resource>rh</resource>
</secure-deployment>
```

3. Replace "WAR MODULE NAME.war" with rh.war

4. Place this secure-deployment in EAP standalone.xml inside keycloack subsystem tag

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
5. No configurations may be needed on Data Grid, you just need to run with port-offset=200 so the app will be able to insert data on memory. 

6. Use it!
>http://localhost:8080/rh/ 
This link may redirect you to index.jsp so you can post some data using INSERE PRODUTO and after that you can search for it using BUSCA PRODUTO.

7. Or you can use http://localhost:8080/rh/ws/loja/produto/recupera?cod={cod} which is a GET Request for retrieving data from memory.







