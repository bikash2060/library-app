document.getElementById('signupForm').addEventListener('submit', function (event) {
    let isValid = true;

    // Clear previous error messages
    document.getElementById('nameError').innerText = '';
    document.getElementById('emailError').innerText = '';
    document.getElementById('passwordError').innerText = '';
    document.getElementById('confirmPasswordError').innerText = '';
    document.getElementById('phoneError').innerText = '';
    document.getElementById('usernameError').innerText = '';

    // Validate first name and last name
    const firstName = document.querySelector('.fname').value.trim();
    const lastName = document.querySelector('.lname').value.trim();
    if (firstName === '' || lastName === '') {
        document.getElementById('nameError').innerText = 'Full Name is required';
        isValid = false;
    }

    // Validate email
    const email = document.querySelector('.email').value.trim();
    if (email === '') {
        document.getElementById('emailError').innerText = 'Email is required';
        isValid = false;
    }

    // Validate password
    const password = document.querySelector('.password').value.trim();
    if (password === '') {
        document.getElementById('passwordError').innerText = 'Password is required';
        isValid = false;
    }

    // Validate confirm password
    const confirmPassword = document.querySelector('.confirmPassword').value.trim();
    if (confirmPassword === '') {
        document.getElementById('confirmPasswordError').innerText = 'Confirm Password is required';
        isValid = false;
    }

    // Validate phone number
    const phoneNumber = document.querySelector('.number').value.trim();
    if (phoneNumber === '') {
        document.getElementById('phoneError').innerText = 'Phone Number is required';
        isValid = false;
    }

    // Validate username
    const username = document.querySelector('.username').value.trim();
    if (username === '') {
        document.getElementById('usernameError').innerText = 'Username is required';
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault(); // Prevent form submission if validation fails
    }
});

// Hide name error message when both fields are filled
document.querySelectorAll('.fname, .lname').forEach(input => {
    input.addEventListener('input', function() {
        const firstName = document.querySelector('.fname').value.trim();
        const lastName = document.querySelector('.lname').value.trim();
        if (firstName !== '' && lastName !== '') {
            document.getElementById('nameError').innerText = '';
        }
    });
});

// Hide individual error message when user types in the respective input fields
document.querySelectorAll('.email, .password, .confirmPassword, .number, .username').forEach(input => {
    input.addEventListener('input', function() {
        const className = this.className.split(' ')[0];
        const errorElementId = className + 'Error';
        const errorElement = document.getElementById(errorElementId);
        if (errorElement) {
            errorElement.innerText = '';
        }
    });
});
