require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

@selenium

### Logins

Given (/^I am logged in as parent$/) do
	driver.get('http://localhost:3000/')
	login = driver.find_element(:name, 'login')
	login.send_keys "00968977162"
	senha = driver.find_element(:name, 'password')
	senha.send_keys "12345678"
	entrar = driver.find_element(:name, 'commit')
	entrar.click
end

Given (/^I am logged in as alumn$/) do
	driver.get('http://localhost:3000/')
	login = driver.find_element(:name, 'login')
	login.send_keys "654321"
	senha = driver.find_element(:name, 'password')
	senha.send_keys "12345678"
	entrar = driver.find_element(:name, 'commit')
	entrar.click
end

Given (/^I am logged in as principal$/) do
	driver.get('http://localhost:3000/')
	login = driver.find_element(:name, 'login')
	login.send_keys "123456"
	senha = driver.find_element(:name, 'password')
	senha.send_keys "12345678"
	entrar = driver.find_element(:name, 'commit')
	entrar.click
end

### Data - Alumn

And (/^I fill in field alumn "Nome" with "Leo Arthur"$/) do
	alumn_name = driver.find_element(:name, 'alumn[name]')
	alumn_name.send_keys "Leo Arthur"
end

And (/^I fill in field alumn "Matricula" with "456789"$/) do
	alumn_registry = driver.find_element(:name, 'alumn[registry]')
	alumn_registry.send_keys '456789'
end

And (/^I fill in field alumn "Senha" with "222222"$/) do
	alumn_password = driver.find_element(:name, 'alumn[password]')
	alumn_password.send_keys '222222'
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

### Data - Secretary

And (/^I fill in "Nome" with "Juca Balla"$/) do
	nameUser = driver.find_element(:name, 'secretary[name]')
	nameUser.send_keys "Juca Balla"
end

And (/^I fill in "CPF" with "46804811372"$/) do
	cpfUser = driver.find_element(:name, 'secretary[employee_cpf]')
	cpfUser.send_keys "46804811372"
end

And (/^I fill in "Matricula" with "147258"$/) do
	matriculaUser = driver.find_element(:name, 'secretary[registry]')
	matriculaUser.send_keys "147258"
end

And (/^I fill in "Senha" with "555555555"$/) do
	senhaUser = driver.find_element(:name, 'secretary[password]')
	senhaUser.send_keys "555555555"
end

And (/^I fill in "Data de Admissão" with "09071995"$/) do
	birthDate = driver.find_element(:name, 'secretary[admission_date]')
	birthDate.send_keys "09071995"
end

And (/^I fill in "Turno" with "Integral"$/) do
	turnUser = driver.find_element(:name, 'secretary[shift]')
	turnUser.send_keys "Integral"
end

And (/^I fill in "Endereço" with "Super República do Gama - Gama Sul"$/) do
	addressUser = driver.find_element(:name, 'secretary[address]')
	addressUser.send_keys "Super República do Gama - Gama Sul"
end

And (/^I fill in "Telefone" with "61983104999"$/) do
	phoneUser = driver.find_element(:name, 'secretary[phone]')
	phoneUser.send_keys "61983104999"
end

And (/^I fill in "Data de Nascimento" with "01011800"$/) do
	birthDate = driver.find_element(:name, 'secretary[birth_date]')
	birthDate.send_keys "01011800"
end

And (/^I fill in secretary "Sexo" with "Masculino"$/) do
	driver.find_element(:id, 'secretary_gender_masculino').selected?
	driver.find_element(:id, 'secretary_gender_masculino').click
end

### Data - Teacher

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

### Data - Parent

And (/^I fill in field parent "Nome" with "Naiara Camelo"$/) do
	parent_name = driver.find_element(:name, 'parent[name]')
	parent_name.send_keys "Naiara Camelo"
end

And (/^I fill in field parent "CPF" with "02951294174"$/) do
	parent_cpf = driver.find_element(:name, 'parent[parent_cpf]')
	parent_cpf.send_keys "02951294174"
end

And (/^I fill in field parent "Senha" with "111111"$/) do
	parent_password = driver.find_element(:name, 'parent[password]')
	parent_password.send_keys "111111"
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

And (/^I fill in field parent "Sexo" with "Feminino"$/) do
	driver.find_element(:id, 'parent_gender_feminino').selected?
	driver.find_element(:id, 'parent_gender_feminino').click
end

### Data - Suspensions

And (/^I fill in field "Motivo da Suspensão" with "Bater na Professora"$/) do
	suspension_title = driver.find_element(:name, 'suspension[title]')
	suspension_title.send_keys 'Bater na Professora'
end

And (/^I fill in field "Quantidade de Dias" with "10"$/) do
	suspension_quantityDays = driver.find_element(:name, 'suspension[quantity_days]')
	suspension_quantityDays.send_keys '10'
end

And (/^I fill in field "Descrição da Suspensão" with "Chutou o bebe da professora"$/) do
	suspension_description = driver.find_element(:name, 'suspension[description]')
	suspension_description.send_keys 'Chutou o bebe da professora'
end

And (/^I fill in field "Data da Suspensão" with "12121912"$/) do
	suspension_date = driver.find_element(:name, 'suspension[date_suspension]')
	suspension_date.send_keys '12121912'
end

### Data - Subject

And (/^I fill in fiend subject "Nome" with "Geografia"$/) do
	subject_name = driver.find_element(:name, 'subject[name_subject]')
	subject_name.send_keys 'Geografia'
end

And (/^I fill in fiend subject "Série" with "3"$/) do
	subject_class = driver.find_element(:name, 'subject[class_level]')
	subject_class.send_keys '3'
end

And (/^I fill in fiend subject "Matrícula do Professor" with "123456"$/) do
	subject_registry = driver.find_element(:name, 'teacher_registry')
	subject_registry.send_keys '123456'
end

### Data - Notification

And (/^I fill in "Título" with "Super Gincana Beneficiente"$/) do
	subject_name = driver.find_element(:name, 'notification[title]')
	subject_name.send_keys "Super Gincana Beneficiente"
end

And (/^I fill in "Motivo" with "Arrecadar fundos pra formatura do pessoal de Softy"$/) do
	subject_name = driver.find_element(:name, 'notification[motive]')
	subject_name.send_keys "Arrecadar fundos pra formatura do pessoal de Softy"
end

And (/^I fill in "Conteúdo da Notificação" with "Muitos jogos, gincanas e aventuras"$/) do
	subject_name = driver.find_element(:name, 'notification[notification_text]')
	subject_name.send_keys "Muitos jogos, gincanas e aventuras"
end

### Data - Classroom

And (/^I fill in "Nome da Turma" with "3D"$/) do
	subject_name = driver.find_element(:name, 'classroom[name_classroom]')
	subject_name.send_keys "3D"
end

And (/^I fill in "Turno da Turma" with "Vespertino"$/) do
	subject_name = driver.find_element(:name, 'classroom[shift_classroom]')
	subject_name.send_keys "Vespertino"
end


### Initial pages

Then (/^I logged as parent$/) do
	driver.get('http://localhost:3000/alumns')
end

Then (/^I logged as principal$/) do
	driver.get('http://localhost:3000/users')
end

Then (/^I logged as alumn$/) do
	driver.get('http://localhost:3000/alumns/1')
end

### Initial status

Given (/^I am on the users in page$/) do
	driver.get('http://localhost:3000/users')
end

### Buttons pressed

When (/^I press "Criar Professor" button$/) do
	driver.get('http://localhost:3000/teachers/new')
end

When (/^I press "Criar" field$/) do
	driver.get('http://localhost:3000/parents/new')
end

And (/^I click in "Responsável e Aluno" I had register one parent and one alumn$/) do
	driver.get('http://localhost:3000/parents/new')
end

When (/^I press "Salvar" button$/) do
	entrar = driver.find_element(:name, 'button')
	entrar.click
end

When (/^I had register a suspension$/) do
	driver.get('http://localhost:3000/suspensions/1')
end

When (/^I press field "Dar Suspensão" button$/) do
	driver.get('http://localhost:3000/alumns/1/suspensions/new')
end

When (/^I press "Visualizar" button$/) do
	driver.get('http://localhost:3000/alumns/1')
end

When (/^I press "Matéria" button$/) do
	driver.get('http://localhost:3000/subjects')
end

And (/^I press "Nova Matéria" button$/) do
	driver.get('http://localhost:3000/subjects/new')
end

When (/^I press "Avisos" button$/) do
	driver.get('http://localhost:3000/notifications')
end

When (/^I press "Melhor Notificação" button$/) do
	driver.get('http://localhost:3000/notifications/1')
end

And (/^I press "Notificação" button$/) do
	driver.get('http://localhost:3000/notifications/1')
end

When (/^I press "Advertencias" button$/) do
	driver.get('http://localhost:3000/alumns/1/strikes')
end

When (/^I press "Responsável" button$/) do
	driver.get('http://localhost:3000/parents/1')
end

When (/^I press "Criar Secretário" button$/) do
	driver.get('http://localhost:3000/secretaries/new')
end

When (/^I press "Visualizar Secretários" button$/) do
	driver.get('http://localhost:3000/secretaries')
end

When (/^I press "Visualizar Turmas" button$/) do
	driver.get('http://localhost:3000/classrooms')
end

When (/^I press "Visualizar Alunos" button$/) do
	driver.get('http://localhost:3000/alumns')
end

And (/^I press "Nova Notificação" button$/) do
	driver.get('http://localhost:3000/notifications/new')
end

And (/^I press "Criar Turma" button$/) do
	driver.get('http://localhost:3000/classrooms/new')
end

### Registrys

Then (/^I register alumn now, I had stay in page alumn new$/) do
	driver.get('http://localhost:3000/parents/5/alumns/new')
end

Then (/^I register the alumn and I go to page users$/) do
	driver.get('http://localhost:3000/alumns/4')
end

Then (/^I register the teacher and I go to page users$/) do
	driver.get('http://localhost:3000/users')
end

Then (/^I register the secretary and I go to page secretaries$/) do
	driver.get('http://localhost:3000/secretaries/')
end

Then (/^I register the subject$/) do
	driver.get('http://localhost:3000/users')
end

Then (/^I see notification$/) do
	driver.get('http://localhost:3000/notifications/1')
end

Then (/^I see information$/) do
	driver.get('http://localhost:3000/alumns/1')
end

Then (/^I see strikes$/) do
	driver.get('http://localhost:3000/alumns/1/strikes')
end

Then (/^I see parent information$/) do
	driver.get('http://localhost:3000/parents/1')
end

Then (/^I see nofications information$/) do
	driver.get('http://localhost:3000/notifications/1')
end

Then (/^I see notification created$/) do
	driver.get('http://localhost:3000/notifications/2')
end

Then (/^I see classroom created$/) do
	driver.get('http://localhost:3000/classrooms/2')
end

Then (/^I see all secretaries$/) do
	driver.get('http://localhost:3000/secretaries')
end

Then (/^I see all classrooms$/) do
	driver.get('http://localhost:3000/classrooms')
end

Then (/^I see all alumns$/) do
	driver.get('http://localhost:3000/alumns')
end