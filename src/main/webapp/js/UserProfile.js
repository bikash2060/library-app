document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.side-bar ul li a');
    const sections = document.querySelectorAll('.content-section');

    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            // Remove active class from all links and sections
            links.forEach(link => link.parentElement.classList.remove('active'));
            sections.forEach(section => section.classList.remove('active'));

            // Get the target section ID
            const targetId = this.getAttribute('data-target');

            // Show the target section
            const targetSection = document.getElementById(targetId);
            if (targetSection) {
                targetSection.classList.add('active');
            }

            // Set the active class on the clicked link
            this.parentElement.classList.add('active');
        });
    });
});