from django.shortcuts import render , redirect
from django.contrib.auth.models import User
from django.contrib import auth
# Create your views here.
def signup(request):
	if request.method == 'POST':

		if request.POST['password'] == request.POST['password-repeat']:
			try:
				user = User.objects.get(username=request.POST['username'])
				return render(request,'signup.html',{'error':'Email already exist!!!'})
			except User.DoesNotExist:
				user = User.objects.create_user(username=request.POST['username'],email=request.POST['email'],password=request.POST['password'],first_name=request.POST['naame'])
				auth.login(request,user)
				return redirect('home')
		else:
			return render(request,'signup.html',{'error':'Password does not match'})
	else:

		return render(request,'signup.html')

def login(request):
	if request.method == 'POST':
		user = auth.authenticate(username=request.POST['username'],password=request.POST['password'])
		if user is not None:
			auth.login(request,user)
			return redirect('home')
		else:
			return render(request,'login.html',{'error':'Username or password is incorrect.'})

	else:
		return render(request,'login.html')

def logout(request):
	if request.method == 'POST':
		auth.logout(request)
		return redirect('home')from django.shortcuts import render