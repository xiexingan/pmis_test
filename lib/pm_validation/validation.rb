# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
$:.unshift File.join(File.dirname(__FILE__))

require 'step_factory'
require 'step_actor'
require 'step_id'
require 'step_result'
require 'validation_step'

module PMValidation
  class Validation
    
    def initialize
      @current_offset = 0
      factory = StepFactory.new
      @steps = build_steps(factory)
    end
    
    def validate
      @steps.each do |step|
        step.run
      end
    end
    
    def get_results
      @steps.collect!{|step| step.get_result}
    end
    
    private
    def build_steps(factory)
      steps = []
      build_start_step(steps, factory)
      build_login_steps(steps, factory)
#      build_open_group_tab_steps(steps, factory, "基础信息", 0, [
#          "合同分类", "合同范本", "水印管理", 
#          "客户类别", "客户字典", "其他合作单位类别", 
#          "其他合作单位字典", "地域字典", "质量目标", 
#          "安全措施项目", "危险源字典", "预算取费模板管理", 
#          "机构参数设置"
#        ])
#      build_open_group_tab_steps(steps, factory, "投标管理", 1, [
#          "项目信息跟踪", "项目背景情况调查", "项目风险分析", 
#          "资格预审", "招标文件评审", "项目投标计划", 
#          "投标文件评审", "投标总结", "建造师使用管理", 
#          "竞争对手类别", "竞争对手名录", "工程跟踪信息分析", 
#          "工程中标情况分析", "竞争对手分析"
#        ])
#      build_open_group_tab_steps(steps, factory, "项目信息", 2, [      
#          "工程类别字典", "项目基本信息", "项目管理人员名册", 
#          "项目策划", "项目责任书"
#        ])
#      build_open_group_tab_steps(steps, factory, "合同管理", 3, [      
#          "施工合同评审", "施工合同登记", "施工合同交底", 
#          "工程结算", "其他支出字典", "二次经营台帐", 
#          "收入合同台帐", "支出合同台帐", "合同台帐"
#        ])
#      build_open_group_tab_steps(steps, factory, "生产及工期管理", 4, [      
#          "施工总进度计划", "期间计划", "进度偏差情况分析", 
#          "项目影像管理", "与业主沟通"
#        ])
#      build_open_group_tab_steps(steps, factory, "资金管理", 5, [      
#          "资金支付类型字典", "费用项目字典", "项目资金计划", 
#          "工程款到账记录", "费用项目字典成本科目挂接", 
#          "费用项目查询", "项目收支综合分析", "资金计划执行情况查询", 
#          "结算支付情况查询"
#        ])
#      build_open_group_tab_steps(steps, factory, "物资管理", 6, [      
#          "材料类别字典", "材料字典", "库房字典", 
#          "商品混凝土附加费字典", "材料用途字典", "材料指导价", 
#          "物资供应商类别", "物资供应商初评", "物资供应商名录", 
#          "物资供应商评价", "物资总体控制计划", "材料部位计划", 
#          "物资月度进场计划", "材料采购计划", "材料采购比价单", 
#          "材料采购合同", "材料采购订单", "材料采购结算单", 
#          "材料结算价格调差单", "材料付款申请单", "材料直入直出单", 
#          "材料入库单", "材料退货单", "材料出库单", 
#          "材料退库单", "材料库房报损单", "材料库房调拨单", 
#          "材料库房盘点单", "材料调拨结算单", "周转材料租赁计划", 
#          "周转材料租赁合同", "周转材料租赁结算单", "商品混凝土供应合同", 
#          "商品混凝土结算单", "物资处置申请", "物资处置记录", 
#          "材料三级帐", "材料字典成本科目挂接", "材料用途字典成本科目挂接", 
#          "商品混凝土附加费字典成本科目挂接", "材料收发存明细查询", "材料收发综合查询", 
#          "材料计划综合查询", "材料部位对比分析", "材料需用计划跟踪", 
#          "材料采购计划跟踪", "材料甲供计划跟踪", "租赁周转材料综合查询", 
#          "材料合同台帐", "材料结算支付情况查询", "材料采购价格趋势分析", 
#          "材料租赁价格平台", "材料租赁价格对比", "材料租赁价格趋势分析", 
#          "材料供方平台", "材料采购价格平台", "材料采购价格对比"
#        ])
#      build_open_group_tab_steps(steps, factory, "劳务管理", 8, [
#          "劳务分包分类字典", "劳务分包项目字典", "劳务分包用途字典", 
#          "劳务分包指导价", "劳务分包商类别", "劳务分包商初评", 
#          "劳务分包商名录", "劳务分包商评价", "劳务分包工程申请", 
#          "劳务分包合同登记", "劳务分包预结算", "劳务分包结算", 
#          "劳务分包项目字典成本科目挂接", "劳务分包用途字典成本科目挂接", 
#          "劳务分包合同台帐", "劳务分包结算支付情况查询", "劳务分包结算明细台帐", 
#          "劳务分包价格平台", "劳务分包价格对比", "劳务分包价格趋势分析"
#        ])
      build_open_group_tab_steps(steps, factory, "成本管理", 10, [
          "目标责任成本编制(预算方式)", 
          "目标责任成本测算模板", "目标责任成本编制（测算方式）", 
          "成本偏差分析", "成本汇总分析", "核算对象成本分析", 
          "成本科目成本分析", "材料量价对比分析", "劳务分包量价对比分析", 
          "专业分包量价对比分析", "成本指标分析", "成本趋势分析"
        ])
      
      build_open_group_tab_steps(steps, factory, "增值税管理", 16, [
          "企业纳税人信息登记", "销项发票分类", "进项发票分类", 
          "纳税人类别字典", "供应商计税类型字典", 
          "附加税字典", "物料税类字典", "物资税码税率设置", 
          "费用税类字典", "费用税码税率设置", "劳务分包税类字典", 
          "劳务分包税码税率设置", "专业分包税类字典", "专业分包税码税率设置", 
          "机械设备税类字典", "机械设备税码税率设置", "空白发票登记", 
          "销项发票登记", "销项发票快递登记", "销项发票台账", "进项发票登记", 
          "进项发票认证结果导入", "进项发票快递登记", "进项发票台账", 
          "项目部预缴登记", "增值税纳税登记", "销项综合分析", 
          "进项综合分析", "应纳税额分析", "增值税税负分析", "销项进项发票统计"
        ])

      
      #build_end_step(steps, factory)
      set_verify_elements(steps)  
      steps
    end
    
    private
    def build_start_step(steps, factory)
      steps.push(factory.create_start)
    end
    
    private 
    def build_end_step(steps, factory)
      steps.push(factory.create_end)
    end
    
    private
    def build_login_steps(steps, factory)
      steps.concat([
        factory.create_open("访问登录页面", "http://192.168.1.84:8080"),
        factory.create_set_text("输入用户名", "xiexingan", :id=>"username"),
        factory.create_set_text("输入密码", "0000", :id=>"password"),
        #login pm system
        factory.create_click("登录", :id=>"btLogin", :class=>"form-submit-btn")
      ])
    end
    
    private
    def build_open_group_tab_steps(steps, factory, menu_text, offset, menu_items)
      build_scroll_menu_steps(steps, factory, offset)
      menu_items.each do |menu_item_text|
        build_open_tab_steps(steps, factory, menu_text, menu_item_text)
      end
    end
    
    private
    def build_open_tab_steps(steps, factory, menu_text, menu_item_text)
      steps.concat([
        #navigate to menu item, open it and then close
        factory.create_click("打开\"#{menu_text}\"菜单", :class=>"menu-txt", :text=>menu_text),
        factory.create_click("打开\"#{menu_item_text}\"页面", :tag_name=>"span", :text=>menu_item_text),
        factory.create_verify("等待加载完成", false, :class=>"loadingMark"),
        factory.create_click("关闭\"#{menu_item_text}\"页面", :class=>"tab-close", :title=>"关闭")
      ])
    end
    
    
    private
    def build_scroll_menu_steps(steps, factory, offset)
      if(offset > @current_offset)
        @current_offset.upto(offset-1) do
          steps.push(factory.create_click("向下滚动菜单", :tag_name=>"span", :class=>"lv2-menu-btn-down-arrow"))
        end
      end
      if(offset < @current_offset)
        offset.upto(@current_offset-1) do
          steps.push(factory.create_click("向上滚动菜单", :tag_name=>"span", :class=>"lv2-menu-btn-up-arrow"))
        end
      end
      
      @current_offset = offset
    end
    
    private
    def set_verify_elements(steps)
      0.upto(steps.length-2) do |index|
        step = steps[index]
        next_step = steps[index+1]
        step.verify_element_options = next_step.options if(next_step.options != {})
        step.verify_expected = next_step.expected if next_step.class == VerifyElementStep
      end
    end
  end
end
