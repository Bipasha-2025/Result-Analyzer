require 'rails_helper'

RSpec.describe "API::V1::Results", type: :request do
  describe "POST /api/v1/results" do
    let(:payload) do
      {
        student_name: "Test Student",
        subject: "Math",
        marks: 85,
        timestamp: "2025-09-28T14:30:00Z"
      }
    end

    it "creates a result and returns 201" do
      post "/api/v1/results", params: payload.to_json, headers: { "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(:created)
      expect(Result.count).to eq(1)
      r = Result.first
      expect(r.student_name).to eq("Test Student")
      expect(r.subject).to eq("Math")
      expect(r.marks).to eq(85)
    end
  end
end
