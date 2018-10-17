<template>
  <div>
    <el-breadcrumb separator="/">
      <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">血液管理</span>
      </el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">血液库存</span>
      </el-breadcrumb-item>
    </el-breadcrumb>
    <el-table :data="tableData6" border height="340" :summary-method="getSummaries" show-summary style="width: 100%; margin-top: 20px;">
      <el-table-column prop="blood_id" label="血液编号" width="180">
      </el-table-column>
      <el-table-column prop="blood_name" label="血液名">
      </el-table-column>
      <el-table-column prop="goodblood" label="健康血液（毫升）">
      </el-table-column>
      <el-table-column prop="badblood" label="危险血液（毫升）">
      </el-table-column>
      <el-table-column prop="checkblood" label="检查血液（毫升）">
      </el-table-column>
      <el-table-column prop="transportbld" label="运输血液（毫升）">
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableData6: []
    }
  }, created: function() {
    var data = []
    let _this = this
    $.ajax({
      type: "get",
      dataType: "json",
      url: "http://localhost/data.php?act=bloodinfo",
      success: function(res) {
        for (var i = 0; i < res.length; i++) {
          var obj = {}
          obj.blood_id = res[i].bldCode
          obj.blood_name = res[i].bldName
          obj.goodblood = res[i].healthbld
          obj.badblood = res[i].dangerbld
          obj.checkblood = res[i].checkbld
          obj.transportbld = res[i].transportbld
          data[i] = obj
        }
        _this.tableData6 = data
      },
      error: function(json) {
        alert("加载失败");
      }
    });
  },
  methods: {

    getSummaries(param) {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = '总量';
          return;
        }
        const values = data.map(item => Number(item[column.property]));
        if (!values.every(value => isNaN(value))) {
          sums[index] = values.reduce((prev, curr) => {
            const value = Number(curr);
            if (!isNaN(value)) {
              return prev + curr;
            } else {
              return prev;
            }
          }, 0);
          sums[index] += ' 毫升';
        } else {
          sums[index] = 'N/A';
        }
      });
      return sums;
    }
  }
};
</script>
<style>

</style>