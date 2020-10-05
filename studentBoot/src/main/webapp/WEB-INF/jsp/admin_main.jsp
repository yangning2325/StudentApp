<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/24
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript">
        function loginOut() {
            var t = confirm("你确定要退出登录吗？");
            if (t) {
                location.replace("${pageContext.request.contextPath}/login");
            }
        }
    </script>
</head>
<body>
<h2 align="center" style="font-size:40px;color: #007BFF;">学生信息管理系统</h2>

<div class="panel panel-success">
    <div class="panel-heading">
        <span class="iconfont icon-xitongguanli"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">管理员登录</span>
        <div class="userlogin">
            <span id="exit"><a href="javascript:loginOut();"><span class="iconfont icon-tuichu_huaban1"style="font-size: 15px;"></span>&nbsp;退出</a></span>
            <span id="loginname">你好！&nbsp;&nbsp;&nbsp;
                <span>${admin.admName}&nbsp;&nbsp;&nbsp;
                    <span class="iconfont icon-gerenzhongxin1"style="font-size: 15px;">
                    </span>
                </span>
            </span>
        </div>
    </div>
    <div class="panel-body" style="font-size: 15px;">
        <div id="nav">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <span class="iconfont icon-xuesheng"style="font-size: 23px;"></span>&nbsp;
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                学生信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <li id="list1">学生信息操作</li>
                            <li id="list2">添加学生</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <span class="iconfont icon-jiaolian1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                老师信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <li id="list3">老师信息操作</li>
                            <li id="list4">添加老师</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <span class="iconfont icon-kechengbiao1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                课程表信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <li id="list5">课程表设置</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <span class="iconfont icon-kaoshi1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                考试安排
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <li id="list6">考试通知设置</li>
                            <li id="list7">学生考场安排</li>
                            <li id="list8">教师考场安排</li>
                            <li id="list9">考试科目和时间</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title">
                            <span class="iconfont icon-gerenzhongxin1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                个人信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                        <div class="panel-body">
                            <li id="list10">个人信息修改</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingSix">
                        <h4 class="panel-title">
                            <span class="iconfont icon-5xuexiaomingcheng"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseFive">
                               学校通知
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                        <div class="panel-body">
                            <li id="list11">学校通知设置</li>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="jumbotron">
            <div class="container" align="center">
                <div class="list"   id="form_in0" style="display: block"><jsp:include page="school.jsp" flush="true"/></div>
                <div class="list"   id="form_in1"  style="display: none"><jsp:include page="admin_updateStu.jsp" flush="true"/></div>
                <div class="list"   id="form_in2"  style="display: none"><jsp:include page="admin_addStu.jsp" flush="true"/></div>
                <div class="list"   id="form_in3"  style="display: none"><jsp:include page="admin_updateTea.jsp" flush="true"/></div>
                <div class="list"   id="form_in4"  style="display: none"><jsp:include page="admin_addTea.jsp" flush="true"/></div>
                <div class="list"   id="form_in5"  style="display: none"><jsp:include page="admin_updateCourses.jsp" flush="true"/></div>
                <div class="list"   id="form_in6"  style="display: none"><jsp:include page="admin_examRule.jsp" flush="true"/></div>
                <div class="list"   id="form_in7" style="display: none"><jsp:include page="admin_updateStuExam.jsp" flush="true"/></div>
                <div class="list"   id="form_in8" style="display: none"><jsp:include page="admin_updateTeaExam.jsp" flush="true"/></div>
                <div class="list"   id="form_in9" style="display: none"><jsp:include page="admin_updateExam.jsp" flush="true"/></div>
                <div class="list"   id="form_in10" style="display: none"><jsp:include page="admin_updateOwn.jsp" flush="true"/></div>
                <div class="list"   id="form_in11" style="display: none"><jsp:include page="admin_schoolAdvice.jsp" flush="true"/></div>
            </div>
        </div>

    </div>
</div>

<div id="bottom"><a href="https://www.baidu.com/">友情链接</a> |  邮箱 ：1228033061@qq.com | qq:1228033061 | 进网许可：123123</div>
</body>
</html>