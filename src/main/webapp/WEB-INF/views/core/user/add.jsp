<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="user-add-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridModalLabel-user-add" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridModalLabel-user-add">新增</h4>
      </div>
      <div class="modal-body">
        <form id="user-add-form" method="POST">
          <div class="form-group">
            <label for="user-add-username">账号：</label>
            <input id="user-add-username" name="username" type="text" class="form-control" />
          </div>
          <div class="form-group">
            <label for="user-add-password">请输入密码：</label>
            <input id="user-add-password" name="password" type="password" class="form-control" />
          </div>
          <div class="form-group">
            <label for="user-add-repeatPassword">请再次输入密码：</label>
            <input id="user-add-repeatPassword" name="repeatPassword" type="password" class="form-control" />
          </div>
          <div class="form-group">
            <label for="user-add-accountExpiredDate">账号过期时间：</label>
            <input id="user-add-accountExpiredDate" name="accountExpiredDate" type="text" class="form-control" />
          </div>
          <div class="form-group">
            <label for="user-add-credentialsExpiredDate">密码过期时间：</label>
            <input id="user-add-credentialsExpiredDate" name="credentialsExpiredDate" type="text" class="form-control" />
          </div>
          <div class="form-group">
            <label for="user-add-roleId">分配角色：</label>
            <select id="user-add-roleId" class="form-control"></select>
          </div>
          <div class="form-group">
              <button id="user-add-submit" type="submit" class="btn btn-primary" style="width: 40%;margin: 10px 30%;" disabled="disabled">保存</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>