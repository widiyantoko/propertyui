<%--
  Created by IntelliJ IDEA.
  User: gHost
  Date: 2019-11-27
  Time: 17:28
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div>
    <table style="background-color: #f6f6f6;width: 100%;">
        <tr>
            <td></td>
            <td style="padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;" width="600">
                <div style="max-width: 600px;margin: 0 auto;display: block;padding: 20px;">
                    <table style="background: #fff;border: 1px solid #e9e9e9;border-radius: 3px;" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="padding: 20px">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>

                                        <td>
                                            <img style="display: block;max-width: 100%; height: auto" src="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0 0 20px;">
                                            <h3>Reset Password Property UI</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0 0 20px;">
                                            <br>
                                            Hallo <strong>${user}!</strong>
                                            <br>
                                            Klik tautan dibawah untuk reset password
                                        </td>
                                    </tr>

                                    <tr>
                                        <td  style="padding: 0 0 20px; text-align: center">
                                            <a href="${resetLink}" style="color: #fff;background-color: #337ab7;border-color: #2e6da4;">Reset Password</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div style=" background: none repeat scroll 0 0 white;border-top: 1px solid #e7eaec;bottom: 0;left: 0;padding: 10px 20px;position: absolute;right: 0;">
                        <table width="100%">
                            <tr>
                                <td style="padding: 0 0 20px; text-align: center">
                                    &copy; <g:formatDate date="${new Date()}" format="yyyy"/> Property UI
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
            <td></td>
        </tr>
    </table>
</div>