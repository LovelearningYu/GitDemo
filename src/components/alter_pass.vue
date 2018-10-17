<template>
<el-container>
<el-header style="height: 89px;">
<el-col :span="24">
  <img id="u8_img" src="../assets/u8.png">
  <div id="logotitle" class="fontlay" style="cursor:pointer" @click="info">采血站</div>
  <img id="u942_img" src="../assets/u942.png">
  <div id="text1lay" class="fontlay smaltitle"><span style="cursor:pointer">修改密码</span></div>
  <div class="topbar-account">
  <div id="text2lay" class="fontlay smaltitle"><span style="cursor:pointer" @click="jumpTo('/main')">返回主页</span></div>
  </div>
  </el-col>
</el-header>
<img id="u7_img" src="../assets/u7.png">
<el-main>
<el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
<h2>修改密码</h2>

<el-form-item prop="oldpass"><el-input type="text" placeholder="原密码" v-model="ruleForm.oldpass"></el-input></el-form-item>
<el-form-item prop="pass"><el-input type="password" placeholder="密码" v-model="ruleForm.pass"></el-input></el-form-item>
<el-form-item prop="checkpass"><el-input type="password" placeholder="确认密码" v-model="ruleForm.checkpass"></el-input></el-form-item>
 <el-form-item>
  <el-button type="primary" @click="submitForm('ruleForm')">确认修改</el-button></el-form-item>


</el-form>
</el-main>

</el-container>
</template>

<script>
export default {
  data () {
    var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm.checkpass !== '') {
            this.$refs.ruleForm.validateField('checkpass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
    return {
    ruleForm:{
        oldpass:'',
        pass:'',
        checkpass:'',
      },
      rules:{
        oldpass:[{ required: true, message: '请输入原密码', trigger: 'blur' },],
        pass:[{ required: true, message: '请输入密码', trigger: 'blur' }],
        checkpass: [{ validator: validatePass2, trigger: 'blur' }],      
        }
    };
  },
  methods:{
    submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            $.ajax({
            url: 'http://localhost/data.php?act=alterpwd',
            method: 'post',
            data: { name: this.ruleForm.name, resource: this.ruleForm.resource},
            dataType: 'json',
            success: function(res) {
              bnum1.max=res
            }
          });
            this.$router.push({ path: '/' });
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
    jumpTo(url){
        this.defaultActiveIndex = url;
        this.$router.push(url); //用go刷新
      },
      info() {
        this.$message('Called love everyone, see flowers bloom, see a small white car car tire of the waves is me');
      },
      okopen() {
        this.$message({
          message: '验证码为5201314 请输入',
          type: 'success'
        });
      },
      duanxin() {
        this.$message({
          message: '已发送至您的手机，请注意查收',
          type: 'success'
        });
      },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
<style scoped>
.fontlay{
    font-family: 'ArialMT', 'Arial';
    font-weight: 400;
    font-style: normal;
    font-size: 13px;
    color: #333333;
    text-align: center;
    line-height: normal;
}
.smaltitle{
    font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-style: normal;
    font-size: 16px;
    text-align: left;
}
.label{
    font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-style: normal;
    font-size: 14px;
    text-align: left;
    color: #B2976A;
}
.el-container{
  width: 100%;
}
.el-header{
  border-width: 0px;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 89px;
  background: inherit;
  background-color: rgba(255, 255, 255, 1);
  border: none;
  border-radius: 0px;
  box-shadow: none;
}
#u8_img {
    border-width: 0px;
    position: absolute;
    left: 30px;
    top: 15px;
    width: 148px;
    height: 60px;
}
#logotitle{
    border-width: 0px;
    position: absolute;
    left: 32px;
    top: 37px;
    width: 144px;
    word-wrap: break-word;
}
#u942_img{
    border-width: 0px;
    position: absolute;
    left: 219px;
    top: 15px;
    width: 2px;
    height: 61px;
}
#text1lay{
    border-width: 0px;
    position: absolute;
    left: 252px;
    top: 34px;
    width: 33px;
    white-space: nowrap;
}
#text2lay{
    border-width: 0px;
    float:right;
    margin-right:30px;
    margin-top: 35px;
    width: 37px;
    height: 25px;
    white-space: nowrap;
}
.u7img{
  border-width: 0px;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 1441px;
  height: 2px;
}
.el-form{
  margin-top:55px;
}
.el-form-item{
  margin-top:30px;
  height:18px;
}
h2{
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-style: normal; 
    font-size: 20px;
}
#label1lay{
  position: absolute;
  border-width: 0px;
  margin-left: -150px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}
#label2lay{
  position: absolute;
  border-width: 0px;
  margin-left: 90px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}
.el-input{
  border:none;
  outline:none;
  border-bottom:1px solid rgba(204, 204, 204, 1);
  width: 300px;
  height: 30px;
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
  font-size: 14px;
  text-align: left;
  outline-style: none;
}
button{
  width:320px;
  height:35px;
  background-color:rgba(178, 151, 106, 1);
  border:none;
  font-size:15px;
  color:#FFFFFF;
  margin-top:5px;
}
</style>
