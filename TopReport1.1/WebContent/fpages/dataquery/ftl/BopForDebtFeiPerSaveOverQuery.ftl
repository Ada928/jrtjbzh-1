<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="余额信息">
<@CommonQueryMacro.CommonQueryTab id="bopForDebtFeiPerSaveQueryTabs" navigate="false" currentTab="BopForDebtFeiPerSaveOverQuery">
	<@CommonQueryMacro.CommonQuery id="bopForDebtFeiPerSaveOverQuery" init="false" submitMode="current" navigate="false" >
		<table align="left">
			<tr>
				<td >
					<@CommonQueryMacro.Interface id="interface"  label="请输入查询条件" />
				</td>
			</tr>
			<tr>
  			  	<td>
  			    	<@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9"   pageCache="false" showArrow="true"/>
  			  	</td>
  			</tr>
  			<tr>
		      	<td >
					<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="filler2,brNo,brNoName,workDate[100],actiontype[80],recStatus[80],approveStatus[80],repStatus[80],exdebtcode[180],changeno,buscode,accoamount,chdate[85]" readonly="true" hasFrame="true" width="1000" height="260"/>
		      	</td>
      		</tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
</@CommonQueryMacro.CommonQueryTab>
<script language="JavaScript">

	function initCallGetter_post(){
		<#assign workdate = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTxdate()?default('')>
		bopForDebtFeiPerSaveOverQuery_interface_dataset.setValue("startdate", "${workdate}");
		bopForDebtFeiPerSaveOverQuery_interface_dataset.setValue("enddate", "${workdate}");
	}

	function datatable1_filler2_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			var filler2 = record.getValue("filler2");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + filler2 + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}

	//详细信息
	function doDetail(id){
		showWin("非居民机构存款余额信息明细","${contextPath}/fpages/datacollection/ftl/BopForDebtFeiPerSaveOverInfo.ftl?id=" + id + "&op=detail");
	}
</script>
</@CommonQueryMacro.page>