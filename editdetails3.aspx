<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editdetails3.aspx.cs" Inherits="editdetails3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Details 3</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <center>
                                Astro Details</center>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <h3>
                                Astro/Kundli Details</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr>
                <td>
    Time of Birth
                    </td>
                <td>
    <asp:DropDownList ID="drphour" runat="server">
    <asp:ListItem >00</asp:ListItem>
    <asp:ListItem >01</asp:ListItem>
    <asp:ListItem >02</asp:ListItem> 
    <asp:ListItem >03</asp:ListItem>
    <asp:ListItem >04</asp:ListItem>
    <asp:ListItem >05</asp:ListItem>
    <asp:ListItem >06</asp:ListItem>
    <asp:ListItem >07</asp:ListItem>
    <asp:ListItem >08</asp:ListItem>
    <asp:ListItem >09</asp:ListItem>
    <asp:ListItem>10</asp:ListItem>
    <asp:ListItem>11</asp:ListItem>
    <asp:ListItem>12</asp:ListItem>
    <asp:ListItem>13</asp:ListItem>
    <asp:ListItem>14</asp:ListItem> 
    <asp:ListItem>15</asp:ListItem>
    <asp:ListItem>16</asp:ListItem>
    <asp:ListItem>17</asp:ListItem>
    <asp:ListItem>18</asp:ListItem>
    <asp:ListItem>19</asp:ListItem>
    <asp:ListItem>20</asp:ListItem>
    <asp:ListItem>21</asp:ListItem>
    <asp:ListItem>22</asp:ListItem>
    <asp:ListItem>23</asp:ListItem>


    </asp:DropDownList>


                    hrs&nbsp;


    <asp:DropDownList ID="drpmin" runat="server"  >
    <asp:ListItem>00</asp:ListItem>
    <asp:ListItem>01</asp:ListItem>
    <asp:ListItem>02</asp:ListItem>
    <asp:ListItem>03</asp:ListItem>
    <asp:ListItem>04</asp:ListItem>
    <asp:ListItem>05</asp:ListItem>
    <asp:ListItem>06</asp:ListItem>
    <asp:ListItem>07</asp:ListItem>
    <asp:ListItem>08</asp:ListItem>
    <asp:ListItem>09</asp:ListItem>
    <asp:ListItem>10</asp:ListItem>
    <asp:ListItem>11</asp:ListItem>
    <asp:ListItem>12</asp:ListItem>
    <asp:ListItem>13</asp:ListItem>
    <asp:ListItem>14</asp:ListItem>
    <asp:ListItem>15</asp:ListItem>
    <asp:ListItem>16</asp:ListItem>
    <asp:ListItem>17</asp:ListItem>
    <asp:ListItem>18</asp:ListItem>
    <asp:ListItem>19</asp:ListItem>
    <asp:ListItem>20</asp:ListItem>
    <asp:ListItem>21</asp:ListItem>
    <asp:ListItem>22</asp:ListItem>
    <asp:ListItem>23</asp:ListItem>
    <asp:ListItem>24</asp:ListItem>
    <asp:ListItem>25</asp:ListItem>
    <asp:ListItem>26</asp:ListItem>
    <asp:ListItem>27</asp:ListItem>
    <asp:ListItem>28</asp:ListItem>
    <asp:ListItem>29</asp:ListItem>
    <asp:ListItem>30</asp:ListItem>
    <asp:ListItem>31</asp:ListItem>
    <asp:ListItem>32</asp:ListItem>
    <asp:ListItem>33</asp:ListItem>
    <asp:ListItem>34</asp:ListItem>
    <asp:ListItem>35</asp:ListItem>
    <asp:ListItem>36</asp:ListItem>
    <asp:ListItem>37</asp:ListItem>
    <asp:ListItem>38</asp:ListItem>
    <asp:ListItem>39</asp:ListItem>
    <asp:ListItem>40</asp:ListItem>
    <asp:ListItem>41</asp:ListItem>
    <asp:ListItem>42</asp:ListItem>
    <asp:ListItem>43</asp:ListItem>
    <asp:ListItem>44</asp:ListItem>
    <asp:ListItem>45</asp:ListItem>
    <asp:ListItem>46</asp:ListItem>
    <asp:ListItem>47</asp:ListItem>
    <asp:ListItem>48</asp:ListItem>
    <asp:ListItem>49</asp:ListItem>
    <asp:ListItem>50</asp:ListItem>
    <asp:ListItem>51</asp:ListItem>
    <asp:ListItem>52</asp:ListItem>
    <asp:ListItem>53</asp:ListItem>
    <asp:ListItem>54</asp:ListItem>
    <asp:ListItem>55</asp:ListItem>
    <asp:ListItem>56</asp:ListItem>
    <asp:ListItem>57</asp:ListItem>
    <asp:ListItem>58</asp:ListItem>
    <asp:ListItem>59</asp:ListItem>
    
    </asp:DropDownList>
                    &nbsp;mins</td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbgotra" runat="server" Text="Gotra/Gotram(paternal)"></asp:Label>
                    </td>
                <td>
    <asp:TextBox ID="txtgotra" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="rexp" runat="server" 
     ControlToValidate="txtgotra" ErrorMessage="Invalid range(It should be between 3 and 20 characters)" 
        ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbgotramaternal" runat="server" Text="Gotra/Gotram(maternal)"></asp:Label>
                    </td>
                <td>
    <asp:TextBox ID="txtgotramaternal" runat="server"></asp:TextBox><asp:RegularExpressionValidator runat="server" 
     ControlToValidate="txtgotramaternal" ErrorMessage="Invalid range(It should be between 3 and 20 characters)"  SetFocusOnError="true"
        ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
    
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbancestral" runat="server" Text="Ancestral origin(Native)"></asp:Label>
                    </td>
                <td>
    <asp:TextBox ID="txtancestral" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" 
     ControlToValidate="txtancestral" ErrorMessage="Invalid range(It should be between 3 and 20 characters)" 
        ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbmanglik" runat="server" Text="Manglik/Chewai dosham"></asp:Label>
                    </td>
                <td align="left">
    <asp:RadioButtonList ID="rbtnmanglik" runat="server" RepeatDirection="Horizontal" Width="496px">
    <asp:ListItem Value="1" Text="Don't know"></asp:ListItem>
    <asp:ListItem Value="2" Text="Manglik"></asp:ListItem>
    <asp:ListItem Value="3" Text="Non-Manglik"></asp:ListItem>
    <asp:ListItem Value="4" Text="Angshik(partial manglik)"></asp:ListItem>
    </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbnakshatra" runat="server" Text="Nakshatra*"></asp:Label>
                    </td>
                <td>
    <asp:DropDownList ID="drpnakshatra" runat="server">
        
    
    
    </asp:DropDownList>
     <asp:RequiredFieldValidator runat="server" ControlToValidate="drpnakshatra" Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true"
     ErrorMessage="Please select the nakshatra you belong to." Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbmoon" runat="server" Text="Rashi /Moon Sign*"></asp:Label>
                    </td>
                <td>
    <asp:DropDownList ID="drpmoon" runat="server" style="margin-bottom: 0px">
        
       
    
    
    </asp:DropDownList>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="drpmoon" Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true"
     ErrorMessage="Please select your rashi." Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td>
     <asp:Label ID="lbsun" runat="server" Text="Sun Sign*"></asp:Label>
                    </td>
                <td>
    <asp:DropDownList ID="drpsun" runat="server">
       
       
    
    
    </asp:DropDownList>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="drpsun" Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true"
     ErrorMessage="Please select your zodiac sign." Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbmatch" runat="server" Text="Horoscope match is must for marriage?"></asp:Label>
                    </td>
                <td>
    <asp:RadioButtonList ID="rbtnmatch" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Value="1">Yes</asp:ListItem>
    <asp:ListItem Value="0">No</asp:ListItem>
    </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbkundli" runat="server" Text="Upload your digitally scanned horoscope"></asp:Label>
    </td>
                <td>
    <asp:FileUpload ID="fuplddpkundli" runat="server" />
   
    <asp:Button ID="btnupld" runat="server" text="Upload"  onclick="btnupld_Click" ValidationGroup="upload"
    />
                    <asp:RegularExpressionValidator ID="uplValidator" runat="server" ControlToValidate="fuplddpkundli"
                        ErrorMessage="only .jpg, .jpeg, bmp & pdf formats are allowed" ValidationGroup="upload"
                        ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Bb][Mm][Pp])|.+\.([Jj][Pp][Ee][Gg])|.+\.([Pp][Dd][Ff])|. )"
                    >
                    </asp:RegularExpressionValidator><br />
    <asp:Label ID="lbcomplt" runat="server" Text="upload Failed" Visible="false"></asp:Label>


    </td>
                </tr>
                 </table>
                  <center> <asp:Button ID="btnsave" runat="server" CssClass="logbtn" Text="Save" 
           onclick="btnsave_Click" Width="123px" /></center>

         
            </div>

            
            </div>
 
 <div style="min-height:150px;">
    
    </div>
 
    
   
</asp:Content>

