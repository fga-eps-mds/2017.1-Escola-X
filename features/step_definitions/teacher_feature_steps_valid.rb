
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

@selenium

Given (/^I am on the log in page$/) do
	driver.get('http://localhost:3000/')
end

And (/^I fill in "Login" with "123456"$/) do
	login = driver.find_element(:name, 'login')
	login.send_keys "123456"
end

And (/^I fill in "Senha" with "12345678"$/) do
	senha = driver.find_element(:name, 'password')
	senha.send_keys "12345678"
end

When (/^I press "Entrar" button$/) do
	entrar = driver.find_element(:name, 'commit')
	entrar.click
end

Then (/^I login$/) do
	driver.get('http://localhost:3000/users')
end

Given (/^I am on the user in page$/) do
	driver.get('http://localhost:3000/users')
end

When (/^I press "Criar Professor" field$/) do
	driver.get('http://localhost:3000/teachers/new')
end

And (/^I fill in "Nome" with "Victor Hugo"$/) do
	nameUser = driver.find_element(:name, 'teacher[name]')
	nameUser.send_keys "Victor Hugo"
end

And (/^I fill in "Matricula" with "153456"$/) do
	matriculaUser = driver.find_element(:name, 'teacher[registry]')
	matriculaUser.send_keys "153456"
end

And (/^I fill in "CPF" with "02951294174"$/) do
	cpfUser = driver.find_element(:name, 'teacher[employee_cpf]')
	cpfUser.send_keys "02951294174"
end

And (/^I fill in "Senha" with "bgatahkei42"$/) do
	senhaUser = driver.find_element(:name, 'teacher[password]')
	senhaUser.send_keys "bgatahkei42"
end
	
And (/^I fill in "Turno" with "Matutino"$/) do
	turnUser = driver.find_element(:name, 'teacher[shift]')
	turnUser.send_keys "Matutino"
end

And (/^I fill in "Endereço" with "QR 602 Conjunto 06 Casa 05"$/) do
	addressUser = driver.find_element(:name, 'teacher[address]')
	addressUser.send_keys "QR 602 Conjunto 06 Casa 05"
end

And (/^I fill in "Telefone" with "61983104981"$/) do
	phoneUser = driver.find_element(:name, 'teacher[phone]')
	phoneUser.send_keys "61983104981"
end
		
And (/^I fill in "Data de Nascimento" with "09071995"$/) do
	birthDate = driver.find_element(:name, 'teacher[birth_date]')
	birthDate.send_keys "09071995"
end

And (/^I fill in "Sexo" with "Masculino"$/) do
	driver.find_element(:id, 'teacher_gender_masculino').selected?
	driver.find_element(:id, 'teacher_gender_masculino').click
end
	
When (/^I press "Salvar" button$/) do
	saveButton = driver.find_element(:name, 'button')
	saveButton.click
end
		
Then (/^I register the teacher and I go to page users$/) do
	driver.get('http://localhost:3000/users')
end