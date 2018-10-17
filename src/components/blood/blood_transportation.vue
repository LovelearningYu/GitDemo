<template>
<div>
<el-breadcrumb separator="/">
<el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">血液管理</span></el-breadcrumb-item>
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399">血液运输</span></el-breadcrumb-item>
</el-breadcrumb>
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm" style="text-align:left;margin-top:20px">
  <el-form-item label="血液名称" prop="name">
    <el-select v-model="ruleForm.name" v-on:change="aa()" placeholder="请选择血液类型名">
      <el-option label="A型血" value="A"></el-option>
      <el-option label="B型血" value="B"></el-option>
      <el-option label="AB型血" value="AB"></el-option>
      <el-option label="O型血" value="O"></el-option>
      <el-option label="RH阴性血" value="RH阴"></el-option>
    </el-select>
  </el-form-item>
  <el-form-item label="运送区域" prop="region">
    <el-select v-model="ruleForm.region">
      <el-option label="血液总站" value="shanghai"></el-option>
      <el-option label="血液处理站" value="beijing"></el-option>
    </el-select>
  </el-form-item>
  <el-form-item label="运送时间" required>
    <el-col :span="11">
      <el-form-item prop="date1">
        <el-date-picker type="date" placeholder="选择日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>
      </el-form-item>
    </el-col>
    <el-col class="line" :span="2">&nbsp&nbsp————</el-col>
    <el-col :span="11">
      <el-form-item prop="date2">
        <el-time-picker type="fixed-time" placeholder="路途时间" v-model="ruleForm.date2" style="width: 100%;"></el-time-picker>
      </el-form-item>
    </el-col>
  </el-form-item>
  <el-form-item label="立即运输" prop="delivery">
    <el-switch v-model="ruleForm.delivery"></el-switch>
  </el-form-item>
  <el-form-item label="运输性质" prop="type">
    <el-checkbox-group v-model="ruleForm.type">
      <el-checkbox label="发往总站库存" name="type"></el-checkbox>
      <el-checkbox label="发往总站应急" name="type"></el-checkbox>
      <el-checkbox label="发往总站检测" name="type"></el-checkbox>
      <el-checkbox label="发往处理站处理" name="type"></el-checkbox>
    </el-checkbox-group>
  </el-form-item>
  <el-form-item label="血液质量"  prop="resource">
    <el-radio-group v-model="ruleForm.resource" v-on:change="aa()">
      <el-radio label="安全"></el-radio>
      <el-radio label="检查"></el-radio>
      <el-radio label="危险"></el-radio>
    </el-radio-group>
  </el-form-item>
  <el-form-item label="运输数量" prop="num">
  <el-input-number v-model="ruleForm.num" controls-position="right" :min="1" ref="bnum1"></el-input-number>
</el-form-item>
  <el-form-item label="运输形式" prop="desc">
    <el-input type="textarea" v-model="ruleForm.desc"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="submitForm('ruleForm')">立即运送</el-button>
    <el-button @click="resetForm('ruleForm')">重置</el-button>
  </el-form-item>
</el-form>
</div>
</template>
<script>
    export default {
    data() {
      return {
        ruleForm: {
          name: 'A',
          region: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
          resource: '安全',
          desc: '',
          num: '1'
        },
        rules: {
          name: [
            { required: true, message: '请输入血液名称', trigger: 'blur' },
            { min: 1, max: 7, message: '长度在 1 到 7 个字符', trigger: 'blur' }
          ],
          region: [
            { required: true, message: '请选择运输区域', trigger: 'change' }
          ],
          date1: [
            { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
          ],
          date2: [
            { type: 'date', required: true, message: '请选择时间', trigger: 'change' }
          ],
          type: [
            { type: 'array', required: true, message: '请至少选择一个运输性质', trigger: 'change' }
          ],
          resource: [
            { required: true, message: '请选择血液质量', trigger: 'change' }
          ],
          desc: [
            { required: true, message: '请填写运输形式', trigger: 'blur' }
          ]
        }
      };
    },  
  mounted () {  
    this.aa();
  },  
    methods: {
      // init(){
      //   let bnum1=this.$refs.bnum1
      //  $.ajax({
      //       url: 'http://localhost/data.php?act=bloodnum',
      //       method: 'post',
      //       data: { name: this.ruleForm.name, resource: this.ruleForm.resource},
      //       dataType: 'json',
      //       success: function(res) {
      //         bnum1.max=res
      //       }                   
      //     });

      // },
    aa(){
      let bnum1=this.$refs.bnum1
      $.ajax({
            url: 'http://localhost/data.php?act=bloodnum',
            method: 'post',
            data: { name: this.ruleForm.name, resource: this.ruleForm.resource},
            dataType: 'json',
            success: function(res) {
              bnum1.max=res
            }
          });
    },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
             $.ajax({
            url: 'http://localhost/data.php?act=bloodtra',
            method: 'post',
            data: { name: this.ruleForm.name, resource: this.ruleForm.resource , num: this.ruleForm.num},
            dataType: 'json',
            success: function(res) {
              if(res==1){
                alert('运输成功！');
              }else{
                alert('运输失败！');
              }
            }
          });
            // this.$router.push('/main')
          } else {
            alert('运输失败！');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>
<style>

</style>