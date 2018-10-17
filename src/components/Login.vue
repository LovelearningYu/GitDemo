<template>
  <el-container>
    <el-header style="height: 89px;">
      <el-col :span="24">
        <img id="u8_img" src="../assets/u8.png">
        <div id="logotitle" class="fontlay" style="cursor:pointer" @click="info">采血站</div>
        <img id="u942_img" src="../assets/u942.png">
        <div id="text1lay" class="fontlay smaltitle">
          <span style="cursor:pointer">登录</span>
        </div>
        <div class="topbar-account">
          <div id="text2lay" class="fontlay smaltitle">
            <span style="cursor:pointer" @click="notopen">注册</span>
          </div>
        </div>
      </el-col>
    </el-header>
    <img id="u7_img" src="../assets/u7.png">
    <el-main>
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
        <h2>欢迎登录采血站血液管理系统</h2>
        <el-form-item prop="name">
          <el-input type="text" prefix-icon="el-icon-info" placeholder="用户名" v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item prop="pass">
          <el-input type="password" prefix-icon="el-icon-warning" placeholder="密码" v-model="ruleForm.pass"></el-input>
        </el-form-item>
        <el-form-item prop="proving">
          <el-input type="text" placeholder="验证码" v-model="ruleForm.proving" @blur="checkLpicma" style="width:190px"></el-input>
          <input type="button" id="code" @click="createCode" v-model="checkCode" style="width:105px;height:35px;">
        </el-form-item>
        <el-form-item>
          <span id="label1lay" class="fontlay label" @click="jumpTo('/find_pass')" style="cursor:pointer">忘记密码？</span>
          <span id="label2lay" class="fontlay label" @click="notopen" style="cursor:pointer">立即注册</span>
        </el-form-item>
        <el-form-item>
          <el-button @click="submitForm('ruleForm')">登录</el-button>
        </el-form-item>

      </el-form>
    </el-main>

  </el-container>
</template>

<script> 
import Axios from "axios"
import $ from 'jquery'
var code; //在全局定义验证码
export default {

  data() {
    return {
      checkCode: '',
      ruleForm: {
        name: '',
        pass: '',
        proving: '',
      },
      rules: {
        name: [{ required: true, message: '请输入用户名', trigger: 'blur' },
        { min: 1, max: 7, message: '长度在 1 到 7 个字符', trigger: 'blur' }],
        pass: [{ required: true, message: '请输入密码', trigger: 'blur' }],
        proving: [{ required: true, message: '请输入验证码', trigger: 'blur' }],
      }
    }
  },
  methods: {
    // 图片验证码
    createCode() {
      code = "";
      var codeLength = 4;//验证码的长度 
      var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数 
      for (var i = 0; i < codeLength; i++) {
        //循环操作 
        var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35） 
        code += random[index];//根据索引取得随机数加到code上 
      }
      this.checkCode = code;//把code值赋给验证码 
    },
    // 失焦验证图和密码
    checkLpicma() {
      this.ruleForm.proving.toUpperCase();//取得输入的验证码并转化为大写   
      if (this.ruleForm.proving == '') {
      } else if (this.ruleForm.proving.toUpperCase() != this.checkCode) {
        //若输入的验证码与产生的验证码不一致时 
        alert("验证码不正确")
        this.createCode();//刷新验证码 
        this.ruleForm.proving = '';
      } else {
        return true;
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          $.ajax({
            url: 'http://localhost/data.php?act=login',
            method: 'post',
            data: { user: this.ruleForm.name, pwd: this.ruleForm.pass },
            dataType: 'json',
            success: function(data) {
              if (data == 1) {
                window.location.href="http://localhost:8080/#/main";
              } else {
                alert('用户名或密码不正确');
                return false;
              }
            }
          });

        }
      });
    },
    jumpTo(url) {
      this.defaultActiveIndex = url;
      this.$router.push(url); //用go刷新
    },
    notopen() {
      this.$message({
        message: '对不起，该系统只能在内部进行注册，请联系内部人员',
        type: 'warning'
      });
    },
    info() {
      this.$message('Called love everyone, see flowers bloom, see a small white car car tire of the waves is me');
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.fontlay {
  font-family: 'ArialMT', 'Arial';
  font-weight: 400;
  font-style: normal;
  font-size: 13px;
  color: #333333;
  text-align: center;
  line-height: normal;
}

.smaltitle {
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
  font-size: 16px;
  text-align: left;
}

.label {
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
  font-size: 14px;
  text-align: left;
  color: #B2976A;
}

.el-container {
  width: 100%;
}

.el-header {
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

#logotitle {
  border-width: 0px;
  position: absolute;
  left: 32px;
  top: 37px;
  width: 144px;
  word-wrap: break-word;
}

#u942_img {
  border-width: 0px;
  position: absolute;
  left: 219px;
  top: 15px;
  width: 2px;
  height: 61px;
}

#text1lay {
  border-width: 0px;
  position: absolute;
  left: 252px;
  top: 34px;
  width: 33px;
  white-space: nowrap;
}

#text2lay {
  border-width: 0px;
  float: right;
  margin-right: 30px;
  margin-top: 35px;
  width: 37px;
  height: 25px;
  white-space: nowrap;
}

.u7img {
  border-width: 0px;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 1441px;
  height: 2px;
}

.el-form {
  margin-top: 55px;
}

.el-form-item {
  margin-top: 30px;
  height: 18px;
}

h2 {
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
  font-size: 20px;
}

#label1lay {
  position: absolute;
  border-width: 0px;
  margin-left: -150px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}

#label2lay {
  position: absolute;
  border-width: 0px;
  margin-left: 90px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}

.el-input {
  border: none;
  outline: none;
  border-bottom: 1px solid rgba(204, 204, 204, 1);
  width: 300px;
  height: 30px;
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
  font-size: 14px;
  text-align: left;
  outline-style: none;
}

button {
  width: 320px;
  height: 35px;
  background-color: rgba(178, 151, 106, 1);
  border: none;
  font-size: 15px;
  color: #FFFFFF;
  margin-top: 5px;
}

.el-form-item {
  margin-top: 35px;
  height: 20px;
}
</style>
