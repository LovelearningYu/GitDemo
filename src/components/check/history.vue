<template>
  <el-row class="warp">
    <el-col :span="24" class="warp-main">
      <section class="chart-container">
        <el-row>
          <el-col :span="12">
            <div id="chartColumn" style="width:100%; height:400px;"></div>
          </el-col>
          <el-col :span="12">
            <div id="chartBar" style="width:100%; height:400px;"></div>
          </el-col>
          <el-col :span="12">
            <div id="chartLine" style="width:100%; height:400px;"></div>
          </el-col>
          <el-col :span="12">
            <div id="chartPie" style="width:100%; height:400px;"></div>
          </el-col>
          <el-col :span="24">
            <a href="http://echarts.baidu.com/examples.html" target="_blank" style="float: right;">more>></a>
          </el-col>
        </el-row>
      </section>

    </el-col>
  </el-row>
</template>
<style>
  .chart-container {
    width: 100%;
  }
  .chart-container .el-col {
    padding: 30px 20px;
  }
</style>

<script>
  import echarts from 'echarts'

  export default {
    data() {
      return {
        chartColumn: null,
        chartBar: null,
        chartLine: null,
        chartPie: null
      };
    },
    mounted: function () {
      var _this = this;
      //基于准备好的dom，初始化echarts实例
      this.chartColumn = echarts.init(document.getElementById('chartColumn'));
      this.chartBar = echarts.init(document.getElementById('chartBar'));
      this.chartLine = echarts.init(document.getElementById('chartLine'));
      this.chartPie = echarts.init(document.getElementById('chartPie'));

      this.chartColumn.setOption({
        title: { text: 'Column Chart' },
        tooltip: {},
        xAxis: {
          data: ["A型血", "B型血", "AB型血", "O型血", "熊猫血", "黄金血"]
        },
        yAxis: {},
        series: [{
          name: '采集量',
          type: 'bar',
          data: [20, 15, 8, 10, 5, 2]
        }]
      });

      this.chartBar.setOption({
        title: {
          text: 'Bar Chart',
          subtext: '数据来自网络'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {
          data: ['2016年', '2017年']
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'value',
          boundaryGap: [0, 0.01]
        },
        yAxis: {
          type: 'category',
          data: ['巴西', '印尼', '美国', '印度', '中国', '世界人口(万)']
        },
        series: [
          {
            name: '2016年',
            type: 'bar',
            data: [18203, 23489, 29034, 104970, 131744, 630230]
          },
          {
            name: '2017年',
            type: 'bar',
            data: [19325, 23438, 31000, 121594, 134141, 681807]
          }
        ]
      });

      this.chartLine.setOption({
        title: {
          text: 'Line Chart'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['危险血液', '待检血液', '健康血液']
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            name: '健康血液',
            type: 'line',
            stack: '毫升量',
            data: [120, 132, 101, 134, 90, 230, 210]
          },
          {
            name: '待检血液',
            type: 'line',
            stack: '毫升量',
            data: [220, 240, 190, 230, 278, 330, 405]
          },
          {
            name: '危险血液',
            type: 'line',
            stack: '毫升量',
            data: [20, 44, 14, 9, 38, 64, 102]
          }
        ]
      });

      this.chartPie.setOption({
        title: {
          text: 'Pie Chart',
          subtext: '数据以供参考',
          x: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: ['A型血液', 'B型血液', 'AB型血液', 'O型血液', 'R阴性血（熊猫血）']
        },
        series: [
          {
            name: '访问来源',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
              { value: 1335, name: 'A型血液' },
              { value: 780, name: 'B型血液' },
              { value: 340, name: 'AB型血液' },
              { value: 500, name: 'O型血液' },
              { value: 148, name: 'R阴性血（熊猫血）' }
            ],
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      });
    }
  }
</script>
