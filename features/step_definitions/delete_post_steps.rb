Given(/^there is a post titled with "(.*?)" and content with "(.*?)"$/) do |title, content|
  @post=Post.create!({ :title => "title", :content => "content", :post_time=> Time.now})
end

When(/^I select the post$/) do
  visit("/posts")
  click_link("Show")
end

When(/^I click "(.*?)"$/) do |button|
  click_on button
end

Then(/^the post should be deleted$/) do
  page.should_not have_content(@post.title)
end
