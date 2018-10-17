<template>
  <el-row>
    <el-col :span="25">
      <h2>其他功能</h2>
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="账号添加须知" name="first">
          尊敬的用户：您们好！ <br> 欢迎登录采血站血液管理系统
          <br> 更欢迎大家进入采血站血液管理系统注册功能，使用本系统进行采血站的用户注册，为了使新用户及广大老用户都能够尽快熟悉这一新的系统，更方便、快捷、安全的进行登记和查询，特做以下"用户须知"，请在应用前认真阅读，并参照使用。
          <br> 谢谢！
          <br> 如果您有任何意见反馈，请按照本网站公布的方式或电话联系我们。
          <br>
          <hr>
          <p style="color:red">谨记:添加用户必须为该采血站内部工作人员，禁止增添无关人员，一经发现，后果自负！！！</p>
        </el-tab-pane>
        <el-tab-pane label="内部账号注册" name="second">
          <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
            <h2>注册系统账号</h2>
            <el-form-item prop="name">
              <el-input type="text" placeholder="用户名" v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item prop="tel">
              <el-input type="text" placeholder="手机号码" v-model.number="ruleForm.tel"></el-input>
            </el-form-item>
            <el-form-item prop="email">
              <el-input type="text" placeholder="邮箱地址" v-model="ruleForm.email"></el-input>
            </el-form-item>
            <el-form-item prop="dpt">
              <el-input type="text" placeholder="所在部门" v-model.number="ruleForm.dpt"></el-input>
            </el-form-item>
            <el-form-item prop="proving">
              <el-input type="text" placeholder="验证码" v-model="ruleForm.proving" @blur="checkLpicma" style="width:190px"></el-input>
              <input type="button" id="code" @click="createCode" v-model="checkCode" style="width:105px;height:35px" />
            </el-form-item>
            <el-form-item prop="note">
              <el-input type="text" placeholder="短信验证码" v-model="ruleForm.note" style="width:160px;" :disabled="true"></el-input>
              <el-button v-show="show" @click="getCode" style="width:140px">获取短信验证码</el-button>
              <el-button v-show="!show" style="width:130px" class="count">{{count}} s</el-button>
            </el-form-item>
            <el-form-item prop="pass">
              <el-input type="password" placeholder="密码" v-model="ruleForm.pass"></el-input>
            </el-form-item>
            <el-form-item prop="checkpass">
              <el-input type="password" placeholder="确认密码" v-model="ruleForm.checkpass"></el-input>
            </el-form-item>
            <el-form-item prop="scrip">
              <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="请输入用户特征" v-model="ruleForm.scrip" style="width:300px;">
              </el-input>
            </el-form-item>

            <el-form-item prop="checkbox">
              <el-checkbox v-model="ruleForm.checkbox">
                <span style="color:#999999">我已阅读并同意</span>
                <span style="color:#B2976A">本系统用户服务条款</span>
                <span style="color:#999999">和</span>
                <span style="color:#B2976A">隐私政策</span>
              </el-checkbox>
            </el-form-item>
            <el-form-item>
              <el-button @click="submitForm('ruleForm')">立即注册</el-button>
            </el-form-item>

          </el-form>
        </el-tab-pane>
        <el-tab-pane label="文件上传" name="third">
          <el-upload class="upload-demo" drag action="https://jsonplaceholder.typicode.com/posts/" multiple>
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或
              <em>点击上传</em>
            </div>
            <div class="el-upload__tip" slot="tip">只能上传个别类型文件，且不超过500kb</div>
          </el-upload>
        </el-tab-pane>
        <el-tab-pane label="今日娱乐" name="fourth">
          <div>
            <p>今日心情值：{{temperature}}娱乐值</p>
            <p>工作建议：{{this.suggestion}}</p>
            <p>
              <button @click="add">升高心情值</button>
              <button @click="reduce">降低心情值</button>
            </p>
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-col>

  </el-row>
</template>
<script>
import Axios from "axios"
import $ from 'jquery'
var code; //在全局定义验证码
var suggestion = [
  '开心到炸---你都这么开心了，是不是需要去开开心心的工作了呢。下班后记得给大家分享分享开心的事情啊，独乐乐不如众乐乐', 
  '开心---恭喜你有个好心情，继续保持哦，美好的心情，美好的一天，美好的你如此美好', 
  '中等心情---亲爱的，是不是遇到什么不好的事情了，傻瓜，不要憋在心里，我们大家都在，我们是你最可靠的大树', 
  '低情绪---首先，找个板凳坐下来休息，静静的看着我为你而书写的话语，给你看一则故事：男：“有的人的梦想是成为画家，有的人的梦想是成为作家，你知道我的梦想是什么吗？”女：“是什么？”男：“和你成家。”', 
  '低到爆---你去经理办公室，直接请假就可以了，准假！'];
export default {
  data() {
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
      temperature: 50,
      suggestion: '中等心情',
      activeName: 'first',
      show: true,
      count: '',
      timer: null,
      checkCode: '',
      checkbox: true,
      ruleForm: {
        name: '',
        email: '',
        tel: '',
        proving: '',
        note: '',
        pass: '',
        dpt: '',
        scrip: '',
        checkpass: '',
        checkbox: true,
      },
      rules: {
        email: [{ required: true, message: '请输入邮箱地址', trigger: 'blur' },
        { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }],
        tel: [{ required: true, message: '请输入手机号码', trigger: 'blur' },
        { type: 'number', message: '手机号码为数字', trigger: 'blur' }],
        pass: [{ required: true, message: '请输入密码', trigger: 'blur' }],
        proving: [{ required: true, message: '请输入验证码', trigger: 'blur' }],
        checkpass: [{ validator: validatePass2, trigger: 'blur' }],
        name: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
        dpt: [{ required: true, message: '请输入所在部门', trigger: 'blur' }],
        scrip: [{ required: true, message: '请输入用户描述', trigger: 'blur' }]
      }
    };
  },
  methods: {
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
    //短信验证码
    getCode() {
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
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          $.ajax({
            url: 'http://localhost/data.php?act=register',
            method: 'post',
            //注册表单需要完善用户姓名、用户单位、用户描述、用户密码属性修改
            data: { user: this.ruleForm.name, tel: this.ruleForm.tel, email: this.ruleForm.email, pwd: this.ruleForm.pass, dpt: this.ruleForm.dpt, scrip: this.ruleForm.scrip },
            dataType: 'json',
            success: function(data) {
              if (data == 1) {
                //注册成功 提示注册成功后跳转至登录页
                window.location.href = "http://localhost:8080/#/";
              } else if (data == 2) {
                alert('已经拥有该用户名');
                return false;
              } else {
                alert('注册失败');
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
    info() {
      this.$message('Called love everyone, see flowers bloom, see a small white car car tire of the waves is me');
    },
    duanxin() {
      this.$message({
        message: '已发送至您的手机，请注意查收',
        type: 'success'
      });
    },
    add: function() {
      this.temperature += 5;
    },
    reduce: function() {
      this.temperature -= 5;
    }
  },
  watch: {
    temperature: function(newVal, oldVal) {
      if (newVal < 0) {
        this.suggestion = suggestion[4];
      } else if (newVal < 30 && newVal >= 0) {
        this.suggestion = suggestion[3];
      } else if (newVal < 60 && newVal >= 30) {
        this.suggestion = suggestion[2];
      } else if (newVal <= 100 && newVal >= 60) {
        this.suggestion = suggestion[1];
      } else {
        this.suggestion = suggestion[0];
      }
    }
  }
}
</script>
<style>
.el-row {
  margin-top: 5px;
  margin-bottom: 20px;
  margin-left: 100px;
  text-align: left;
}

h2 {
  font-size: 24px;
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
  font-weight: 400;
  font-style: normal;
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