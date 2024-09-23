Given("I visit {string}") do |string|
  visit string
end

And('dismiss the automated pop-up') do
  find('button.needsclick.klaviyo-close-form.go260142404.kl-private-reset-css-Xuajs1').click
end

When('I enter vehicle search parameters') do
  select('2020', from: 'yearDropdown')
  select('Volkswagen', from: 'makeDropdown')
  select('GTI', from: 'modelDropdown')
  select('Autobahn', from: 'subModelDropdown')
  select('6-speed Manual 02Q by Volkswagen', from: 'transmissionDropdown')
end

And('I add an item to my cart') do
  find(:xpath, "/html/body/div[4]/div/div/div[1]/section/div[3]/div[1]/div[2]/div/h3/a").click
  find(:xpath, "/html/body/div[4]/div/div/div/div[2]/div[2]/div/div[2]/div[6]/div[3]/div[1]").click
end

Then('I should see the item in my cart') do
  sleep 1
  find(:xpath,"//div[1]/div/div/div[3]/div[1]/div[1]/div/a").click
end

Then('begin the checkout process') do
  find(:xpath, "/html/body/div[3]/div/div/div/div[2]/div[2]/div[1]/a").click
end

And('proceed as a guest') do
  fill_in('spree_guest_email_login', with: "testemail@test.com")
  ###uncheck('spree_user[subscribe_me]') having trouble with this one
  find_button('Continue').click
end

Then('I input necessary checkout information') do
  fill_in('First name', with: 'Caleb')
  fill_in('Last name', with: 'Jackson')
  fill_in('Street address', with: '123 Fake Address Lane')
  fill_in('City', with: 'Testing City')
  select('Florida', from: 'order_bill_address_attributes_state_id')
  fill_in('Zip code', with: '32738')
  fill_in('Phone number', with: '(123) 456-7890')
  
  find_button('Continue To Shipping').click
  sleep 2
  find_button('Continue as is').click
  find_button('Continue To Payment').click
end

And('I should see the payment information screen') do
    page.has_content?('Payment Method')
    save_and_open_screenshot
end
