module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # ログインボタンを押す
    find('input[name="commit"]').click
    # トップページへ遷移することを確認する
    expect(current_path).to eq root_path
  end
end