require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

@selenium

Given (/^I am on the login page$/) do
	driver.get('http://localhost:3000/')
end

And (/^I fill in field "Login" with "123456"$/) do
	login = driver.find_element(:name, 'login')
	login.send_keys "123456"
end

And (/^I fill in field "Senha" with "12345678"$/) do
	senha = driver.find_element(:name, 'password')
	senha.send_keys "12345678"
end

When (/^I click in "Entrar" button$/) do
	entrar = driver.find_element(:name, 'commit')
	entrar.click
end

Then (/^I logon$/) do
	driver.get('http://localhost:3000/users')
end

Given (/^I am on the users in page$/) do
	driver.get('http://localhost:3000/users')
end

When (/^I press "Criar" field$/) do
	driver.get('http://localhost:3000/parents/new')
end

And (/^I click in "Responsável e Aluno" I had register one parent and one alumn$/) do
	driver.get('http://localhost:3000/parents/new')
end

And (/^I fill in field parent "Nome" with "Victor Hugo"$/) do
	parent_name = driver.find_element(:name, 'parent[name]')
	parent_name.send_keys "Victor Hugo"
end

And (/^I fill in field parent "CPF" with "02951294174"$/) do
	parent_cpf = driver.find_element(:name, 'parent[parent_cpf]')
	parent_cpf.send_keys "02951294174"
end

And (/^I fill in field parent "Senha" with "123456"$/) do
	parent_password = driver.find_element(:name, 'parent[password]')
	parent_password.send_keys "123456"
end

And (/^I fill in field parent "Endereço" with "QR 612 Conjunto 12 Casa 21"$/) do
	parent_address = driver.find_element(:name, 'parent[address]')
	parent_address.send_keys "QR 612 Conjunto 12 Casa 21"
end

And (/^I fill in field parent "Telefone" with "6133456382"$/) do
	parent_phone = driver.find_element(:name, 'parent[phone]')
	parent_phone.send_keys "6133456382"
end

And (/^I fill in field parent "Data de Nascimento" with "12121912"$/) do
	parent_birth = driver.find_element(:name, 'parent[birth_date]')
	parent_birth.send_keys "12121912"
end
	
And (/^I fill in field parent "Sexo" with "Masculino"$/) do
	driver.find_element(:id, 'parent_gender_masculino').selected?
	driver.find_element(:id, 'parent_gender_masculino').click
end

When (/^I press "Salvar" I had register one alumn$/) do
	entrar = driver.find_element(:name, 'button')
	entrar.click
end

Then (/^I register alumn now, I had stay in page alumn new$/) do
	driver.get('http://localhost:3000/parents/5/alumns/new')
end

And (/^I fill in field alumn "Nome" with "Trolando"$/) do
	alumn_name = driver.find_element(:name, 'alumn[name]')
	alumn_name.send_keys "Trolando"
end

And (/^I fill in field alumn "Matricula" with "153456"$/) do
	alumn_registry = driver.find_element(:name, 'alumn[registry]')
	alumn_registry.send_keys '153456'
end 

And (/^I fill in field alumn "Senha" with "bgatahkei42"$/) do
	alumn_password = driver.find_element(:name, 'alumn[password]')
	alumn_password.send_keys 'bgatahkei42'
end

And (/^I fill in field alumn "Turno" with "Matutino"$/) do
	alumn_turn = driver.find_element(:name, 'alumn[shift]')
	alumn_turn.send_keys 'Matutino'
end

And (/^I fill in field alumn "Endereço" with "QR 602 Conjunto 06 Casa 05"$/) do
	alumn_address = driver.find_element(:name, 'alumn[address]')
	alumn_address.send_keys 'QR 602 Conjunto 06 Casa 05'
end
	
And (/^I fill in field alumn "Telefone" with "61983104981"$/) do
	alumn_phone = driver.find_element(:name, 'alumn[phone]')
	alumn_phone.send_keys '6198310481'
end


And (/^I fill in field alumn "Data de Nascimento" with "09071995"$/) do
	alumn_birth = driver.find_element(:name, 'alumn[birth_date]')
	alumn_birth.send_keys '09071995'
end
	
And (/^I fill in field alumn "Sexo" with "Masculino"$/) do
	driver.find_element(:id, 'alumn_gender_masculino').selected?
	driver.find_element(:id, 'alumn_gender_masculino').click
end
	
When (/^I press field alumn "Salvar" button$/) do
	entrar = driver.find_element(:name, 'button')
	entrar.click
end
	
Then (/^I register the alumn and I go to page users$/) do
	driver.get('http://localhost:3000/alumns/4')
end

When (/^I press field "Dar Suspensão" button$/) do
	driver.get('http://localhost:3000/alumns/4/suspensions/new')
end

And (/^I fill in field "Motivo da Suspensão" with "Não interessa"$/) do
	suspension_title = driver.find_element(:name, 'suspension[title]')
	suspension_title.send_keys 'Não interessa'	
end
		
And (/^I fill in field "Quantidade de Dias" with "42"$/) do
	suspension_quantityDays = driver.find_element(:name, 'suspension[quantity_days]')
	suspension_quantityDays.send_keys '42'
end
	
And (/^I fill in field "Descrição da Suspensão" with "MEU CORAÇÃO É TÃO RESPLANDECENTE"$/) do
	suspension_description = driver.find_element(:name, 'suspension[description]')
	suspension_description.send_keys 'MEU CORAÇÃO É TÃO RESPLANDECENTE'
end

And (/^I fill in field "Data da Suspensão" with "12121912"$/) do
	suspension_date = driver.find_element(:name, 'suspension[date_suspension]')
	suspension_date.send_keys '12121912'
end

When (/^I press field "Salvar" button$/) do
	driver.get('http://localhost:3000/suspensions/1')
end
