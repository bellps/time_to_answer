namespace :dev do
    DEFAULT_PASSWORD = 123456
    DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
        if Rails.env.development?
            show_spinner("Apagando BD...") { %x(rails db:drop) } # %x() executa um comando de terminar
            show_spinner("Criando BD...") { %x(rails db:create) }
            show_spinner("Migrando BD...") { %x(rails db:migrate) }
        end
        show_spinner("Cadastrando admin") { %x(rails dev:add_default_admin) }
        show_spinner("Cadastrando admins extras") { %x(rails dev:add_extras_admins) }
        show_spinner("Cadastrando usuário...") { %x(rails dev:add_default_user) }
        show_spinner("Cadastrando assuntos...") { %x(rails dev:add_subjects) }
        show_spinner("Cadastrando perguntas e respostas...") { %x(rails dev:add_answers_and_questions) }
        show_spinner("Cadastrando gêneros...") { %x(rails db:seed) }
    end

    desc "Adiciona o administrador padrão"
    task add_default_admin: :environment do
        Admin.create!(
            email: 'admin@admin.com',
            password: DEFAULT_PASSWORD,
            password_confirmation: DEFAULT_PASSWORD
        )
    end
    
    desc "Adiciona administradores extras"
    task add_extras_admins: :environment do
        10.times do |i|
            Admin.create!(
                email: Faker::Internet.email,
                password: DEFAULT_PASSWORD,
                password_confirmation: DEFAULT_PASSWORD
            )
        end
    end

    desc "Adiciona o usuário padrão"
    task add_default_user: :environment do
        User.create!(
            email: 'user@user.com',
            password: DEFAULT_PASSWORD,
            password_confirmation: DEFAULT_PASSWORD
        )
    end

    desc "Adiciona assuntos padrões"
    task add_subjects: :environment do
        file_name = 'subjects.txt'
        file_path = File.join(DEFAULT_FILES_PATH, file_name)
        
        File.open(file_path, 'r').each do |line|
            Subject.create!(description: line.strip)
        end
    end

    desc "Adiciona perguntas e respostas"
    task add_answers_and_questions: :environment do
        Subject.all.each do |subject|
            params = create_question_params(subject)
            Question.create!(params[:question])
        end
    end

    desc "Reseta o contador de questões por assunto"
    task reset_counter: :environment do
        Subject.all.each do |subject|
            Subject.reset_counters(subject.id, :questions)
        end
    end

    desc "Adiciona respostas ao Redis"
    task add_answers_to_redis: :environment do
        Answer.find_each do |answer|
            Rails.cache.write(answer.id, "#{answer.question_id}@@#{answer.correct}")
        end
    end

    private
    def show_spinner(msg_start, msg_end = '(Prontinho!)')
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :arc)
        spinner.auto_spin
        yield
        spinner.success(msg_end)
    end

    def get_answers 
        answers = []
        2.times do
            answers.push(
                { description: Faker::Lorem.sentence, correct: false }
            )
        end

        index = rand(answers.size)
        answers[index][:correct] = true
        return answers
    end

    def create_question_params(subject =  Subject.all.sample)
        { question: {
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject,
            answers_attributes: get_answers()
        }}
    end
    
end
