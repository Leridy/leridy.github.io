<template>
<div
  class='dialog-wrapper'
  v-if='visible'
>
  <!-- 弹窗头部 -->
  <header class='dialog-header'>
    {{ config.title }}
    <span
      class='dialog-close'
      @click='close({ type: "click" })'
    >x</span>
  </header>
  <!-- 弹窗主体 -->
  <main>
    <!-- TODO 你的主要业务，可以放置内容，表单，可选列表等 -->
  </main>
  <!-- 弹窗的底部 -->
  <footer class='dialog-footer'>
    <button
      @click='close({ type: "confirm" })'
    >确定</button>
    <button
       @click='close({ type: "cancel" })'
    >取消</button>
  </footer>
</div>
</template>

<script>
export default {
  /**
   * 以下代码根据你的实际开发情况而适当改造
   */
  name: 'dialog',
  props: {
    config: {
      type: Object,
      default: {
        title: '默认弹窗',
      }
    }
  },

  data() {
    return {
      data1: 'this is data 1',
      data2: 'this is data 2',
    }
  },

  methods: {
    // 弹窗的初始化逻辑

    /**
     * 处理弹窗的打开
     * @param { any } params 父组件传入的主要数据
     * @param { object } args 父组件传入的其他数据
     * @return { Promise } 一个异步对象
     */
    open(params, ...args) {
      const { initDialog } = this;
       // 非必须，如果父组件需要处理弹窗的开始事件
      this.$emit('open', event);
      initDialog(params);
      this.visible = true;

      // 处理完业初始化逻辑之后向辅组件的调用方法返回一个 Promise 对象
      return new Promise((res, rej) => {
        this._resolve = res;
        this._reject = rej;
      })
    },

    /**
     * @param { any } params 用于组件初始话的数据
     */
    initDialog(params) {
      // TODO 你的业务初始化逻辑
    },

    // TODO 这里可以写入你的业务代码

    // 弹窗的关闭逻辑
    
    /**
     * @param { object<Event> } event 可能是触发的事件
     * @param { any } args 其他内容
     */
    close(event, ...args) {
      // 非必须，如果父组件需要处理弹窗的关闭事件
      this.$emit('close', event);
      // 若我们假定event中包含以下内容
      /**
      {
        type: 'click';  // click: 用户点击窗口关闭，cancel：用户取消了操作，confirm：用户确定了操作
        // ...otherProp
      }
      */

      // 那么我们可以根据上面的信息来做一个回调处理

      const { type } = event;
      if (type === 'click') { // 判断条件可以根据你的实际业务来写
        const payload = '用户关闭了窗口'; // 这里可以是你从弹窗业务中获取的任何信息
        this._reject({ payload, type, event });
      } else if( type === 'cancel') {
        const payload = '用户取消了操作';
        this._reject({ payload, type, event });
      } else if ( type === 'confirm') {
        const payload = '用户确定了操作';
        this._resolve({ payload, type, event });
      }
      this.visible = false;
    }
  }
}
</script>

<style scoped>
 /*todo your css */
</style>