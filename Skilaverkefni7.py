from bottle import *
from beaker.middleware import SessionMiddleware

adminuser = 'admin'
adminpwd = 'admin'

@route('/')
def index():
    return template('index')

@route('/login')
def lidura():
    return template('login')

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./myfile')

@route('/restricted')
def restricted():
    user = request.get_cookie('account', secret='my_secret_code')
    print(user)
    if (user):
        return template('restricted')
    else:
        return "You  are not logged in. Access denied"

@route('/signout')
def signout():
    response.set_cookie('account',"", expires=0)
    return "You have been signed out" "<br> <a href='/login'>Login</a>"

@route('/login', method='POST')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if username == adminuser and password == adminpwd:
        response.set_cookie('account',username,secret='my_secret_code')
        return redirect('/restricted')
    else:
        return "Login Failed. <br> <a href='/login'>Login</a>"


#Session

session_options={
    'session.type':'file',
    'session.data_dir':'./data'
}

my_session = SessionMiddleware(app(), session_options)

products = [
    {'pid':1 , 'name':'Vara A', 'price': 100},
    {'pid':2 , 'name':'Vara B', 'price': 350},
    {'pid':3 , 'name':'Vara C', 'price': 800},
    {'pid':4 , 'name':'Vara D', 'price': 400}
]

@route('/shop')
def shop():
    return template('shop' , products=products)

@route('/cart/add/<id>')
def add_to_cart(id):
    session = request.environ.get('beaker.session')
    session[id] = products[int(id)-1]['name']
    session.save()

    print(session)
    return redirect('/cart')

@route('/cart')
def cart():
    session = request.environ.get('beaker.session')
    karfa = []
    for i in range(1,len(products)+1):
        i = str(i)
        if session.get(i):
            vara = session.get(i)
            karfa.append(vara)
    return template('cart', karfa=karfa)

@route('/cart/remove')
def remove_cart():
    session = request.environ.get('beaker.session')
    session.delete()
    return redirect('/shop')

run(app=my_session)