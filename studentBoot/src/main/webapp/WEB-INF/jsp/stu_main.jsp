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
    <title>学生登录</title>
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

<div class="panel panel-info">
    <div class="panel-heading">
        <span class="iconfont icon-xuesheng1"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">学生登录</span>

        <div class="userlogin">
            <span id="exit"><a href="javascript:loginOut();">
                <span class="iconfont icon-tuichu_huaban1"style="font-size: 15px;">
                </span>&nbsp;退出</a></span>
            <span data-toggle="modal" data-target="#schoolAdvice" id="schoolMes" >
                  学校通知&nbsp;<span class="iconfont icon-tongzhi2"style="font-size: 15px;color: coral"></span>
            </span>
            <span id="loginname">你好！&nbsp;&nbsp;&nbsp;
                <span data-toggle="modal" data-target="#myModal" style="cursor: pointer;" id="userMessage">${stu.stuName}&nbsp;&nbsp;&nbsp;
                    <span class="iconfont icon-gerenzhongxin1"style="font-size: 15px;">
                    </span>
                </span></span>
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
                            <li id="list1">个人信息修改</li>
                            <li id="list2">密码修改</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <span class="iconfont icon-chengjidan"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                课程成绩
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <li id="list3">成绩查询</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <span class="iconfont icon-jiaolian1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                授课老师
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <li id="list4">老师信息</li>
                            <%--<li id="list5">留言</li>--%>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <span class="iconfont icon-kechengbiao1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                课程表
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <li id="list6">课程表查看</li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title">
                            <span class="iconfont icon-kaoshi1"style="font-size: 23px;"></span>&nbsp;
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                考试安排
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                        <div class="panel-body">
                            <li id="list7">考试通知</li>
                            <li id="list8">考试地点和时间</li>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="jumbotron">
            <div class="container" align="center">
                <div class="list"  id="form_in0" style="display: block"><jsp:include page="school.jsp" flush="true"/></div>
                <div class="list"  id="form_in1" style="display: none"><jsp:include page="stu_update_message.jsp" flush="true"/></div>
                <div class="list"  id="form_in2"  style="display: none"><jsp:include page="stu_update_pw.jsp" flush="true"/></div>
                <div class="list"  id="form_in3"  style="display: none"><jsp:include page="stu_grade.jsp" flush="true"/></div>
                <%--<div id="form_in5"  style="display: none"></div>--%>
                <div class="list"   id="form_in4"  style="display: none"><jsp:include page="stu_teacher.jsp" flush="true"/></div>
                <div class="list"   id="form_in6"  style="display: none"><jsp:include page="stu_courses.jsp" flush="true"/></div>
                <div class="list"   id="form_in7"  style="display: none"><jsp:include page="stu_exam_advice.jsp" flush="true"/></div>
                <div class="list"   id="form_in8" style="display: none"><jsp:include page="stu_exam_message.jsp" flush="true"/></div>
                <div class="list"   id="form_in9" style="display: none"><jsp:include page="stu_message.jsp" flush="true"/></div>
                <div class="list"   id="form_in10" style="display: none"><jsp:include page="stu_schoolAdvice.jsp" flush="true"/></div>
            </div>
        </div>

    </div>
</div>

<div id="bottom"><a href="https://www.baidu.com">友情链接</a> |  邮箱 ：1228033061@qq.com | qq:1228033061 | 进网许可：123123</div>
</body>
</html>