<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ include file = "include/header.jsp" %>

    <%  String besked = (String) request.getAttribute("message");
        String status = (String) request.getAttribute("status");
        if (besked != null && status != null) {
            String alert = "";
            if (status.equals("ok")) {
                alert = "<div class=\"alert alert-success\">_message_</div>";
            } else {
                alert = "<div class=\"alert alert-danger\">_message_</div>";
            }
            alert = alert.replace("_message_", besked);
            out.println(alert);
        }
    %>

    <div class="jumbotron">
        <h1>Velkommen ombord</h1>
        <h4>Øens bedste cupcakes. Vælg og bestil her:</h4>

        <form action="/FrontController" method="post">
            <input type="hidden" name="source" value="addtocart"/>

            <div id="cupcakeselectionbox" class="row">

                <div class="col-sm-3 dropdown_box">
                    <select name="bottom" class="form-control">
                        <option selected disabled>Vælg bund</option>
                        <option value="1">Chocolate</option>
                        <option value="2">Vanilla</option>
                        <option value="3">Nutmeg</option>
                        <option value="4">Pistacio</option>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <select name="top" class="form-control">
                        <option selected disabled>Vælg top</option>
                        <option value="1">Chocolate</option>
                        <option value="2">Blueberry</option>
                        <option value="3">Rasberry</option>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <select name="number" class="form-control">
                        <option selected disabled>Vælg antal</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <input type="submit" name="selectcupcake" value="Læg i kurv" class="btn btn-success form-control"/>
                </div>

            </div>

        </form>

    </div>

<%@ include file = "include/footer.jsp" %>

