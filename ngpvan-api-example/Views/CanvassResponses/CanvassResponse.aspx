<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.CanvassResponseView>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Post Canvass Response</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <% using (Html.BeginForm("PostCanvassResponse", "People"))
       { %>  
        <fieldset>
            <legend>Canvass Response</legend>
    
            <p>
                <%= Html.Label("VAN Id", new { @class="editor-label"}) %> <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>  

                <%= Html.Label("Input type", new { @class="editor-label"}) %> <%= Html.DropDownList("inputTypeId", Model.InputTypes, new {@class = "editor-field"}) %> <br/>
                
                <%= Html.Label("Contact type", new { @class="editor-label"}) %> <%= Html.DropDownList("contactTypeId", new List<SelectListItem>(), new {@class = "editor-field"}) %> <br/>
                
                <%= Html.Label("Result code", new { @class="editor-label"}) %> <%= Html.DropDownList("resultCodeId", new List<SelectListItem>(), new {@class = "editor-field"}) %> <br/>
            </p>
            
            <input type="submit" value="Post" />
        </fieldset>
    <% } %>
    
    <div>
        <%: Html.ActionLink("Back to Person", "Detail", "People", new { vanId=Model.VanId }, new { @class="editor-field"}) %>
    </div>
    
    <script type="text/javascript">
        $(function () {
            $("#inputTypeId").change(function () {
                var inputTypeId = $(this).val();
                if (inputTypeId !== "") {
                    $.post("/CanvassResponses/GetContactTypesByInputTypeId?inputTypeId=" + inputTypeId, function (data) {
                        if (data == null) {
                            return;
                        }
                        var contactTypesMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.length; x++) {
                            contactTypesMarkup += "<option value=" + data[x].ContactTypeId + ">" + data[x].Name + "</option>";
                        }
                        $("#contactTypeId").html(contactTypesMarkup).show();
                    });
                }
            });

            $("#contactTypeId").change(function () {
                var contactTypeId = $(this).val();
                if (contactTypeId !== "") {
                    $.post("/CanvassResponses/GetResultCodesByContactTypeId?contactTypeId=" + contactTypeId, function (data) {
                        if (data == null) {
                            return;
                        }
                        var resultCodesMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.length; x++) {
                            resultCodesMarkup += "<option value=" + data[x].ResultCodeId + ">" + data[x].Name + "</option>";
                        }
                        $("#resultCodeId").html(resultCodesMarkup).show();
                    });
                }
            });
        });
    </script>
</body>
</html>
