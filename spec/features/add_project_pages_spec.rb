require 'rails_helper'

describe 'the add a project process' do
  it 'adds a new project' do
    visit projects_path
    click_link 'New Project'
    fill_in 'Title', with: 'Ping Pong'
    click_on 'Create Project'
    expect(page).to have_content 'Projects'
  end

  it 'gives error when no title is entered' do
    visit new_project_path
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
