# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
    @service = FactoryBot.create(:service)
    @another_service = FactoryBot.create(:another_service)
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
        expect(response).to redirect_to '/services'
      end
    end

    context 'as an unauthorized user' do
      it "doesn't response successfully" do
        sign_in @another_user
        get :edit, params: { id: @service.id }
        expect(response).to_not render_template :new
      end

      it 'redirects the page to /services' do
        sign_in @another_user
        get :edit, params: { id: @service.id }
        expect(response).to redirect_to '/services'
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
        service_params = { company: 'aaaaa' }
        patch :update, params: { id: @service.id, service: service_params }
        expect(@service.reload.company).to eq 'aaaaa'
      end

      it 'サービス情報を更新した後、更新された詳細ページへリダイレクトするか？' do
        sign_in @user
        service_params = { device: 'ff' }
        patch :update, params: { id: @service.id, service: service_params }
        expect(response).to redirect_to '/services/1'
      end
    end

    context 'with an invalid attributes' do
      it '不正なアトリビュートを含む情報は更新できなくなっているか？' do
        sign_in @user
        service_params = { result: nil }
        patch :update, params: { id: @service.id, service: service_params }
        expect(@service.reload.result).to eq 'MyString'
      end
    end

    context 'as an unauthorized user' do
      it '他のユーザーが編集しようとすると、ルートページへリダイレクトされているか？' do
        sign_in @another_user
        get :edit, params: { id: @service.id }
        expect(response).to redirect_to '/services'
      end
    end

    context 'as a guest user' do
      it 'returns a 302 response' do
        sign_in @another_user
        service_params = { days: 'cccccccc' }
        patch :update, params: { id: @service.id, service: service_params }
        expect(response).to have_http_status '302'
      end

      it '詳細画面にリダイレクトされているか？' do
        sign_in @another_user
        service_params = { days: 'cccccccc' }
        patch :update, params: { id: @service.id, service: service_params }
        expect(response).to redirect_to '/services/1'
      end
    end
  end

  describe '#new' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get :new
        expect(response).to render_template :new
      end

      it 'responds a 200 respond' do
        sign_in @user
        get :new
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest user' do
      it "doesn't respond successfully" do
        get :new
        expect(response).to_not render_template :new
      end

      it 'returns a 302 response' do
        get :new
        expect(response).to have_http_status '302'
      end

      it 'redirects the page to /users/sign_in' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'as an authorized user' do
      it 'adds a new service' do # 正常に登録できるか
        sign_in @user
        expect  do
          post :create, params: {
            service: {
              company: 'MyString',
              device: 'MyString',
              problem: 'MyString',
              price: 'MyString',
              days: 'MyString',
              result: 'MyString',
              body: 'MyText'
            }
          }
        end.to change(@user.services, :count).by(1)
      end

      # 作成後に詳細ページへリダイレクトされているか？
      it 'redirects the page to /services/service.id(3)' do
        sign_in @user
        post :create, params: {
          service: {
            company: 'MyString',
            device: 'MyString',
            problem: 'MyString',
            price: 'MyString',
            days: 'MyString',
            result: 'MyString',
            body: 'MyText'
          }
        }
        expect(response).to redirect_to '/services/3'
      end
    end

    # 不正なアトリビュートを含むものは作成できなくなっているか？
    context 'with invalid attributes' do
      it "doesn't add a new service" do
        sign_in @user
        expect  do
          post :create, params: {
            service: {
              company: nil,
              device: 'MyString',
              problem: 'MyString',
              price: 'MyString',
              days: 'MyString',
              result: 'MyString',
              body: 'MyText'
            }
          }
        end.to_not change(@user.services, :count)
      end

      # 不正なものを作成しようとすると、再度作成ページへリダイレクトされるか？
      it 'redirects the page to /services/new' do
        sign_in @user
        post :create, params: {
          service: {
            company: nil,
            device: 'MyString',
            problem: 'MyString',
            price: 'MyString',
            days: 'MyString',
            result: 'MyString',
            body: 'MyText'
          }
        }
        expect(response).to render_template :new
      end
    end

    context 'as a guest user' do
      it 'return a 302 response' do
        get :create
        expect(response).to have_http_status '302'
      end

      it 'redirects the page to /users/sign_in' do
        get :create
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      # 削除した後、ルートページへリダイレクトしているか？
      it 'redirects the page to /services' do
        sign_in @user
        delete :destroy, params: { id: @service.id }
        expect(response).to redirect_to '/services'
      end
    end

    context 'as an authorized user' do
      # 投稿したユーザーだけが削除できるようになっているか？
      it 'does not delete a service' do
        sign_in @user
        expect  do
          delete :destroy, params: { id: @another_service.id }
        end.to_not change(@user.services, :count)
      end
    end

    context 'as a guest user' do
      # 302レスポンスを返すか？
      it 'returns a 302 response' do
        delete :destroy, params: { id: @service.id }
        expect(response).to have_http_status '302'
      end
      # ログイン画面にリダイレクトされているか？
      it 'redirects the page to /users/sing_in' do
        delete :destroy, params: { id: @service.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
