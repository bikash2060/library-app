// For validation:
const userName = document.getElementById('username');
const password = document.getElementById('password');
const loginForm = document.getElementById('form');

const usernameError = document.getElementById('username-error');
const passwordError = document.getElementById('password-error');

// Function to hide username error message
function hideUsernameError() {
    if (userName.value.trim() !== '') {
        usernameError.innerHTML = '';
    }
}

// Function to hide password error message
function hidePasswordError() {
    if (password.value.trim() !== '') {
        passwordError.innerHTML = '';
    }
}

// Event listener for input event on username field
userName.addEventListener('input', hideUsernameError);

// Event listener for input event on password field
password.addEventListener('input', hidePasswordError);


loginForm.addEventListener('submit',(e)=>{
    if(userName.value == '' || userName.value == null){
        e.preventDefault();
        usernameError.innerHTML = 'Username is required';
    }
    else{
        usernameError.innerHTML = '';
    }

    if(password.value == '' || password.value == null){
        e.preventDefault();
        passwordError.innerHTML = 'Password is required';
    }
})

// For Show Password Icon
document.addEventListener('DOMContentLoaded', function() {
    const passwordInput = document.getElementById('password');
    const showPassIcon = document.querySelector('#pass .showPass');

    showPassIcon.addEventListener('click', function() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            showPassIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            showPassIcon.classList.remove('fa-eye-slash');
        }
    });

    passwordInput.addEventListener('input', function() {
        if (passwordInput.value.length > 0) {
            showPassIcon.style.display = 'block';
        } else {
            showPassIcon.style.display = 'none';
        }
    });

    if (passwordInput.value.length > 0) {
        showPassIcon.style.display = 'block';
    } else {
        showPassIcon.style.display = 'none';
    }
});