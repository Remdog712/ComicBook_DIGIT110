// script.js
const scrollKey = document.getElementById('scrollKey');
const content = document.querySelector('.content');
const keyIndicator = document.querySelector('.key-indicator');

// Function to update the position of the key
function updateScrollKeyPosition() {
    const contentRect = content.getBoundingClientRect();
    scrollKey.style.top = `${contentRect.top}px`;
}

// Event listener to update the key position on scroll
window.addEventListener('scroll', updateScrollKeyPosition);

// Event listeners to show/hide the key on hover
scrollKey.addEventListener('mouseenter', () => {
    scrollKey.style.opacity = '1';
    keyIndicator.style.opacity = '0'; // Hide the indicator
});

scrollKey.addEventListener('mouseleave', () => {
    scrollKey.style.opacity = '0';
    keyIndicator.style.opacity = '1'; // Show the indicator
});

// Initial position update
updateScrollKeyPosition();
