package com.huateng.report.genupreportfile.getter;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;
import com.huateng.report.service.BopForDebtYinTuanService;

@SuppressWarnings("unchecked")
public class BopForDebtFeiPerSaveOverGenGetter  extends BaseGetter {

	@Override
	public Result call() throws AppException {
		try {
			PageQueryResult pageQueryResult = getData();

			ResultMng.fillResultByList(getCommonQueryBean(),
					getCommQueryServletRequest(), pageQueryResult.getQueryResult(),
					getResult());
			result.setContent(pageQueryResult.getQueryResult());
			result.getPage().setTotalPage(pageQueryResult.getPageCount(getResult().getPage().getEveryPage()));
			result.init();
			return result;
		} catch (CommonException e) {
			throw new AppException(Module.SYSTEM_MODULE,
					Rescode.DEFAULT_RESCODE, e.getMessage());
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE,
					Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}

	public PageQueryResult getData() throws CommonException, IllegalAccessException, InvocationTargetException{
		int pageSize = this.getResult().getPage().getEveryPage();
		int pageIndex = this.getResult().getPage().getCurrentPage();
		Map map = getCommQueryServletRequest().getParameterMap();
		String qbrNo = (String) map.get("qbrNo");
		String qactiontype = (String) map.get("qactiontype");
		String qFiller2 = (String) map.get("qFiller2");
		String workDate = GlobalInfo.getCurrentInstance().getFileDate();

		BopForDebtYinTuanService debtYinTuanService = BopForDebtYinTuanService.getInstance();
		return debtYinTuanService.queryFeiPerGen("over", pageIndex, pageSize, workDate, qactiontype, qFiller2, qbrNo);
	}
}

