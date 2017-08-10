<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.People>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Person Detail</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>Person Detail</legend>
        <p>
            <%= Html.Label("VANID", new {@class = "editor-label-subheader"}) %><br/>
            <%= Html.TextBox("vanId", Model.VanId.ToString(), new {@class = "editor-field", @readonly = "readonly"}) %> <br/><br/>
            
            <%= Html.Label("Name", new {@class = "editor-label-subheader"}) %><br/>
            <%= Html.TextBox("title", Model.Title, new {@class = "editor-field", @readonly = "readonly"}) %> 
            <%= Html.TextBox("firstName", Model.FirstName, new {@class = "editor-field", @readonly = "readonly"}) %> 
            <%= Html.TextBox("middleName", Model.MiddleName, new {@class = "editor-field", @readonly = "readonly"}) %>
            <%= Html.TextBox("lastName", Model.LastName, new {@class = "editor-field", @readonly = "readonly"}) %>
            <%= Html.TextBox("suffix", Model.Suffix, new {@class = "editor-field", @readonly = "readonly"}) %><br/>
            
            <% if (Model.Addresses != null && Model.Addresses.Length > 0) { %>
            <br/>
            <%= Html.Label("Address", new {@class = "editor-label-subheader"}) %><br/>
            <%
                   foreach (var address in Model.Addresses)
                   { %>                  
                    <%= Html.Label("Type", new {@class = "editor-label"}) %> <%= Html.TextBox("addressType", address.AddressType, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("addressLine1", address.AddressLine1, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("city", address.City, new {@class = "editor-field", @readonly = "readonly"}) %> <%= Html.TextBox("city", address.StateOrProvince, new {@class = "editor-field", @readonly = "readonly"}) %>, <%= Html.TextBox("city", address.ZipOrPostalCode, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>
            
            <% if (Model.Phones != null && Model.Phones.Length > 0) {%>
            <br/>
            <%= Html.Label("Phone", new {@class = "editor-label-subheader"}) %><br/>
            <%
                   foreach (var phone in Model.Phones)
                   { %>
                    <%= Html.Label("Type", new {@class = "editor-label"}) %> <%= Html.TextBox("phoneType", phone.PhoneType, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("phoneNumber", phone.PhoneNumber, new {@class = "editor-field", @readonly = "readonly"}) %> <%= Html.TextBox("phoneNumberExt", phone.Ext, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>

            <% if (Model.Emails != null && Model.Emails.Length > 0) {%>
            <br/>
            <%= Html.Label("Email Address", new {@class = "editor-label-subheader"}) %><br/>
            <%
                   foreach (var email in Model.Emails)
                   { %>
                    <%= Html.Label("Type", new {@class = "editor-label"}) %> <%= Html.TextBox("emailType", email.EmailType, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("emailAddress", email.EmailAddress, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>         
        </p>
        
        <p>
            <% if (Model.Districts != null && Model.Districts.Length > 0)
               { %>
            <br/>
            <%= Html.Label("Districts", new {@class = "editor-label-subheader"}) %><br/>
            <%
                foreach (var district in Model.Districts)
                { %>

                    <%= Html.Label(district.Name, new {@class = "editor-label"}) %> 
                    <%
                        foreach (var field in district.DistrictFieldValues)
                        {
                    %> <%= field.Name %> <br/><%
                        }
                }
               } %>

        </p>

        <% if (Model.DBMode == 1)
           { %>
        <p>
            <%: Html.ActionLink("Event details", "Detail", "Event", new {eventId = 4246}, new {@class = "editor-label"}) %> |
            <%: Html.ActionLink("RSVP to a simple event", "EventSignup", "Signup", new {vanId = Model.VanId, eventId = 4246, statusId = 1}, new {@class = "editor-label"}) %> |
            <%: Html.ActionLink("RSVP to an event with options", "EventSignup", "Signup", new {vanId = Model.VanId, eventId = 4306, statusId = 1}, new {@class = "editor-label"}) %> |
            <%: Html.ActionLink("Apply activist codes", "CanvassResponse", "CanvassResponses", new {vanId = Model.VanId, showSurveyQuestions = false}, new {@class = "editor-label"}) %> |
            <%: Html.ActionLink("Answer survey questions", "CanvassResponse", "CanvassResponses", new {vanId = Model.VanId, showActivistCodes = false}, new {@class = "editor-label"}) %> |
            <%: Html.ActionLink("List of event signups", "Index", "Signup", new {vanId = Model.VanId}, new {@class = "editor-label"}) %>
            
            <% if (Model.VoterFileVanID.HasValue && Model.VoterFileVanID.Value > 0)
               {
            %> | <a href="/People/Detail?vanId=<%= Model.VoterFileVanID.Value %>&dbMode=0">Your voterfile record</a><%            
               } %>
        </p>
        <% } %>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to Sign Up", "Index") %>
    </p>
</body>
</html>
