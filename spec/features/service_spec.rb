# frozen_string_literal: true

require 'rails_helper'

feature 'Service', type: :feature do
  feature 'ログイン前' do
    scenario 'サービス登録ができないか' do
      visit root_path
      expect(page).to_not have_content '新規投稿'
    end
  end

  feature 'ログイン後', type: :feature do
    let(:user) { create(:user) }

    background do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    scenario '新規サービス登録ができるか' do
      visit root_path
      click_on '新規投稿'
      select 'AOS', from: '会社名'
      select 'SSD', from: '機種名'
      select 'データ削除', from: '症状'
      select '〜9,999円', from: '金額'
      select '〜1日', from: '納品までの日数'
      select '成功', from: '結果'
      fill_in 'コメント', with: 'ssssssssss'
      click_on '投稿'
      expect(page).to have_content '投稿に成功しました。'
    end
  end
end
