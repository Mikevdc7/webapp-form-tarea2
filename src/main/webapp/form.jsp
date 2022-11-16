<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario de registro de productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <h1>Formulario de registro de productos</h1>
    <%
    if(errores!=null && errores.size()>0){%>
    <ul class="alert alert-danger mx-5 px-5">
        <%for(String error: errores.values()){%>
        <li><%=error%></li>
        <%}%>
    </ul>
    <%}%>
    <div class="px-5">
        <form action="/webapp-form-tarea2/crear" method="post">
            <div class="row mb-3">
                <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
                <div class="col-sm-4">
                    <input type="text" name="nombre" id="nombre" value="${param.nombre}" class="form-control">
                </div>
            </div>
            <%
            if(errores!=null && errores.containsKey("nombre")){
            %>
            <div style='color: red;' class="row mb-3 alert alert-danger col-sm-4">
                <%out.print(errores.get("nombre"));%>
            </div>
            <%}%>

            <div class="row mb-3">
                <label for="precio" class="col-form-label col-sm-2">Precio</label>
                <div class="col-sm-4">
                    <input type="text" name="precio" id="precio" value="${param.precio}" class="form-control">
                </div>
            </div>
            <%
            if(errores!=null && errores.containsKey("precio")){
            %>
            <div style='color: red;' class="row mb-3 alert alert-danger col-sm-4">
                <%out.print(errores.get("precio"));%>
            </div>
            <%}%>

            <div class="row mb-3">
                <label for="fabricante" class="col-form-label col-sm-2">Fabricante</label>
                <div class="col-sm-4">
                    <input type="text" name="fabricante" id="fabricante" value="${param.fabricante}" class="form-control">
                </div>
            </div>
            <%
            if(errores!=null && errores.containsKey("fabricante")){
            %>
            <div style='color: red;' class="row mb-3 alert alert-danger col-sm-4">
                <%out.print(errores.get("fabricante"));%>
            </div>
            <%}%>

            <div class="row mb-3">
                <label for="categoria" class="col-form-label col-sm-2">Categorías</label>
                <div class="col-sm-4">
                    <select name="categoria" id="categoria" class="form-select">
                        <option value="">-- seleccionar --</option>
                        <option value="1" ${param.categoria.equals("1")? "selected": ""}>Categoría 1</option>
                        <option value="2" ${param.categoria.equals("2")? "selected": ""}>Categoría 2</option>
                        <option value="3" ${param.categoria.equals("3")? "selected": ""}>Categoría 3</option>
                        <option value="4" ${param.categoria.equals("4")? "selected": ""}>Categoría 4</option>
                    </select>
                </div>
            </div>
            <%
            if(errores!=null && errores.containsKey("categoria")){
            %>
            <div style='color: red;' class="row mb-3 alert alert-danger col-sm-4">
                <%out.print(errores.get("categoria"));%>
            </div>
            <%}%>

            <input type="submit" value="Enviar" class="btn btn-primary">
        </form>
    </div>
</body>
</html>