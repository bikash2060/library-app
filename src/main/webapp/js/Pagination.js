    function activeLink(event) {
    const links = document.querySelectorAll('.pagination .link');
    links.forEach(link => link.classList.remove('active'));
    event.target.classList.add('active');
}

    function backBtn() {
    const currentPage = parseInt(document.querySelector('.pagination .active').dataset.value);
    if (currentPage > 1) {
    window.location.href = `?page=${currentPage - 1}`;
}
}

    function nextBtn() {
    const currentPage = parseInt(document.querySelector('.pagination .active').dataset.value);
    const totalPages = document.querySelectorAll('.pagination .link').length;
    if (currentPage < totalPages) {
    window.location.href = `?page=${currentPage + 1}`;
}
}
