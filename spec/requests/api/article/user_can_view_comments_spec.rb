# frozen_string_literal: true

RSpec.describe 'GET /api/article/:id/comments', type: :request do
  let!(:existing_article) { create(:article) }
  let(:user) { create(:user, email: 'otheruser@mail.com') }
  let!(:comments) { 3.times { create(:comment) } }
  let(:user_header) { user.create_new_auth_token }
  
  describe 'user can view comments' do
    before do
      get "/api/articles/#{existing_article.id}/comments",
        params: {
          comments: {
            article_id: existing_article.id,
          }
        },
        headers: user_header
    end
    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return three comments' do
      expect(response_json['comments']['id'].count).to eq 3
    end
  end
end