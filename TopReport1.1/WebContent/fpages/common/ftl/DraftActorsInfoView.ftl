<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="Ʊ����Ϣ">
<CENTER><H1 id="draftTitle"></H1></CENTER>
<table align="center" >
<tr>
<td valign="center" align="center">
<table align="center"  width="800px" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2"><table frame=void class="grouptable">
               <tr>
                  <td colspan="2" align="center" nowrap class="labeltd"> ��Ʊ�� </td>
				  <td class="datatd" >${RequestParameters["stdissdate"]}</td>
                  <td colspan="2" align="center" nowrap class="labeltd"> Ʊ������ </td>
                 <td class="datatd">${RequestParameters["stdbilltypName"]}</td>
                </tr>
               <tr>
                  <td colspan="2" align="center" nowrap class="labeltd"> ��Ʊ������ </td>
 			      <td class="datatd">${RequestParameters["stdduedate"]}</td>
                  <td colspan="2" align="center" nowrap class="labeltd"> Ʊ�ݺ��� </td>
                   <td class="datatd">${RequestParameters["stdbillnum"]}</td>
                </tr>

                <tr>
                  <td width="4%" rowspan="4" align="center" nowrap class="labeltd"> �� <br> Ʊ <br> �� </td>
                  <td width="7%" align="center" nowrap class="labeltd" > ȫ&nbsp;&nbsp;�� </td>
                  <td width="39%" class="datatd">${RequestParameters["stddrwrnam"]}</td>
                  <td width="4%" rowspan="4" align="center" nowrap class="labeltd"> �� <br> �� <br> �� </td>
                  <td width="10%" align="center" nowrap class="labeltd"> ȫ&nbsp;&nbsp;�� </td>
                  <td width="36%" class="datatd">
                  	${RequestParameters["stdpyeenam"]}
                  </td>
                </tr>
                <tr>
                  <td align="center" nowrap class="labeltd" > ��&nbsp;&nbsp;�� </td>
                  <td class="datatd">${RequestParameters["stddrwracc"]}</td>
                  <td align="center" nowrap class="labeltd" > ��&nbsp;&nbsp;�� </td>
                  <td class="datatd">${RequestParameters["stdpyeeacc"]}</tr>
                <tr>
                  <td align="center" nowrap class="labeltd" > ��&nbsp;&nbsp;�� </td>
                  <td class="datatd" nowrap>${RequestParameters["stddrwrbnm"]}</tr>
                  <td align="center" nowrap class="labeltd"> ��&nbsp;&nbsp;�� </td>
 				  <td class="datatd" nowrap>${RequestParameters["stdpyeebnm"]}</tr>
                </tr>

                <tr>
                  <td align="center" nowrap class="labeltd"> ������ </td>
                  <td class="datatd" nowrap>
						<#assign drwrUBankName = getUBankName(RequestParameters["stddrwrbnm"])>
						${drwrUBankName}
                    </tr>
                   <td align="center" nowrap class="labeltd"> ������ </td>
                   <td class="datatd" nowrap>
						<#assign pyeeUBankName = getUBankName(RequestParameters["stdpyeebnm"])>
						${pyeeUBankName}
                   </tr>
                </tr>

                <tr height="50">
				  <td colspan="2" align="center" nowrap class="labeltd"> Ʊ�ݽ�� </td>
 				  <td colspan="1" class="datatd" >����� (��д) &nbsp; &nbsp;${RequestParameters["stdpmmoneyCH"]}</td>
 				  <td colspan="3" class="datatd" ><div align="center">${RequestParameters["stdpmmoney"]}</div></td>
                </tr>


                <tr>
                  <td width="4%" rowspan="2" align="center" nowrap class="labeltd"> �� <br> �� <br> �� <br> �� <br> Ϣ </td>
                  <td align="center" nowrap class="labeltd" >ȫ&nbsp;&nbsp;��</td>
                  <td class="datatd">
                  	${RequestParameters["stdaccpnam"]}
                  </td>
                  <td colspan="2" align="center" nowrap class="labeltd"> �������к� </td>
  				  <td class="datatd">${RequestParameters["stdaccpbnm"]}</td>
                </tr>

                <tr>
				  <td align="center" nowrap class="labeltd" >��&nbsp;&nbsp;��</td>
 				  <td class="datatd">${RequestParameters["stdaccpacc"]}</td>
                  <td colspan="2" align="center" nowrap class="labeltd">���������� </td>
				  <td class="datatd">
						<#assign accpUBankName = getUBankName(RequestParameters["stdaccpbnm"])>
						${accpUBankName}
				  </td>
                </tr>

                <tr>

                  <td colspan="2" align="center" nowrap class="labeltd" >�������� </td>
                 <td class="datatd">${RequestParameters["stdendormkName"]}</td>
                </tr>
                 <tr>
				  <td colspan="2" align="center" nowrap class="labeltd"> ��Ʊ��ע </td>
 				  <td colspan="4" class="datatd">${RequestParameters["std400memo"]}</td>
                </tr>

            </table>
          </tr>
</table>
</td>
</tr>
</table>
<br/>
<br/>
<CENTER><input type="button" value="�ر�" id="btBack1" onClick="window.close();"/></CENTER>
<script language="javascript">
var stdbilltyp = "${RequestParameters["stdbilltyp"]}";
function initCallGetter_post() {
	if(stdbilltyp == "AC01"){
		document.getElementById('draftTitle').innerHTML = '�������гжһ�Ʊ';
	}else if(stdbilltyp == "AC02"){
		document.getElementById('draftTitle').innerHTML = '������ҵ�жһ�Ʊ';
	}

}
</script>
</@CommonQueryMacro.page>