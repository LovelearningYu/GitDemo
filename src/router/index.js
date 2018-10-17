import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Find_Pass from '@/components/find_pass.vue'
import Register from '@/components/register.vue'
import Alter_pass from '@/components/alter_pass.vue'
import Home from '@/components/common/home.vue'
import Main from '@/components/main.vue'
import Account from '@/components/account.vue'
import User_info from '@/components/user/user_info.vue'
import User_manage from '@/components/user/user_manage.vue'
import Blood_inventory from '@/components/blood/blood_inventory.vue'
import Blood_transportation from '@/components/blood/blood_transportation.vue'
import Check_plan from '@/components/check/check_plan.vue'
import Check_analyze from '@/components/check/check_analyze.vue'
import History from '@/components/check/history.vue'

Vue.use(Router)

export default new Router({
    routes: [{
            path: '/',
            name: '登录',
            component: Login
        }, {
            path: '/find_pass',
            name: '密码找回',
            component: Find_Pass
        }, {
            path: '/register',
            name: '注册',
            component: Register
        },
        {
            path: '/alter_pass',
            name: '修改密码',
            component: Alter_pass
        },
        {
            path: '/home',
            name: '账号设置',
            component: Home,
            children: [
                { path: '/account', component: Account },
                { path: '/main', component: Main },
            ]
        },
        {
            path: '/home',
            name: '用户管理',
            component: Home,
            children: [
                { path: '/user_info', component: User_info },
                { path: '/user_manage', component: User_manage },
            ]
        },
        {
            path: '/home',
            name: '血液管理',
            component: Home,
            children: [
                { path: '/blood_inventory', component: Blood_inventory },
                { path: '/blood_transportation', component: Blood_transportation },
            ]
        },
        {
            path: '/home',
            name: '血液检查',
            component: Home,
            children: [
                { path: '/check_plan', component: Check_plan },
                { path: '/check_analyze', component: Check_analyze },
                { path: '/history', component: History },
            ]
        },
    ]
})