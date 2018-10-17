<template>
  <div>
    <el-breadcrumb separator="/">
      <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">用户管理</span>
      </el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">用户列表</span>
      </el-breadcrumb-item>
    </el-breadcrumb>
    <el-table :data="tableData5" style="width: 100%;text-align:left;margin-top:20px;">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="用户名">
              <span>{{ props.row.user_name }}</span>
            </el-form-item>
            <el-form-item label="所属部门">
              <span>{{ props.row.department }}</span>
            </el-form-item>
            <el-form-item label="用户 ID">
              <span>{{ props.row.user_id }}</span>
            </el-form-item>
            <el-form-item label="部门 ID">
              <span>{{ props.row.departmentId }}</span>
            </el-form-item>
            <el-form-item label="部门地址">
              <span>{{ props.row.address }}</span>
            </el-form-item>
            <el-form-item label="用户描述">
              <span>{{ props.row.desc }}</span>
            </el-form-item>
            <el-form-item label="联系电话">
              <span>{{ props.row.tel }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column label="用户 ID" prop="user_id">
      </el-table-column>
      <el-table-column label="用户名" prop="user_name">
      </el-table-column>
      <el-table-column label="描述" prop="desc">
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableData5: []
    }
  },
  created: function() {
    var data = []
    let _this = this
    $.ajax({
      type: "get",
      dataType: "json",
      url: "http://localhost/data.php?act=user",
      success: function(res) {
        for (var i = 0; i < res.length; i++) {
          var obj = {}
          obj.user_id = res[i].userID
          obj.user_name = res[i].userName
          obj.desc = res[i].userScrip
          obj.tel = res[i].userTel
          obj.address = res[i].dptadr
          obj.departmentId = res[i].dptID
          obj.department = res[i].dptName
          data[i] = obj
        }
        _this.tableData5 = data
      },
      error: function(json) {
        alert("加载失败");
      }
    });
  },
}
</script>
<style>
.demo-table-expand {
  font-size: 0;
}

.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>