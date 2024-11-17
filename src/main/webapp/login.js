
//En este JavaScrip se manejan los movimientos dinamicos de los iconos. 
document.addEventListener('DOMContentLoaded', () => {
    const togglePassword = document.getElementById('togglePassword');
    const passwordField = document.getElementById('passwordField');
    const iconLock = document.querySelector('.fa-lock');
    const iconEye = document.querySelector('.fa-eye');
    const iconEyeSlash = document.querySelector('.fa-eye-slash');

    togglePassword.addEventListener('click', function () {
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);

        if (type === 'password') {
            iconEye.style.display = 'inline';
            iconEyeSlash.style.display = 'none';
        } else {
            iconEye.style.display = 'none';
            iconEyeSlash.style.display = 'inline';
        }
    });

    passwordField.addEventListener('focus', () => {
        if (passwordField.value) {
            togglePassword.style.display = 'inline';
        }
        iconLock.style.display = 'none';
    });

    passwordField.addEventListener('blur', () => {
        if (!passwordField.value) {
            togglePassword.style.display = 'none';
            iconLock.style.display = 'inline';
        }
    });

    passwordField.addEventListener('input', function () {
        if (this.value) {
            togglePassword.style.display = 'inline';
            iconLock.style.display = 'none';
        } else {
            togglePassword.style.display = 'none';
            iconLock.style.display = 'inline';
        }
    });
});
