<template>
    <div>
       <el-breadcrumb separator="/">
<el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">血液检查</span></el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">检查进度</span></el-breadcrumb-item>
</el-breadcrumb>
<el-tabs type="border-card" style="margin-top:20px;text-align:left">
  <el-tab-pane>
    <span slot="label"><i class="icon iconfont icon-transfusion"></i> 初步检测</span>
    <div class="block">
    <span class="demonstration">细菌感染值</span>
    <el-slider v-model="value1"></el-slider>
  </div>
<div class="block">
    <span class="demonstration">初步认定健康值</span>
    <el-slider v-model="value2"></el-slider>
  </div>
<div class="block">
    <span class="demonstration" style="color:#8e71c7">检查进度与深度</span>
    <el-slider v-model="value3"></el-slider>
  </div>
  <div class="block">
    <span class="demonstration">危险等级</span>
    <el-slider v-model="value4" :format-tooltip="formatTooltip"></el-slider>
  </div>
<div class="block">
    <span class="demonstration">跟进检查程度</span>
    <el-slider v-model="value5" disabled></el-slider>
  </div>  </el-tab-pane>
  <el-tab-pane>
    <span slot="label"><i class="icon iconfont icon-blood"></i> 深入血浆检查</span>
    <el-progress :text-inside="true" :stroke-width="15" :percentage="2" style="line-height:40px"></el-progress>
<el-progress :text-inside="true" :stroke-width="18" :percentage="35" style="line-height:40px"></el-progress>
<el-progress :text-inside="true" :stroke-width="28" :percentage="42" style="line-height:40px" color="rgba(142, 113, 199, 0.7)"></el-progress>
<el-progress :text-inside="true" :stroke-width="30" :percentage="68" style="line-height:40px" status="success"></el-progress>
<el-progress :text-inside="true" :stroke-width="25" :percentage="94" style="line-height:40px" status="exception"></el-progress>
  </el-tab-pane>
  <el-tab-pane>
    <span slot="label"><i class="icon iconfont icon-shouye2"></i> 血液其他方面检查</span>
    <el-progress type="circle" :percentage="0" width="80"></el-progress>
<el-progress type="circle" :percentage="25" width="120"></el-progress>
<el-progress type="circle" :percentage="60" color="#8e71c7" width="160"></el-progress>
<el-progress type="circle" :percentage="100" status="success" width="100"></el-progress>
<el-progress type="circle" :percentage="50" status="exception" width="140"></el-progress>
  <div id="animation"></div>
  </el-tab-pane>
</el-tabs>
    </div>
</template>
<script>
     export default {
    data() {
      return {
        active: 0,
        value1: 10,
        value2:50,
        value3:0,
        value4:20,
        value5:45,
      };
    },

    methods: {
        formatTooltip(val) {
        return val / 10;
      },
      next() {
        if (this.active++ > 2) this.active = 0;
      }
    }
  }
</script>
<style>
@keyframes change {
            30%{
                background-color: #DCDFE6;
                width: 250px;
            }
            50%{
                background-color: #E940FF;
                width: 450px;
            }
            100%{
                background-color: #A6FF40;
                width: 850px;
            }
        }
        
        #animation{
            width: 1px;
            height: 30px;
            background-color: #DCDFE6;
            /*使用动画必要的两个属性：1：动画名称 2：动画持续时间*/
            /*1:动画名称*/
            animation-name: change;
            /*2：动画持续时间*/
            animation-duration: 7s;
            /*3：动画使用的速度函数*/
            animation-timing-function: linear;
            /*4：动画的播放次数  取值可以为具体次数  也可以为无限次播放*/
            animation-iteration-count: 1;
            /*5：动画在下一次播放的方向 取值可以为 normal（默认） 也可以为 alternate（逆向播放）*/
            animation-direction: normal;
            /*6：动画执行完毕的状态
            1：forwards：动画保持最后的显示效果
            2：backwards:动画回到最初的显示效果*/
            animation-fill-mode: forwards;
            /*7：动画延迟开始的时间*/
            animation-delay: 0.5s;
        }
</style>