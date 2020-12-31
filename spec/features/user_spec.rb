# frozen_string_literal: true

require 'rails_helper'

feature 'User', type: :feature do
  feature 'ユーザー登録前' do
    scenario 'ユーザー登録ができるか' do
      visit root_path
      click_on '新規登録'
      fill_in 'Username', with: 'sssssssss'
      fill_in 'Email', with: 'eee@gmail.com'
      fill_in 'Password', with: '11111111111111'
      fill_in 'Password confirmation', with: '11111111111111'
      click_on 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'ユーザー登録ができないか' do
      visit root_path
      click_on 'ログイン'
      fill_in 'Email', with: 'rrrr@gmail.com'
      fill_in 'Password', with: '333333333333333'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  feature 'ユーザー登録後', type: :feature do
    let(:user) { create(:user) }

    background do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    scenario 'ログインできているか' do
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'ログアウトできるか' do
      click_on 'ログアウト'
      expect(page).to have_content 'Signed out successfully.'
    end

    scenario 'ユーザー情報ページに遷移できるか' do
      click_on 'マイページ'
      click_on '編集'
      expect(current_path).to eq edit_user_path(user)
    end

    scenario 'ユーザー情報編集ができるか' do
      click_on 'マイページ'
      click_on '編集'
      fill_in 'ユーザー名', with: 'ssssssss'
      click_on '更新'
      expect(page).to have_content('更新に成功しました')
    end

    scenario 'ユーザー情報編集ページのフォームは正しい値か' do
      click_on 'マイページ'
      click_on '編集'
      expect(page).to have_field 'ユーザー名', with: user.username
      expect(page).to have_field 'メールアドレス', with: user.email
    end
  end
end
