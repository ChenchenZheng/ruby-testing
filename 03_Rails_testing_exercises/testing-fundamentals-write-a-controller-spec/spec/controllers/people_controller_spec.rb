require 'rails_helper'

describe PeopleController, type: :controller do
  let(:attributes) do
    {
      first_name: 'Chenchen'
    }
  end

  let(:invalid_attributes) do
    {
      first_name: nil
    }
  end

  describe '#create' do
    context 'when person is valid' do
      it 'redirects to #show' do
        post :create, params: { person: attributes }

        expect(response).to redirect_to(Person.last)
      end
    end

    context 'when person is invalid' do
      it 'renders new' do
        post :create, params: { person: invalid_attributes }

        expect(response).to render_template(:new)
      end
    end
  end
end
