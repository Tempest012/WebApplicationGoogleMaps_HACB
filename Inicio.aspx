<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplicationGoogleMaps_HACB.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google mapa picker</title>
    <!-- Bootstrap y jQuery -->
     <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <!-- Complemento del plunin -->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyBg8g8zcX5yG2KCtULlw-4eQ-lXd-WEBeI'></script>
    <script src="js/locationpicker.jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Crear el boton -->
            <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default">
                <span class="glyphicon glyphicon-map-marker"></span><span id="ubicacion">Seleccionar ubicacion</span>
            </button>
            <!-- Proviente del js -->
            <style>
                .pac-container{
                    z-index:99999;
                }
            </style>
            <!-- Creacion del modal -->
            <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Ubicacion:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <!-- ahora agregamos un boton para cerrar el modal -->
                                    <div class="col-sm-1">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="cerrar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div id="ModalMapPreview" style="width:100%; height:400px;"></div>
                                <div class="clearfix">&nbsp;</div>
                                <!-- Hacer uso de script para agregar mapa al modal --> 
                                <script>
                                    $('#ModalMapPreview').locationpicker({
                                        radius: 0,
                                        location: {
                                            latitude: 27.365938954017043,
                                            longitude: -109.93136356074504
                                        },
                                        enableAutocomplete: true,
                                        inputBinding:{
                                            locationNameInput: $('#<%=ModalMapaddress.ClientID%>')
                                        }
                                    });
                                    $('ModalMap').on('show.bs.modal', function () {
                                        $('#ModalMapPreview').locationpicker('autosize');
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
