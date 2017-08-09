<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.Event>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Detail</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>Event Detail</legend>
        <p>
            <%= Html.Label("Name", new { @class="editor-label"}) %> <%= Model.Name %><br/>
        
            <%= Html.Label("Description", new { @class="editor-label"}) %> <%= Model.Description %><br/>
        
            <%= Html.Label("Start date", new { @class="editor-label"}) %> <%= Model.StartDateUtc.ToLocalTime()  %><br/>
        
            <%= Html.Label("End date", new { @class="editor-label"}) %> <%= Model.EndDateUtc.ToLocalTime() %><br/>
            
            <% if (Model.Shifts != null) 
               {%>
            <br/>
            <%= Html.Label("Shifts", new { @class="editor-label-subheader"}) %><br/>
            <% foreach (var shift in Model.Shifts)
               { %>
                <%= Html.TextBox("shiftName", shift.Name, new { @class="editor-field", @readonly = "readonly"}) %> <br/>
            <% } %>
            <% } %>
            
            <% if (Model.Roles != null)
               {%>
            <br/>
            <%= Html.Label("Roles", new { @class="editor-label-subheader"}) %><br/>
            <% foreach (var role in Model.Roles)
               { %>
                <%= Html.TextBox("roleName", role.Name, new { @class="editor-field", @readonly = "readonly"}) %> <br/>
            <% } %>
            <% } %>

            <% if (Model.Locations != null) 
               {%>
            <br/>
            <%= Html.Label("Locations", new { @class="editor-label-subheader"}) %><br/>
            <% foreach (var location in Model.Locations)
               { %>
                <%= location.DisplayName %> <br/>
            <% } %>
            <% } %>
            <% using (Html.BeginForm("SimpleSignup", "Signup")) { %>
                <input type="hidden" name="vanId" value="12"/>
                <input type="hidden" name="eventId" value="<%= Model.EventId %>" />
                <input type="hidden" name="statusId" value="1" />
                <input type="submit" value="RSVP" />
            <% } %>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to List of Events", "Index") %>
    </p>
</body>
</html>
