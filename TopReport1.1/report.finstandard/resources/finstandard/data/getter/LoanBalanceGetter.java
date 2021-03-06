package resources.finstandard.data.getter;

import java.text.ParseException;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.util.DateUtil;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

import resources.finstandard.data.service.LoanBalanceService;

public class LoanBalanceGetter extends BaseGetter {

	public LoanBalanceGetter() {
	}

	@Override
	public Result call() throws AppException {
		try {
			PageQueryResult pageResult = getData();
			ResultMng.fillResultByList(getCommonQueryBean(), getCommQueryServletRequest(), pageResult.getQueryResult(),
					getResult());
			result.setContent(pageResult.getQueryResult());
			result.getPage().setTotalPage(pageResult.getPageCount(getResult().getPage().getEveryPage()));
			result.init();
			System.out.println(result.toString());
			return result;
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE, Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}

	private PageQueryResult getData() throws CommonException, ParseException {
		Map paramsMap = this.getCommQueryServletRequest().getParameterMap();
		int pageSize = this.getResult().getPage().getEveryPage();
		int pageIndex = this.getResult().getPage().getCurrentPage();
		String sjrq = (String) paramsMap.get("sjrq");
		String jrjgbm = (String) paramsMap.get("jrjgbm");
		String khlx = (String) paramsMap.get("khlx");
		String jkrbm = (String) paramsMap.get("jkrbm");
		String dkjjbh = (String) paramsMap.get("dkjjbh");
		StringBuffer hql = new StringBuffer(" from LoanBalance lb where 1=1");
		if (StringUtils.isNotBlank(sjrq)) {
			hql.append(" and lb.sjrq=to_date('"+sjrq+"','yyyy-mm-dd')");
		}
		if (StringUtils.isNotBlank(jrjgbm)) {
			hql.append(" and lb.jrjgbm= '" + jrjgbm + "'");
		}
		if (StringUtils.isNotBlank(khlx)) {
			hql.append(" and lb.khlx= '" + khlx + "'");
		}
		if (StringUtils.isNotBlank(jkrbm)) {
			hql.append(" and lb.jkrbm= '" + jkrbm + "'");
		}
		if (StringUtils.isNotBlank(dkjjbh)) {
			hql.append(" and lb.dkjjbh='" + dkjjbh + "'");
		}
		System.out.println(hql.toString());
		return LoanBalanceService.getInstance().list(pageIndex, pageSize, hql.toString());
	}

}
