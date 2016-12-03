<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="user-edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridModalLabel-user-edit" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridModalLabel-user-edit">编辑</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="user-edit-id">编号：</label>
                    <span id="user-edit-id"></span>
                </div>
                <div class="form-group">
                    <label for="user-edit-username">账号：</label>
                    <span id="user-edit-username"></span>
                </div>
                <div class="form-group">
                    <label for="user-edit-attemptTimes">登录失败尝试次数：</label>
                    <input id="user-edit-attemptTimes" type="number" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="user-edit-lastAttemptDate">最后一次登录尝试时间：</label>
                    <span id="user-edit-lastAttemptDate"></span>
                </div>
                <div class="form-group">
                    <label for="user-edit-accountExpiredDate">账号过期时间：</label>
                    <input id="user-edit-accountExpiredDate" type="text" class="form-control" value="" />
                </div>
                <div class="form-group">
                    <label for="user-edit-credentialsExpiredDate">密码过期时间：</label>
                    <input id="user-edit-credentialsExpiredDate" type="text" class="form-control" value="" />
                </div>
                <div class="form-group">
                    <label for="user-edit-enable">用户是否可用：</label>
                    <select id="user-edit-enable" class="form-control">
                        <option value="1">可用</option>
                        <option value="0">禁用</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="user-edit-roleId">角色：</label>
                    <select id="user-edit-roleId" class="form-control"></select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="user-edit-reset" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="user-edit-submit" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>