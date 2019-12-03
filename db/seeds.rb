# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#criando teams
for i in ["AAA", "BBB", "CCC"] do
    @team=Team.create(name: i, description: "team "+ i +" AAA of applied mechatronics from Poli-USP")
    file= File.open(File.join(Rails.root, 'app/assets/images/logo_'+i+'.png'))
    image= @team.photo(filename: file)
    image.save
end

#criando team admins
j=1
for i in ["111", "333", "555"] do
    
    @student=Student.create(given_name: i, family_name: i, email: i, password: i, password_confirmation: i, team_id: j, admin: true)
    file= File.open(File.join(Rails.root, 'app/assets/images/foto_'+i+'.png'))
    image= @student.photo(filename: file)
    image.save
    j=j+1
end

#criando team members
j=1
for i in ["222","444","666"] do
    
    @student=Student.create(given_name: i, family_name: i, email: i, password: i, password_confirmation: i, team_id: j, admin: false)
    file= File.open(File.join(Rails.root, 'app/assets/images/foto_'+i+'.png'))
    image= @student.photo(filename: file)
    image.save
    j=j+1
end

#criando tools
j=1
t=1
for i in ["furadeira", "serrote", "chave_de_fenda", "lixadeira_orbital", "martelo", "serra_arco"] do
    
    @tool=Student.create(name: i, description: i, email: i, quantity: j, team_id: t)
    file= File.open(File.join(Rails.root, 'app/assets/images/foto_'+i+'.png'))
    image= @tool.photo(filename: file)
    image.save
    j=j+1
    if j%2==0
        t=t+1
    end
end