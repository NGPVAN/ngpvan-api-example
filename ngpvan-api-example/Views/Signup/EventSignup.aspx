<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.SignupView>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>RSVP to an Event</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>RSVP to an Event</legend>

        <% using (Html.BeginForm("EventSignup", "Signup")) { %>
        <p>
            <%= Html.Label("VANID", new { @class="editor-label-subheader"}) %><br/>
            <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %><br/>  
        </p>
        
        <% if (Model.Event != null) { %>
        <p>
            <%= Html.Label("Event Detail", new {@class = "editor-label-subheader"}) %><br/>

            <%= Html.Label("Event Name", new {@class = "editor-label"}) %><br/>
            <%= Html.TextBox("eventName", Model.Event.Name, new {@class = "editor-field", @readonly = "readonly"}) %><%= Html.Hidden("eventId", Model.Event.EventId) %><br/>
        
            <%= Html.Label("Description", new {@class = "editor-label"}) %><br/>
            <%= Html.TextArea("eventDescription", Model.Event.Description, new {@class = "editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("Start date", new {@class = "editor-label"}) %><br/>
            <%= Html.TextBox("eventStartDateUtc", Model.Event.StartDateUtc.ToLocalTime(), new {@class = "editor-field", @readonly = "readonly"}) %><br/>

            <%= Html.Label("End date", new {@class = "editor-label"}) %><br/>
            <%= Html.TextBox("eventEndDateUtc", Model.Event.EndDateUtc.ToLocalTime(), new {@class = "editor-field", @readonly = "readonly"}) %><br/>
            
            <br/>
            
            <% if (Model.Event.Shifts != null) {
                   if (Model.Event.Shifts.Length > 1) { %>
            <%= Html.Label("Shift", new {@class = "editor-label"}) %><br/>
            <%= Html.DropDownList("eventShiftId", Model.Event.Shifts.Select(item => new SelectListItem {Value = item.EventShiftId.ToString(), Text = item.Name}), new {@class = "editor-field"}) %><br/>
            <% } 
               else { %>
            <%= Html.Hidden("eventShiftId", Model.Event.Shifts[0].EventShiftId) %>
            <% }
               } %>

            <% if (Model.Event.Roles != null) { 
                   if (Model.Event.Roles.Length > 1) { %>
            <%= Html.Label("Role", new { @class="editor-label"}) %><br/>
            <%= Html.DropDownList("roleId", Model.Event.Roles.Select(item => new SelectListItem {Value = item.RoleId.ToString(),Text = item.Name}), new {@class = "editor-field"}) %><br/>
            <% } 
               else { %>
            <%= Html.Hidden("roleId", Model.Event.Roles[0].RoleId) %>
            <% }
               } %>

            <% if (Model.Event.Locations != null) { 
                   if (Model.Event.Locations.Length > 1) { %>
            <%= Html.Label("Location", new { @class="editor-label"}) %><br/>
            <%= Html.DropDownList("locationId", Model.Event.Locations.Select(item => new SelectListItem {Value = item.LocationId.ToString(),Text = item.Name}), new {@class = "editor-field"}) %><br/>
            <% } 
               else { %>
            <%= Html.Hidden("locationId", Model.Event.Locations[0].LocationId) %>
            <% }
               } %>

            <% if (Model.Statuses != null) { %>
            <%= Html.Label("Status", new {@class = "editor-label"}) %><br/>
            <%= Html.DropDownList("statusId", Model.Statuses.Select(item => new SelectListItem {Value = item.StatusId.ToString(), Text = item.Name}), new {@class = "editor-field"}) %><br/>
            <% }
               else { %>
            <%= Html.Hidden("statusId", Model.StatusId) %>
            <% } %>
        </p>
        <% } %>
           
        <input type="submit" value="RSVP" />             
        <% } %>
    </fieldset>

    <div>
        <%: Html.ActionLink("Back to Person", "Detail", "People", new { vanId=Model.VanId }, new { @class="editor-field"}) %>
    </div>
</body>
</html>
