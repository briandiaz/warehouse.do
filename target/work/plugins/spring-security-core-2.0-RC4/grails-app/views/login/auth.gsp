<g:applyLayout name="main">

	<content tag="content">

	<g:if test='${flash.message}'>
		<div class='login_message'>${flash.message}</div>
	</g:if>
	<div class="col-md-12 col-sm-12 sign-in">
		<h4 class="">Inicia Sesión</h4>
		<p class="">Hello, Welcome to your account.</p>
		<form action='${postUrl}' method='POST' role="form" id='loginForm' class='register-form outer-top-xs' autocomplete='off'>
			<div class="form-group">
				<label class="info-title" for="username"><g:message code="springSecurity.login.username.label"/> <span>*</span></label>
				<input type='text' class='form-control unicase-form-control text-input' name='j_username' id='username'/>
			</div>
			<div class="form-group">
				<label class="info-title" for="password"><g:message code="springSecurity.login.password.label"/> <span>*</span></label>
				<input type='password' class='form-control unicase-form-control text-input' name='j_password' id='password'/>
			</div>
			<div class="radio outer-xs">
				<label>
					<input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/><g:message code="springSecurity.login.remember.me.label"/>
				</label>
				<a href="#" class="forgot-password pull-right">Forgot your Password?</a>
			</div>
			<input type='submit' id="submit" class="btn-upper btn btn-primary checkout-page-button" value='${message(code: "springSecurity.login.button")}'/>
		</form>
	</div>

	<script type='text/javascript'>
		<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
		// -->
	</script>
	</content>
</g:applyLayout>