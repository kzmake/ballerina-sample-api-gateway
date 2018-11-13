import ballerina/http;
import ballerina/io;

endpoint http:Listener listener {
    port:4000
};

@http:ServiceConfig { basePath: "/" }
service<http:Service> default bind listener {

    @http:ResourceConfig { methods: ["GET"], path: "/" }
    get (endpoint caller, http:Request request) {

        http:Response response = new;
        response.setTextPayload("Hello, world!");

        _ = caller -> respond(response);
    }
}

@http:ServiceConfig { basePath: "/", host: "localhost" }
service<http:Service> localhost bind listener {

    @http:ResourceConfig { methods: ["GET"], path: "/" }
    get (endpoint caller, http:Request request) {

        http:Response response = new;
        response.setTextPayload("Hello, localhost!");

        _ = caller -> respond(response);
    }
}

@http:ServiceConfig { basePath: "/", host: "example.com" }
service<http:Service> example_com bind listener {

    @http:ResourceConfig { methods: ["GET"], path: "/" }
    get (endpoint caller, http:Request request) {

        http:Response response = new;
        response.setTextPayload("Hello, example.com!");

        _ = caller -> respond(response);
    }
}
