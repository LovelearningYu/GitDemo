<template>
<el-container>
<el-header style="height: 89px;">
<el-col :span="24">
  <img id="u8_img" src="../assets/u8.png">
  <div id="logotitle" class="fontlay" style="cursor:pointer" @click="info">采血站</div>
  <img id="u942_img" src="../assets/u942.png">
  <div id="text1lay" class="fontlay smaltitle"><span style="cursor:pointer">找回密码</span></div>
  <div class="topbar-account">
  <div id="text2lay" class="fontlay smaltitle"><span style="cursor:pointer" @click="jumpTo('/')">登录</span></div>
  </div>
  </el-col>
</el-header>
<img id="u7_img" src="../assets/u7.png">
<el-main>
<el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
<h2>找回登录密码</h2>
<el-form-item prop="email"><el-input type="text" placeholder="邮箱地址" v-model="ruleForm.email"></el-input></el-form-item>
<el-form-item prop="tel"><el-input type="text" placeholder="手机号码" v-model.number="ruleForm.tel"></el-input></el-form-item>
<el-form-item prop="proving">
<el-input type="text" placeholder="验证码" v-model="ruleForm.proving" @blur="checkLpicma" style="width:190px"></el-input>
<input type="button" id="code" @click="createCode" v-model="checkCode" style="width:110px;height:35px;"/> 
</el-form-item>
<el-form-item prop="note"><el-input type="text" placeholder="短信验证码" v-model="ruleForm.note" style="width:160px;" :disabled="true"></el-input>
<el-button v-show="show" @click="getCode" style="width:140px">获取短信验证码</el-button>
<el-button v-show="!show" style="width:130px" class="count">{{count}} s</el-button>
</el-form-item>
<el-form-item prop="pass"><el-input type="password" placeholder="密码" v-model="ruleForm.pass"></el-input></el-form-item>
<el-form-item prop="checkpass"><el-input type="password" placeholder="确认密码" v-model="ruleForm.checkpass"></el-input></el-form-item>

 <el-form-item> <el-button @click="submitForm('ruleForm')">完成</el-button></el-form-item>


</el-form>
</el-main>

</el-container>
</template>

<script>
var code ; //在全局定义验证码
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
      show: true,
   count: '',
   timer: null,
      checkCode:'',
      ruleForm:{
        email:'',
        tel:'',
        proving:'',
        note:'',
        pass:'',
        checkpass:'',
      },
      rules:{
        email:[{ required: true, message: '请输入邮箱地址', trigger: 'blur' },
            { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }],
        tel:[{ required: true, message: '请输入手机号码', trigger: 'blur' },
            { type: 'number', message: '手机号码为数字', trigger:'blur' }],
        pass:[{ required: true, message: '请输入密码', trigger: 'blur' }],
        proving:[{ required: true, message: '请输入验证码', trigger: 'blur' }],
        checkpass: [{ validator: validatePass2, trigger: 'blur' }],
      }
    };
  },
  methods:{
    // 图片验证码
createCode(){
  code = ""; 
  var codeLength = 4;//验证码的长度 
  var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 
     'S','T','U','V','W','X','Y','Z');//随机数 
  for(var i = 0; i < codeLength; i++) {
   //循环操作 
   var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35） 
   code += random[index];//根据索引取得随机数加到code上 
  } 
  this.checkCode = code;//把code值赋给验证码 
},
// 失焦验证图和密码
checkLpicma(){   
  this.ruleForm.proving.toUpperCase();//取得输入的验证码并转化为大写   
  if(this.ruleForm.proving == '') {
  }else if(this.ruleForm.proving.toUpperCase() != this.checkCode ) { 
   //若输入的验证码与产生的验证码不一致时 
   alert("验证码不正确")
   this.createCode();//刷新验证码 
   this.ruleForm.proving = '';
  }else {
   return true;
  } 
},
//短信验证码
    getCode(){
      this.$message({
          message: '已发送至您的手机，请注意查收',
          type: 'success'
        });
     const TIME_COUNT = 60;
     if (!this.timer) {
       this.count = TIME_COUNT;
       this.show = false;
       this.timer = setInterval(() => {
       if (this.count > 0 && this.count <= TIME_COUNT) {
         this.count--;
        } else {
         this.show = true;
         clearInterval(this.timer);
         this.timer = null;
        }
       }, 1000)
      }
   }  ,
submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$message({
          message: '密码修改成功',
          type: 'success'
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
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

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
  width: 101%;
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
.el-form-item {
      margin-top: 35px;
      height: 20px;
    }
</style>
