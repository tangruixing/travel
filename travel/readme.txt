现在有一个用户的增删改查的模板(resources/jdbc.properties 下修改数据库配置信息）。
路径：http://localhost:8080/travel/index.jsp。
约定：
1，全部用UTF-8编码环境, 包含：eclipse 编译环境 和  jsp,html
2，一个Action中的方法只调用一个Service 方法(在Service层方法下加了事物)。一个Service 可以调用多个Dao方法。
3，类名大写，变量名第一个单词小写。






