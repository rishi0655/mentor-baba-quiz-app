from flask import Flask, render_template, request, redirect, session, flash

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Simple in-memory storage (no database)
users = {}
quiz_results = {}

@app.route('/')
def home():
    return redirect('/login')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        users[username] = password
        flash('Registration successful! You can now login.', 'success')
        return redirect('/login')
    
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        if username in users and users[username] == password:
            session['username'] = username
            return redirect('/quiz')
        else:
            flash('Invalid username or password. Please try again.', 'error')
            return render_template('login.html')
    
    return render_template('login.html')

@app.route('/quiz')
def quiz():
    if 'username' not in session:
        return redirect('/login')
    return render_template('quiz.html')

@app.route('/result', methods=['POST'])
def result():
    correct_answers = [
        "Artificial Intelligence",
        "John McCarthy", 
        "Face Recognition",
        "Python",
        "Reinforcement Learning",
        "Machine Learning",
        "Supervised Memory",
        "Gaming",
        "AI Intelligence",
        "AI Assistant"
    ]

    correct = 0
    wrong = 0
    user_answers = []

    for i in range(1, 11):
        selected = request.form.get(f'q{i}')
        correct_ans = correct_answers[i - 1]
        user_answers.append((f'Q{i}', selected, correct_ans))
        if selected == correct_ans:
            correct += 1
        else:
            wrong += 1

    score = correct
    total = 10

    return render_template('result.html', total=total, correct=correct, wrong=wrong, score=score, user_answers=user_answers)

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect('/login')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)