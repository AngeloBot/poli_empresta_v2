# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.delete_all

Team.create(name:'AAA', description: 'Equipe de exemplo AAA', photo: 'AAA.jpg', password: 'AAA')
Team.create(name:'BBB', description: 'Equipe de exemplo BBB', photo: 'BBB.jpg', password: 'BBB')
Team.create(name:'CCC', description: 'Equipe de exemplo CCC', photo: 'CCC.jpg', password: 'CCC')

Student.create(given_name: '111', family_name: '111', email: '111', password: '111', password_confirmation: '111', admin: true, team_id: Team.first.id, team_password: 'AAA', photo: '111.png')
Student.create(given_name: '222', family_name: '222', email: '222', password: '222', password_confirmation: '222', admin: false, team_id: Team.first.id, team_password: 'AAA', photo: '222.png')

Student.create(given_name: '333', family_name: '333', email: '333', password: '333', password_confirmation: '333', admin: true, team_id: Team.second.id, team_password: 'BBB', photo: '333.png')
Student.create(given_name: '444', family_name: '444', email: '444', password: '444', password_confirmation: '444', admin: false, team_id: Team.second.id, team_password: 'BBB', photo: '444.png')

Student.create(given_name: '555', family_name: '555', email: '555', password: '555', password_confirmation: '555', admin: true, team_id: Team.third.id, team_password: 'CCC', photo: '555.png')
Student.create(given_name: '666', family_name: '666', email: '666', password: '666', password_confirmation: '666', admin: false, team_id: Team.third.id, team_password: 'CCC', photo: '666.png')

Tool.create(name: 'Furadeira', description: 'Furadeira de impacto com mandril de 12"', quantity: 3, photo: 'A1.jpg', team_id: Team.first.id)
Tool.create(name: 'Martelo', description: 'Martelo de unha 29mm', quantity: 1, photo: 'A2.jpg', team_id: Team.first.id)

Tool.create(name: 'Chave de fenda', description: 'Chave de fenda 5mm', quantity: 2, photo: 'B1.jpg', team_id: Team.second.id)
Tool.create(name: 'Serrote', description: 'Cabo de madeira', quantity: 2, photo: 'B2.jpg', team_id: Team.second.id)
