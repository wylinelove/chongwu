import Vue from 'vue'
import App from './App.vue'
import QS from 'qs'
import router from './router'
// import store from './store'
// Vue.config.productionTip = false
// 引入第三方组件库
// 1.1 引入MintUI组件
import MintUI from 'mint-ui'
//1.2 单引入mint-ui样式文件
import 'mint-ui/lib/style.css'
//1.3 将mint-ui 注册vue
Vue.use(MintUI)
//1.4 引入图标字体样式库
//2.1 引入 axios库
import axios from 'axios'
//2.2 配置axios,设置属性发送ajax请求时保存session信息
axios.defaults.withCredentials=true
//2.3 设置ajax请求时的基本路径
axios.defaults.baseURL="http://127.0.0.1:5050/"
//2.4 注册axios
Vue.prototype.axios=axios
//3.1 引入第三方模块vuex
import Vuex from 'vuex'
//3.2 注册实例
Vue.use(Vuex)
//3.3 创建存储对象
var store=new Vuex.Store({
  state:{//集中管理数据属性
    uname:"",
    islogin:false
  },
  getters:{//集中 获取数据函数
    getUser(state){
      var obj={uname:state.uname,islogin:state.islogin}
      return obj
    }
  },
  mutations:{//集中 修改数据函数
    login(state,data){//登录
      state.uname=data;
      state.islogin=true;
    },
    signout(state){//注销
      state.uname="";
      state.islogin=false;
    },
    isLogin(state){//刷新页面时调用，根据sessionStorage中islogin判断登录状态，并修改store中的值
      if(!state.islogin){
        state.uname=sessionStorage.getItem('uname');
        state.islogin=sessionStorage.getItem('islogin')
      }
      return state.islogin;
    }
  },
  actions:{//保存函数，异步修改

  }
})
//引入全局变量 页头 页尾
import MyHeader from './components/MyHeader.vue'
import MyFooter from './components/MyFooter.vue'
Vue.component("my-header",MyHeader)
Vue.component("my-footer",MyFooter)
new Vue({
  router,
  // store,
  render: h => h(App),
  store//3.4 将存储对象添加到vue实例作为属性
}).$mount('#app')
