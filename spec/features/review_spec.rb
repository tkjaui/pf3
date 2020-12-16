require 'rails_helper'

feature 'Review',  type: :feature do
  feature 'ログイン前' do
    # scenario 'コメント登録ができないか' do
    #   get :show, params: {id: @service.id}
    #   expect(response).to redirect_to "/users/sign_in"
    # end
  end

  feature 'ログイン後' do
    let(:user) {create(:user)}

    background do
      visit new_user_session_path
      fill_in "Email", with:user.email
      fill_in "Password", with:user.password
      click_on "Log in"
    end

    scenario 'コメント登録ができるか' do
      
    end
  end
end
