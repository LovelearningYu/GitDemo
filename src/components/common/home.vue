<template>
  <el-container>

  <el-header style="height: 89px;">
<el-col :span="24">
  <img id="u8_img" src="../../assets/u8.png">
  <div id="logotitle" class="fontlay" style="cursor:pointer" @click="info"></div>
  <div id="headertext" class="fontlay _headermenu">
  <el-button-group>
  <el-button @click="back" icon="el-icon-arrow-left">上一步</el-button>
  <el-button @click="go" type="primary">下一步<i class="el-icon-arrow-right el-icon--right"></i></el-button>

  <a href="mailto://guomm@jerei.com?cc=guoyc@jerei.com&bcc=guoxh@jerei.com"><el-button type="primary" icon="el-icon-edit"></el-button></a>

</el-button-group>
</div>
  <div id="text2lay" class="fontlay smaltitle"><el-dropdown trigger="hover">
  <span style="cursor:pointer"><el-button type="success" icon="el-icon-setting" circle style="margin-top:-7px;"></el-button></span>
  <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>
              <div @click="jumpTo('/account')"><span style="color: #555;font-size: 14px;">账号设置</span></div>
            </el-dropdown-item>
            <el-dropdown-item><div @click="jumpTo('/')">退出系统</div></el-dropdown-item>
          </el-dropdown-menu>
  </el-dropdown>
  </div>
  </el-col>
</el-header>
<img id="u7_img" src="../../assets/u7.png">
  <el-container>
    <el-aside width="220px"><el-row class="tac">
    <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
      <el-radio-button :label="false">展开</el-radio-button>
      <el-radio-button :label="true">收起</el-radio-button>
    </el-radio-group>
    <el-menu
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
      @open="handleOpen"
      @close="handleClose"
      @select="handleSelect" router
      :collapse="isCollapse"
    >
    <el-menu-item index="main">
    <i class="icon iconfont icon-fenlei"></i>
    <span slot="title">首页</span>
    </el-menu-item>

    <el-submenu index="user">
    <template slot="title">
    <i class="icon iconfont icon-yonghuguanli"></i>
    <span slot="title">用户管理</span>
    </template>
    <el-menu-item index="user_info"><i class="icon iconfont icon-profile"></i>用户列表</el-menu-item>
    <el-menu-item index="user_manage"><i class="icon iconfont icon-yonghuguanli1"></i>管理用户</el-menu-item>
    </el-submenu>

    <el-submenu index="bloodmanage">
    <template slot="title">
    <i class="icon iconfont icon-shouye2"></i>
    <span slot="title">血液管理</span>
    </template>
    <el-menu-item index="blood_inventory"><i class="icon iconfont icon-cangkucangchu"></i>血液库存</el-menu-item>
    <el-menu-item index="blood_transportation"><i class="icon iconfont icon-yunshuzhongwuliu"></i>血液运输</el-menu-item>
    </el-submenu>
    
    <el-submenu index="bloodcheck">
    <template slot="title">
    <i class="icon iconfont icon-shouye1"></i>
    <span slot="title">血液检查</span>
    </template>
    <el-menu-item index="check_plan"><i class="icon iconfont icon-icon"></i>检查进度</el-menu-item>
    <el-menu-item index="check_analyze"><i class="icon iconfont icon-celiangxietangtongzhi"></i>结果分析</el-menu-item>
    <el-menu-item index="history"><i class="icon iconfont icon-rili-xianxing-xi"></i>历史总结</el-menu-item>
    </el-submenu>

    <el-menu-item index="account">
    <i class="icon iconfont icon-shezhi"></i>
    <span slot="title">其他功能</span>
    </el-menu-item>

    </el-menu>
    </el-row></el-aside>

    <el-container>
      <el-main>
  <transition name="fade" mode="out-in">
    <router-view></router-view>
     </transition>
      </el-main>
      <el-footer style="height: 170px;">
<div id="footerup" class="fontlay">
<el-col :span="4"><div class="font-color _fontright">用户<p>信息查看</p><p>用户管理</p><p>浏览历史</p></div></el-col>
  <el-col :span="2"><div class="font-color" style="width:140px;">血液<p>血液管理</p><p>血液检查</p><p>健康生活</p></div></el-col>
  <el-col :span="2"><div class="font-color">链接<a href="http://element-cn.eleme.io/#/zh-CN"><p>Element</p></a><a href="http://jspang.com/"><p>JsPang</p></a><a href="http://www.iconfont.cn"><p>Iconfont</p></a></div></el-col>
  <el-col :span="15"><img id="footimg" src="../../assets/u77.png"></el-col>
  </div>
  <div id="footerdown" class="fontlay"><span>王毓毕设专用---Place of Origin:Make in China</span></div>
       </el-footer>
    </el-container>

  </el-container>

</el-container>
</template>
<script>
export default {
  data () {
    return {
      isCollapse: true
    }
  },
  methods:{
     go(){
      history.forward();
    },
     back(){
      history.back();
    },
    jumpTo(url){
        this.defaultActiveIndex = url;
        this.$router.push(url); //用go刷新
      },
      info() {
        this.$message('Called love everyone, see flowers bloom, see a small white car car tire of the waves is me');
      },
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.fontlay{
    font-family: 'ArialMT', 'Arial';
    font-weight: 400;
    font-style: normal;
    font-size: 14px;
    color: #333333;
    text-align: center;
    line-height: normal;
}
._headermenu{
    border-width: 0px;
    position: absolute;
    left: 205px;
    top: 16px;
    width: 560px;
    word-wrap: break-word;
    border-bottom: none;
}
.el-menu--horizontal {
    border-right: none;
    border-bottom: none;
}
.el-menu-item{
  font-size:14px;
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-style: normal;
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
  height:100%;
}
.el-aside{
    color:#fff;
    font-size: 10px;
    height: 100%;
    background-color: #303133;
    float:left;
    height:100%;
}
.tac{
    padding:0px;
    margin:0px;
    list-style: none;
    text-align:center;
    border-bottom:1px solid #20a0ff;
    padding:10px;
}
.el-main{
  width: 100%;
  background-color:#EFF1F3;
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
#headertext{
  font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-style: normal;
}
#text2lay{
  float:right;
    border-width: 0px;
    margin-right: 70px;
    margin-top: 36px;
    width: 73px;
    height: 19px;
    white-space: nowrap;
    font-size:14px;
}
.u7img{
  border-width: 0px;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 103%;
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
  position: absolute;
  left: 550px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}
#label2lay{
  position: absolute;
  border-width: 0px;
  position: absolute;
  left: 795px;
  top: 0px;
  width: 71px;
  white-space: nowrap;
}
input{
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
.el-button{
  width:90px;
  height:35px;
  border:none;
  font-size:15px;
  color:#FFFFFF;
  margin-top:15px;
  text-align:center;
  background-color:#303133;
}
.el-footer{
  border-width: 0px;
    margin-left: -20px;
    width: 101%;
}
#footerup{
  width: 101%;
    height: 140px;
    background-color: rgba(29, 29, 29, 1);
    text-align:left;
}
.font-color{
    color:#ffffff;
    margin-top:10px;
    font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
    font-size:14px;
  }
._fontright{
  margin-left:77px;
  width:140px;
}
#footimg{
    float:right;
    margin-top:10px;
    margin-right:60px;
    width: 99px;
    height: 99px;
}
#footerdown{
  width: 101%;
    height: 30px;
    background-color: rgba(0, 0, 0, 1);
    text-align:center;
    font-size: 12px;
    color: #8B8B8B;
    line-height:30px;
    }

  p{
    font-family: 'MicrosoftYaHei', 'Microsoft YaHei';
    font-weight: 400;
     color: #8B8B8B;;
     margin-top:7px;
    font-size:14px;
    line-height:10px;
  }
  .tac[data-v-1d579870] {
    border:none;
  }
</style>
