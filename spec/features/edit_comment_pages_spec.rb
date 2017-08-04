require 'rails_helper'

describe 'the edit a comment process' do
  it 'edits a comment' do
    project = Project.create(title: 'Ping Pong')
    comment = Comment.create(review: 'Nice Game', project_id: project.id)
    visit project_path(project)
    click_on 'Edit'
    fill_in 'Review', with: 'Polish This'
    click_on 'Update Comment'
    expect(page).to have_content 'Polish This'
  end

  it 'gives error when no review is entered' do
    project = Project.create(title: 'Ping Pong')
    comment = Comment.create(review: 'Nice Game', project_id: project.id)
    visit project_path(project)
    click_on 'Edit'
    fill_in 'Review', with: ''
    click_button 'Update Comment'
    expect(page).to have_content 'errors'
  end
end
