FROM tomcat:9-jdk17

# Optional: remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file and rename it to ROOT.war
COPY ./dist/OPTIMIZING_APP_ALERTS_FOR_A_SUPERIOR_E-COMMERCE_EXPERIENCE.war /usr/local/tomcat/webapps/ROOT.war
