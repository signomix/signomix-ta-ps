package com.signomix.ps;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.BadRequestException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.jboss.logging.Logger;

@ApplicationScoped
@Path("/api/ps")
public class ServiceResource {

    @Inject
    Logger logger;

    @ConfigProperty(name = "signomix.statuspage.url", defaultValue = "")
    String statusPageUrl;

    @ConfigProperty(name = "signomix.release", defaultValue = "")
    String releaseNumber;

    @GET
    @Path("/health")
    @Produces(MediaType.TEXT_PLAIN)
    public String getHealthStatus() {
        return "OK";
    }

    @GET
    @Path("/config")
    @Produces(MediaType.TEXT_PLAIN)
    public String getConfigParam(@QueryParam("param") String paramName) {
        if(null==paramName){
            logger.warn("null param");
            throw new BadRequestException("null param");
        }
        switch (paramName.toLowerCase()) {
            case "java_version":
                return System.getProperty("java.version");
            case "statuspage_url":
                return statusPageUrl;
            case "release":
                return releaseNumber;
            default:
                throw new BadRequestException();
        }
    }

}