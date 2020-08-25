&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;
&lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;ie=edge&quot;&gt;
&lt;title&gt;Register&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;style.css&quot;&gt;
&lt;script&gt;
function phoneValidation() {
var inputtxt = document.getElementById(&#39;phone&#39;).value;

for (i in inputtxt) {
if (inputtxt[i] &lt; &#39;0&#39; || inputtxt[i] &gt; &#39;9&#39;) {
alert(&quot;Enter a valid email address&quot;);
document.getElementById(&#39;phone&#39;).value = &#39;&#39;;
}
}
}
function validateemail() {
var x = document.getElementById(&#39;email&#39;).value;
var atposition = x.indexOf(&quot;@&quot;);
var dotposition = x.lastIndexOf(&quot;.&quot;);
if (atposition &lt; 1 || dotposition &lt; atposition + 2 || dotposition + 2 &gt;= x.length) {
alert(&quot;Enter a valid e-mail address&quot;);
document.getElementById(&#39;email&#39;).value = &#39;&#39;;
}
}
function passValidation() {
console.log(document.getElementById(&#39;password&#39;).value);
console.log(document.getElementById(&#39;confirmpassword&#39;).value);
if (document.getElementById(&#39;password&#39;).value !=
document.getElementById(&#39;confirmpassword&#39;).value) {
alert(&#39;Password and confirm password should be same&#39;);
document.getElementById(&#39;confirmpassword&#39;).value = &#39;&#39;;
}
}

&lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;br&gt;&lt;br&gt;
&lt;img src=&quot;pic.jpg&quot; alt=&quot;image here&quot; style=&quot;float:left&quot;&gt;
&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;

&lt;div class=&quot;container&quot; style=&quot;width: 450px; float:right; margin-right: 50px; height:
250px;&quot;&gt;
&lt;center&gt;
&lt;form action=&quot;registerHandler.jsp&quot; method=&quot;POST&quot;&gt;
&lt;table&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;username&quot;&gt;Username&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;susername&quot; id=&quot;username&quot; class=&#39;txt&#39;
required&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;password&quot;&gt;Password&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;password&quot; name=&quot;password&quot; id=&quot;password&quot;
class=&#39;txt&#39; required&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;confirmpassword&quot;&gt;Confirm Password&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;password&quot; name=&quot;confirmpassword&quot;
id=&quot;confirmpassword&quot; class=&#39;txt&#39;
onchange=&#39;passValidation()&#39; required&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;email&quot;&gt;Email&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;email&quot; name=&quot;email&quot; id=&quot;email&quot; class=&#39;txt&#39;
onchange=&quot;validateemail()&quot; required&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;phone&quot;&gt;Phone&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;phone&quot; id=&quot;phone&quot; class=&#39;txt&#39;
onchange=&quot;phoneValidation();&quot;
required&gt;&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
&lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;input type=&quot;submit&quot; name=&#39;register&#39;
value=&quot;Register&quot;
class=&quot;mt-btn&quot;&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;span id=&#39;message&#39; style=&quot;color: red;
font-size: 12px;&quot;&gt;&lt;/span&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/center&gt;
&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
Register_handler.jsp
&lt;%@page import=&#39;java.sql.*&#39; %&gt;
&lt;%
String uname = request.getParameter(&quot;susername&quot;);
String password = request.getParameter(&quot;confirmpassword&quot;);
String email = request.getParameter(&quot;email&quot;);
String ph_number = request.getParameter(&quot;phone&quot;);

System.out.println(&quot;In registerHandler.jsp -- &quot; + uname);
Class.forName(&quot;oracle.jdbc.driver.OracleDriver&quot;);
Connection con =
DriverManager.getConnection(&quot;jdbc:oracle:thin:@localhost:1521:xe&quot;,&quot;system&quot;,&quot;tiger
&quot;);

Statement stmt = con.createStatement();

String registerCheckQuery = String.format(&quot;select count(*) from account where
uname = &#39;%s&#39;&quot;, uname);
ResultSet rs = stmt.executeQuery(registerCheckQuery);

boolean valid = false;
while(rs.next()){
if(rs.getInt(1) == 0){
valid = true;
}
}
if(valid){
String registerQuery = String.format(&quot;insert into account values( &#39;%s&#39;, &#39;%s&#39;, 0,
&#39;%s&#39;, &#39;%s&#39;)&quot;,
uname,password,email,ph_number);

stmt.executeUpdate(registerQuery);
System.out.println(&quot;Registered Successfully&quot;);

out.println(&quot;&lt;script&gt;window.onload =
function(){document.getElementById(&#39;message&#39;).innerHTML = &#39;Registered
successfully&#39;; document.getElementById(&#39;message&#39;).style = &#39;color: green; font-size:
12px;&#39;}&lt;/script&gt;&quot;);
%&gt;&lt;jsp:include page=&#39;welcome.jsp&#39; /&gt;&lt;%
}else{
out.println(&quot;&lt;script&gt;window.onload =
function(){document.getElementById(&#39;message&#39;).innerHTML = &#39;The username is
already taken. Please choose something else.&#39;;}&lt;/script&gt;&quot;);
%&gt;&lt;jsp:include page=&#39;register.jsp&#39; /&gt;&lt;%
}

%&gt;