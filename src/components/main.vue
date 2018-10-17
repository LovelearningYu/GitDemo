<template>
    <div>
    <el-breadcrumb separator="/">
  <el-breadcrumb-item><span style="cursor:pointer;color:#909399" :to="{ path: '/main' }">首页</span></el-breadcrumb-item>
</el-breadcrumb>
    <el-carousel :interval="4000" type="card" height="250px">
    <el-carousel-item v-for="img in imgList" :key="item">
      <img v-bind:src="img.url">
    </el-carousel-item>
  </el-carousel>
  <hr>
  <h2>采血站简训</h2>
  <el-collapse @change="handleChange">
  <el-collapse-item title="加强政治学习，提高员工思想觉悟" name="1">
    <div>认真学习党的十七大精神，推进无偿献血事业又好又快发展，继续谱写我市无偿献血工作新篇章。</div>
    <div>继续开展治理医药购销领域商业贿赂专项工作，建立健全我站防控医药购销领域商业贿赂管理长效机制。心系社会，奉献爱心。</div>
  </el-collapse-item>
  <el-collapse-item title="加大宣传力度，营造浓厚的舆论氛围" name="2">
    <div>举办形式多样的无偿献血宣传活动。一是在电视、电台、报纸等新闻媒体长年播放无偿献血公益广告。二是加大无偿献血招募力度，加强了与全市各县(区)有关部门和单位的联系，今年共组织了4次无偿献血积极分子联谊活动。</div>
    <div>发挥媒体宣传作用，扩大无偿献血影响。</div>
  </el-collapse-item>
  <el-collapse-item title="加强血液检测，严把质量控制关。" name="3">
    <div>加强团体招募力度，扩大应急献血队伍。</div>
    <div>加强与献血者的沟通、联系及后续保障服务工作。</div>
    <div>严格按照《血站实验室质量管理规范》，对采集的每一份血液标本分别由2人同时用国产和进口试剂，对血型、血色素、转氨酶、乙肝表面抗原、丙肝抗体、梅毒、艾滋病病毒抗体等七项进行两次检测，对可疑阳性标本还进行了第3次检测，确保了血液质量。</div>
  </el-collapse-item>
  <el-collapse-item title="注重质量建设，确保血液质量安全有效" name="4">
    <div>规范行业行为，确保血液安全。</div>
    <div>加强网络建设，实现信息化管理。</div>
  </el-collapse-item>
</el-collapse>
  <hr>
  <h3>最新资讯</h3>
   <ul>
           <li v-for="item in newsList">{{item.title}}-{{item.date}}</li>
       </ul>
    </div>
</template>
<script>
    var newsList=[
    {title:'Apple Watch腕带传感器声称可以检测血液中的钾',date:'2018/3/10'},
    {title:'引领血液检测革命? 80后美女总裁被控巨额欺诈',date:'2018/3/12'},
    {title:'液体活检:血液ctDNA-EGFR标准化检测的三个关键环节',date:'2018/3/13'},
    {title:'新型血液检测方法可查出早期8种癌症',date:'2018/3/23'},
];

    export default{
        name:'app',
        data(){
            return{
                name: '',
                imgList:[
                    {url:require('../assets/blood01.jpg')},
                    {url:require('../assets/blood02.jpg')},
                    {url:require('../assets/blood03.jpg')},
                    {url:require('../assets/blood04.jpg')},
                    {url:require('../assets/blood05.jpg')},
                    {url:require('../assets/blood06.jpg')}
                ],
                newsList:newsList
            }
        },
        methods: {
      handleChange(val) {
        console.log(val);
      }
    }
    }
</script>
<style>
    
</style>