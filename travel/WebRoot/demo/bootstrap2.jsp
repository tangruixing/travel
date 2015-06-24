<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>         
<%@ include file="/WEB-INF/pub/bootstrap.jspf"%>        
<!DOCTYPE html>
<html>
<head>
    <title>BootstrapValidator demo</title>
	
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="page-header">
                    <h1>Bootstrap Validate plugin</h1>
                </div>

                <div class="col-lg-8 col-lg-offset-2">
                    <form id="defaultForm" method="post" action="target.php" class="form-horizontal">
                        <fieldset>
                            <legend>Not Empty validator</legend>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Username</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="username" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Country</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="country">
                                        <option value="">-- Select a country --</option>
                                        <option value="fr">France</option>
                                        <option value="de">Germany</option>
                                        <option value="it">Italy</option>
                                        <option value="jp">Japan</option>
                                        <option value="ru">Russia</option>
                                        <option value="gb">United Kingdom</option>
                                        <option value="us">United State</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-5 col-lg-offset-3">
                                    <div class="checkbox">
                                        <input type="checkbox" name="acceptTerms" /> Accept the terms and policies
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Regular expression based validators</legend>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Email address</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="email" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Website</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="website" placeholder="http://" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">US Phone number</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="phoneNumberUS" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">UK Phone number</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="phoneNumberUK" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Hex, RGB, HSL, Keyword color</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="color" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">All colors</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="colorAll" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">US zip code</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="zipCode" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Identical validator</legend>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Password</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" name="password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Retype password</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" name="confirmPassword" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Other validators</legend>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Ages</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="ages" />
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary">Submit</button>
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
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            country: {
                validators: {
                    notEmpty: {
                        message: 'The country is required and can\'t be empty'
                    }
                }
            },
            acceptTerms: {
                validators: {
                    notEmpty: {
                        message: 'You have to accept the terms and policies'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            website: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'The input is not a valid URL'
                    }
                }
            },
            phoneNumberUS: {
                validators: {
                    phone: {
                        message: 'The input is not a valid US phone number'
                    }
                }
            },
            phoneNumberUK: {
            	validators: {
            		phone: {
            			message: 'The input is not a valid UK phone number',
            			country: 'GB'
            		}
            	}
            },
            color: {
                validators: {
                    color: {
                        type: ['hex', 'rgb', 'hsl', 'keyword'],
                        message: 'Must be a valid %s color'
                    }
                }
            },
            colorAll: {
                validators: {
                    color: { }
                }
            },
            zipCode: {
                validators: {
                    zipCode: {
                        country: 'US',
                        message: 'The input is not a valid US zip code'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            ages: {
                validators: {
                    lessThan: {
                        value: 100,
                        inclusive: true,
                        message: 'The ages has to be less than 100'
                    },
                    greaterThan: {
                        value: 10,
                        inclusive: false,
                        message: 'The ages has to be greater than or equals to 10'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>
