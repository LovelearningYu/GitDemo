<template>
<div id="print">
<div>
<el-breadcrumb separator="/">
<el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">血液检查</span></el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">结果分析</span></el-breadcrumb-item>
</el-breadcrumb>
    <el-transfer style="text-align:left"
    filterable
    :filter-method="filterMethod"
    filter-placeholder="请输入血型拼音"
    v-model="value2"
    :data="data2" :titles="['检查','结果']">
  </el-transfer>
  <el-button class="butlay" @click.prevent="doPrint">打印<i class="el-icon-upload el-icon--right"></i></el-button>
  </div>
  </div>
</template>
<script>
    export default {
    data() {
      const generateData2 = _ => {
        const data = [];
        const types = ['A型血', 'B型血', 'AB型血', 'O型血', '熊猫型血', '血清正常', '血浆正常'];
        const pinyin = ['A', 'B', 'AB', 'O', 'xiongmao', 'xueqing', 'xuejiang'];
        types.forEach((type, index) => {
          data.push({
            label: type,
            key: index,
            pinyin: pinyin[index]
          });
        });
        return data;
      };
      return {
        data2: generateData2(),
        value2: [],
        filterMethod(query, item) {
          return item.pinyin.indexOf(query) > -1;
        }
      };
    },
    methods:{
      doPrint(){
        let subOutputRankPrint = document.getElementById('print');
        let newContent = subOutputRankPrint.innerHTML;
        let oldContent = document.body.innerHTML;
        document.body.innerHTML = newContent;
        window.print();
        window.location.reload();
        document.body.innerHTML = oldContend;
        return false;
      }
    }
  };
</script>
<style>
.butlay{
  position: absolute;
  background-color: pink;
  margin-left:170px;
  margin-top:-100px;
}
</style>