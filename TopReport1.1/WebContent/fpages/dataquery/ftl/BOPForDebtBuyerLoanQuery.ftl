<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="签约信息">

<@CommonQueryMacro.CommonQueryTab id="BOPForDebtBuyerQueryTabs" navigate="false" currentTab="BOPForDebtBuyerLoanQuery">
	<@CommonQueryMacro.CommonQuery id="BOPForDebtBuyerLoanQuery" init="false" submitMode="all" navigate="false" >
		<table align="left">
			<tr>
				<td colspan="2">
					<@CommonQueryMacro.Interface id="interface"  label="请输入查询条件" />
				</td>
			</tr>
			<tr>

  			  <td>
  			    <@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9"   pageCache="false" showArrow="true"/>
  			  </td>
  			 </tr>
  			 <tr>
		      	<td colspan="2">
					<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="filler2[100],brNo[140],brNoName[180],workDate[100],actiontype[80],recStatus[80],approveStatus[80],repStatus[80],exdebtcode[190],debtorcode[140],debtype[90],contractdate[120],valuedate[120],contractcurr[140],contractamount[120],maturity[100],anninrate[100],inprterm,spapfeboindex" readonly="true" hasFrame="true" width="900" height="230"/>
		      	</td>

		      </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
</@CommonQueryMacro.CommonQueryTab>
<script language="JavaScript">


	function initCallGetter_post() {
		<#assign v_txdate = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTxdate()>
		BOPForDebtBuyerLoanQuery_interface_dataset.setValue("qWorkDateStart","${v_txdate}");
		BOPForDebtBuyerLoanQuery_interface_dataset.setValue("qWorkDateEnd","${v_txdate}");
	}
	function locate(id) {

		var record = BOPForDebtBuyerLoanQuery_dataset.find(["id"],[id]);
		if (record) {
			BOPForDebtBuyerLoanQuery_dataset.setRecord(record);
		}
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

	//详细
	function doDetail(id) {
		locate(id);
		showWin("买方信贷签约信息","${contextPath}/fpages/datacollection/ftl/BOPForDebtBuyerLoanCol.ftl?id="+id+"&op=detaile&model=Query","report","");
	}

    //刷新数据
	function flushPage(){
		BOPForDebtBuyerLoanQuery_dataset.flushData();
	}

</script>
</@CommonQueryMacro.page>