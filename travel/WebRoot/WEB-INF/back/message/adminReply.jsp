<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf"%>
<%@ include file="/WEB-INF/pub/bootstrap.jspf"%>
<%@ include file="/WEB-INF/pub/ueditor.jspf"%>
<%@ include file="/WEB-INF/pub/webuploader.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
<title>友情链接管理</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- form: -->
			<section>
			<div class="col-lg-8 col-lg-offset-2">
				<div class="page-header">
					<h2>回复</h2>
				</div>



				<blockquote>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Integer posuere erat a ante.</p>
					<footer>Someone famous in <cite title="Source Title">Source
						Title</cite></footer>
				</blockquote>

				<blockquote class="blockquote-reverse">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Integer posuere erat a ante.</p>
					<footer>Someone famous in <cite title="Source Title">Source
						Title</cite></footer>
				</blockquote>

				<form id="messageForm" method="post" class="form-horizontal"
					action="<%=contextPath%>/message_doSave.do">
					<s:hidden name="adminId" />
					<!-- 管理员回复-->
					<s:hidden name="userId" />
					<!-- 给用户-->
					<div class="form-group">
						<label class="col-lg-3 control-label">简介</label>
						<div class="col-lg-5">
							<s:textarea name="content" cssClass="form-control" rows="5" />
						</div>
					</div>
					
					
					 <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" id="checkSubmit">回复</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
					
				</form>
			</div>
			</section>
			<!-- :form -->
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			$('#messageForm').bootstrapValidator({
				//        live: 'disabled',\
				/*  : default, */
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					content : {
						group : '.col-lg-4',
						validators : {
							notEmpty : {
							/*  : 'The first name is required and cannot be empty' */
							}
						}
					}
				}
			}).on('success.form.bv', function(e) {
				// Prevent form submission
				e.preventDefault();

				// Get the form instance
				var $form = $(e.target);

				// Get the BootstrapValidator instance
				var bv = $form.data('bootstrapValidator');

				// Use Ajax to submit form data
				$.post($form.attr('action'), $form.serialize(), function(data) {
					if (data && data.success) {
						parent.mainDlg.close();
						/* 	UE.getEditor('hotel_content').destroy(); */
						jSuccess(data.msg);
					} else {
						jError(data.msg);
					}
				}, 'json');
			});

			// Validate the form manually
			$("#checkSubmit").on('click', function() {

				var logoUrl = $("#hotel_logo_input").val();
				if (logoUrl.length <= 0) {
					jNotify("请上传 LOGO !!");
					return false;
				}
			});

			$('#resetBtn').click(function() {
				$('#messageForm').data('bootstrapValidator').resetForm(true);
			});

		});
	</script>
</body>
</html>
