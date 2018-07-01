<?php
namespace app\home\controller;
use think\Controller;


class Per extends Controller //继承controller, 才可以调用success, error方法. 缺什么继承什么.
{
    public function index()
    {
        $auths = new \think\Auth();


		//debug
		//echo $auth->Author;
		//exit;


        //获取当时登录用户的id
		//$uid = session('uid');

        //超级管理员不验证权限
		//if($uid = 1 ) {return true};

        //获取当前请求地址  模块/控制器/操作
		//认证的时候可以 "模块/控制器" 认证， 也可以"控制器/操作"认证，  也可以 "模块/控制器/操作" 一起认证
        //$name = request()->module().'/'.request()->controller().'/'.request()->action();   // home/Per/index
        //echo $name;exit;



		//if($auths->check($name, $uid)){
		if($auths->check('home/index', 1)){  //手动硬编码, 本例是  模块/控制器认证
			//设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
			$this->success('登录成功!', '/home/login');  // '/home/login' URL is example.com/home/login ,  'home/login' URL is example.com/home/home/login 
		} else {
			//错误页面的默认跳转页面是返回前一页，通常不需要设置
			$this->error('你没有权限!');            
		}


    }
}