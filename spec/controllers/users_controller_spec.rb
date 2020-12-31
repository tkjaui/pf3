# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
    @service = FactoryBot.create(:service)
  end

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to render_template :index
    end

    it '200レスポンスが帰ってきているか' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#show' do
    context 'as an authorized user' do
      it 'returns http success' do
        sign_in @user
        get :show, params: { id: @service.id }
        expect(response).to render_template :show
      end

      it '200レスポンスが帰ってきているか' do
        sign_in @user
        get :show, params: { id: @service.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest user' do
      it "does't respond successfully" do
        get :show, params: { id: @service.id }
        expect(response).to_not render_template :show
      end

      it 'returns a 302 response' do
        get :show, params: { id: @service.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects the page to /users/sign_in' do
        get :show, params: { id: @service.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#edit' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get :edit, params: { id: @service.id }
        expect(response).to render_template :edit
      end

      it 'retuens a 200 response' do
        sign_in @user
        get :edit, params: { id: @service.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'as an unauthorized user' do
      it "doesn't response successfully" do
        sign_in @another_user
        get :edit, params: { id: @service.id }
        expect(response).to_not render_template :edit
      end

      it 'redirects the page to /users' do
        sign_in @another_user
        get :edit, params: { id: @service.id }
        expect(response).to redirect_to '/users'
      end
    end

    context 'as a guest user' do
      it 'returns a 302 response' do
        get :edit, params: { id: @service.id }
        expect(response).to have_http_status '302'
      end

      it 'redirect the page to /users/sign_in' do
        get :edit, params: { id: @service.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it '正常に更新できるか' do
        sign_in @user
        user_params = { username: 'aaaaaa', email: 'aaaaaaaaaa@gmail.com' }
        patch :update, params: { id: @user.id, user: user_params }
        expect(@user.reload.username).to eq 'aaaaaa'
        expect(@user.reload.email).to eq 'aaaaaaaaaa@gmail.com'
      end

      it 'ユーザー情報を更新した後、更新された詳細ページへリダイレクトするか？' do
        sign_in @user
        user_params = { username: 'ffffffffff', email: 'wwwwww@gmail.com' }
        patch :update, params: { id: @user.id, user: user_params }
        expect(response).to redirect_to '/users/1'
      end
    end

    context 'with an invalid attributes' do
      it '不正なアトリビュートを含む情報は更新できなくなっているか？' do
        sign_in @user
        user_params = { username: nil, email: nil }
        patch :update, params: { id: @user.id, user: user_params }
        expect(@user.reload.username).to eq 'tarou'
        expect(@user.reload.email).to eq 'example31@example.com'
      end
    end

    context 'as an unauthorized user' do
      it '他のユーザーが編集しようとすると、ルートページへリダイレクトされているか？' do
        sign_in @another_user
        get :edit, params: { id: @user.id }
        expect(response).to redirect_to '/users'
      end
    end

    context 'as a guest user' do
      it 'returns a 302 response' do
        sign_in @another_user
        user_params = { username: 'ffffffffff', email: 'wwwwww@gmail.com' }
        patch :update, params: { id: @user.id, user: user_params }
        expect(response).to have_http_status '302'
      end

      it '詳細画面にリダイレクトされているか？' do
        sign_in @another_user
        user_params = { username: 'ffffffffff', email: 'wwwwww@gmail.com' }
        patch :update, params: { id: @user.id, user: user_params }
        expect(response).to redirect_to '/users/1'
      end
    end
  end
end
