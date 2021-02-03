# frozen_string_literal: true

RSpec.describe 'POST /api/articles/:article_id/comments', type: :request do
  let!(:existing_article) { create(:article) }
  let(:user) { create(:user, email: 'otheruser@mail.com') }
  let(:user_header) { user.create_new_auth_token }

  describe 'user can create a comment' do
    before do
      post "/api/articles/#{existing_article.id}/comments",
        params: {
          comment: {
            content: 'this is a comment',
            article_id: existing_article.id,
          }
        },
        headers: user_header
    end
    it 'is expected to return a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return the content of the created comment' do
      expect(response_json['comment']['content']).to eq 'this is a comment'
    end
  end
end