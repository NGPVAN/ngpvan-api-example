<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.SignupView>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>RSVP For An Event</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <% using (Html.BeginForm("EventSignup", "Signup"))
       { %>
   
        <fieldset>
            <legend>RSVP For An Event</legend>
    
            <p>
                <%= Html.Label("VANID", new { @class="editor-label-subheader"}) %><br/>
                <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %><br/>  
            </p>
            
            <p>
                <%= Html.Label("Event", new { @class="editor-label"}) %> <%= Html.DropDownList("eventId", Model.Events, new {@class = "editor-field"}) %> <br/>
                
                <%= Html.Label("Shift", new { @class="editor-label"}) %> <%= Html.DropDownList("eventShiftId", new List<SelectListItem>(), new {@class = "editor-field"}) %><br/>
                
                <%= Html.Label("Role", new { @class="editor-label"}) %> <%= Html.DropDownList("roleId", new List<SelectListItem>(), new {@class = "editor-field"}) %><br/>

                <input type="hidden" name="statusId" value="1"/>
                
                <%= Html.Label("Location", new { @class="editor-label"}) %> <%= Html.DropDownList("locationId", new List<SelectListItem>(), new {@class = "editor-field"}) %><br/>      
            </p>
            
            <input type="submit" value="RSVP" />
        </fieldset>
    <% } %>
    
    <div>
        <%: Html.ActionLink("Back to Person", "Detail", "People", new { vanId=Model.VanId }, new { @class="editor-field"}) %>
    </div>

    <script type="text/javascript">
        $(function(){
            $("#eventId").change(function() {
                var eventId = $(this).val();
                if (eventId !== "") {
                    $.post("/Event/GetByEventId?eventId=" + eventId, function (data) {
                        if (data == null) {
                            return;
                        }

                        var locationMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.Locations.length; x++) {
                            locationMarkup += "<option value=" + data.Locations[x].LocationId + ">" + data.Locations[x].DisplayName + "</option>";
                        }
                        $("#locationId").html(locationMarkup).show();

                        var shiftMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.Shifts.length; x++) {
                            shiftMarkup += "<option value=" + data.Shifts[x].EventShiftId + ">" + data.Shifts[x].Name + "</option>";
                        }
                        $("#eventShiftId").html(shiftMarkup).show();

                        var roleMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.Roles.length; x++) {
                            roleMarkup += "<option value=" + data.Roles[x].RoleId + ">" + data.Roles[x].Name + "</option>";
                        }
                        $("#roleId").html(roleMarkup).show();
                    });

                    $.post("/Signup/GetStatusListByEventId?eventId=" + eventId, function (data) {
                        if (data == null) {
                            return;
                        }

                        var statusMarkup = "<option value='0'></option>";
                        for (var x = 0; x < data.length; x++) {
                            statusMarkup += "<option value=" + data[x].StatusId + ">" + data[x].Name + "</option>";
                        }
                        $("#statusId").html(statusMarkup).show();
                    });
                }
            });
        });
    </script>
</body>
</html>
