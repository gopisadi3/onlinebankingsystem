&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;
&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;
&lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;ie=edge&quot;&gt;
&lt;title&gt;Welcome&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;br&gt;&lt;br&gt;
&lt;img src=&quot;pic.jpg&quot; alt=&quot;image here&quot; style=&quot;float:left&quot;&gt;
&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;
&lt;jsp:include page=&#39;login.jsp&#39; /&gt;
&lt;/body&gt;
&lt;/html&gt;
Login.jsp
&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;
&lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;ie=edge&quot;&gt;
&lt;title&gt;Login&lt;/title&gt;
&lt;style&gt;
body {

font-family: Arial, Helvetica, sans-serif;
font-size: 15px;
}

.mt-btn {
background-color: #4285f4;
border-style: none;
border-radius: 5px;
color: white;
padding: 5px 20px 5px 20px;
width: auto;
height: 2.5em;
transition: 0.4s;
}

.mt-btn:hover {
background-color: #005ef5;
box-shadow: 0px 0px 3px #000;
}

.txt {
margin: 5px 10px 5px 10px;
border: 1px solid black;
padding: 5px 10px 5px 10px;
border-radius: 3px;
transition: 0.2s;
outline: none;
}

.txt:focus {
border: 1px solid #005ef5;
}

.container {

margin: 30px;
padding: 15px;
/* box-shadow: horizontal vertical blur-intensity intensity color*/
box-shadow: 1px 1px 15px 2px gray;
}
&lt;/style&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;div class=&quot;container&quot; style=&quot;width: 425px; float: left; margin-left: 100px; height:
200px; padding-top: 65px;&quot;&gt;
&lt;center&gt;
&lt;form action=&quot;loginHandle.jsp&quot; method=&quot;POST&quot;&gt;
&lt;table&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;username&quot;&gt;Username&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;username&quot; id=&quot;username&quot; class=&#39;txt&#39;
required&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;password&quot;&gt;Password&lt;/label&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;password&quot; name=&quot;password&quot; id=&quot;password&quot;
class=&#39;txt&#39; required&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;input type=&quot;submit&quot; name=&#39;login&#39;
value=&quot;Login&quot; class=&quot;mt-btn&quot;&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;&lt;/td&gt;
&lt;td&gt;&lt;a href=&quot;register.jsp&quot; style=&quot;float:right&quot;&gt;Register&lt;/a&gt;&lt;/td&gt;
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