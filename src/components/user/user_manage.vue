<template>
  <div>
    <el-breadcrumb separator="/">
      <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">用户管理</span>
      </el-breadcrumb-item>
      <el-breadcrumb-item>
        <span style="cursor:pointer;color:#909399">管理用户</span>
      </el-breadcrumb-item>
    </el-breadcrumb>
    <el-input placeholder="请输入内容" v-model="userName" class="input-with-select" style="margin-top:20px">
      <el-button slot="append" icon="el-icon-search" @click="doFilter"></el-button>
    </el-input>
    <el-table :data="tableData4" style="width: 100%;text-align:left">
      <el-table-column fixed prop="user_id" label="ID">
      </el-table-column>
      <el-table-column prop="user_name" label="姓名">
      </el-table-column>
      <el-table-column prop="department" label="部门">
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="120">
        <template slot-scope="scope">
          <el-button @click.native.prevent="deleteRow(scope.$index, tableData4)" type="text" size="small">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
    data() {
    return {
      tableData4: [],
      userName: "",
      tableDataBegin:[],
      tableDataEnd: [],
      flag: false

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
          obj.department = res[i].userDpt

          data[i] = obj
        }
        _this.tableData4 = data
        _this.tableDataBegin = data
      },
      error: function(json) {
        alert("加载失败");
      }
    });
  },
  methods: {

    deleteRow(index, rows) {
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log(rows[index].user_id)
        $.ajax({
          type: "post",
          data: { id: rows[index].user_id },
          dataType: "json",
          url: "http://localhost/data.php?act=deluser",
          success: function(res) {
            if (res == 1) {
              alert('删除成功')
              rows.splice(index, 1);
            } else {
              alert('删除失败')
            }
          }
        });
        this.$message({
          type: 'success',
          message: '删除成功!'
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });

    },
    doFilter() {
      if (this.userName == "") {
        this.$message.warning("查询条件不能为空！");
        return;
      }
      this.tableDataEnd = []
      this.tableDataBegin.forEach((value, index) => {
        if (value.user_name) {
          if (value.user_name.indexOf(this.userName) >= 0) {
            this.tableDataEnd.push(value)
          }
        }
      });
      //渲染表格,根据值
      this.tableData4=this.tableDataEnd
      //页面初始化数据需要判断是否检索过
      this.flag = true
    }
  }

}
</script>
<style>

</style>