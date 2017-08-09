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
                <%= Html.Label("VANID", new { @class="editor-label-subheader"}) %><br/>
                <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>  
            </p>

            <input type="hidden" name="inputTypeId" value="11"/>
            
            <input type="hidden" name="contactTypeId" value="8"/>

            
            <p>
                <% if (Model.ActivistCodes != null && Model.ActivistCodes.Count > 0)
                   {
                        %><%= Html.Label("How you'd like to help", new { @class="editor-label-subheader"}) %><br/><%
                       foreach (var ac in Model.ActivistCodes)
                       {
                           %> <input type="checkbox" name="activistCodeId" value="<%= ac.Value %>"/>
                            <%= Html.Label(ac.Text) %><br/><%
                       }
                   }
                %>
            </p>

            <p>
                <% if (Model.SurveyQuestions != null && Model.SurveyQuestions.Items.Count > 0)
                   { %>
                    <%= Html.Label("Survey question", new { @class="editor-label-subheader"}) %><br/>
                    <%    var surveyQuestion = Model.SurveyQuestions.Items[0];
                    %>
                        <%= Html.Hidden("surveyQuestionId", surveyQuestion.SurveyQuestionId, new {@class = "editor-field", @readonly = "readonly"}) %>
                        <%= Html.Label(surveyQuestion.ScriptQuestion, new { @class="editor-label"}) %><br/>
                        <%= Html.DropDownList("surveyResponseId", new List<SelectListItem>(surveyQuestion.SurveyResponses.Select(x => new SelectListItem() {Value = x.SurveyResponseId.ToString(), Text = x.Name} )) ) %>
                    <%
                    } %>
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
