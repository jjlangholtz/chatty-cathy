require 'rails_helper'
describe HomeController do
  describe 'GET #index' do
    context 'when the user is logged in' do
      it 'responds successfull with an HTTP 200 status code' do
        allow(subject).to receive(:current_user).and_return instance_double('User', followees: [])

        get :index
        expect(response).to be_success
      end
    end
  end
end
