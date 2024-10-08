<%-- 
    Document   : index
    Created on : 6/10/2024, 12:05:58 p. m.
    Author     : Juanjo SR
--%>
<%@page import="modelo.Puesto"%>
<%@page import="modelo.Empleado"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>FORMULARIO EMPLEADOS</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()" >NUEVO</button>
        <div class="container">
            <div class="modal fade" id="modal_empleado" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">FORMULARIO EMPLEADO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="sr_empleado" method="post" class="form-group">
                <label for="lbl_id">ID:</label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                
                <label for="lbl_codigo">CODIGO:</label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                
                <label for="lbl_nombres">NOMBRES:</label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: NOMBRE APELLIDO" required>
                
                <label for="lbl_apellidos">APELLIDOS:</label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: APELLIDO 1 APELLIDO 2" required>
                
                <label for="lbl_direccion">DIRECCCION:</label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: CASA CALLE ZONA CIUDAD" required>
                
                <label for="lbl_telefono">TELEFONO:</label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 55555555" required>
                
                <label for="lbl_fnacimiento">FECHA DE NACIMIENTO:</label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ejemplo: yyyy-mm-dd" required>
                
                <label for="lbl_puesto">PUESTO:</label>
                <br>
                <select name="drop_puesto" id="drop_puesto" class="form_control">
                    <%
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_sangre();
                        for(String i:drop.keySet()){
                            out.println("<option value='"+ i +"'>" + drop.get(i) +"</option>");
                        }
                    %>
                </select>
                <br>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-success">AGREGAR</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-primary">MODIFICAR</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false" >ELIMINAR</button>
                
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CERRAR</button>
        
      </div>
    </div>
  </div>
</div>
            
                <br>
                <table class="table table-dark">
                    <thead>
                      <tr>
                        <th>CODIGO</th>
                        <th>NOMBRES</th>
                        <th>APELLIDOS</th>
                        <th>DIRECCION</th>
                        <th>TELEFONO</th>
                        <th>NACIMIENTO</th>
                        <th>PUESTO</th>
                      </tr>
                    </thead>
                    <tbody id="tbl_empleados">
                        <%
                            Empleado empleado = new Empleado();
                            DefaultTableModel tabla = new DefaultTableModel();
                            tabla = empleado.mostrar();
                            for(int t = 0;t < tabla.getRowCount();t++){
                                out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 8) + ">");
                                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                                out.println("</tr>");
                            }
                            
                        %>
                    </tbody>
                  </table>
        </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
            <script type="text/javascript">
                function limpiar(){
                  $("#txt_id").val(0);
                  $("#txt_codigo").val('');
                  $("#txt_nombres").val('');
                  $("#txt_apellidos").val('');
                  $("#txt_direccion").val('');
                  $("#txt_telefono").val('');
                  $("#txt_fn").val('');
                  $("#drop_puesto").val(1);
                }
                $('#tbl_empleados').on('click','tr td',function(evt){
                  var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
                  target = $(event.target);
                  id = target.parent().data('id');
                  id_p = target.parent().data('id_p');
                  codigo = target.parent("tr").find("td").eq(0).html();
                  nombres = target.parent("tr").find("td").eq(1).html();
                  apellidos = target.parent("tr").find("td").eq(2).html();
                  direccion = target.parent("tr").find("td").eq(3).html();
                  telefono = target.parent("tr").find("td").eq(4).html();
                  nacimiento = target.parent("tr").find("td").eq(5).html();
                                  
                  $("#txt_id").val(id);
                  $("#txt_codigo").val(codigo);
                  $("#txt_nombres").val(nombres);
                  $("#txt_apellidos").val(apellidos);
                  $("#txt_direccion").val(direccion);
                  $("#txt_telefono").val(telefono);
                  $("#txt_fn").val(nacimiento);
                  $("#drop_puesto").val(id_p);
                  $("#modal_empleado").modal('show');
                });
            </script>    
    </body>
</html>
