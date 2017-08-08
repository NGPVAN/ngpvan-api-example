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
            <%= Html.Label("Event Id", new { @class="editor-label"}) %> <%= Html.TextBox("eventId", Model.EventId.ToString(), new { @class="editor-field", @readonly = "readonly" }) %><br/>

            <%= Html.Label("Name", new { @class="editor-label"}) %> <%= Html.TextBox("name", Model.Name, new { @class="editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("Short name", new { @class="editor-label"}) %> <%= Html.TextBox("shortName", Model.ShortName, new { @class="editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("Description", new { @class="editor-label"}) %> <%= Html.TextArea("description", Model.Description, new { @class="editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("Start date", new { @class="editor-label"}) %> <%= Html.TextBox("startDateUtc", Model.StartDateUtc.ToLocalTime(), new { @class="editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("End date", new { @class="editor-label"}) %> <%= Html.TextBox("endDateUtc", Model.EndDateUtc.ToLocalTime(), new { @class="editor-field", @readonly = "readonly"}) %><br/>
            
            <%= Html.Label("Event type", new { @class="editor-label"}) %> <%= Html.TextBox("eventTypeName", Model.EventType.Name, new { @class="editor-field", @readonly = "readonly"}) %><br/>
        
            <%= Html.Label("Is active", new { @class="editor-label"}) %> <%= Html.CheckBox("isActive", Model.IsActive, new { @class="editor-field", @readonly = "readonly"}) %><br/>
            
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
                <%= Html.TextArea("locationDisplayName", location.DisplayName, new { @class="editor-field", @readonly = "readonly"}) %> <br/>
            <% } %>
            <% } %>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to List of Events", "Index") %>
    </p>
</body>
</html>
