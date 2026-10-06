document.addEventListener('DOMContentLoaded', () => {

    // 1. Remove from Favorites
    document.body.addEventListener('click', (e) => {
        const removeBtn = e.target.closest('a[data-optimistic="remove-favorite"]');
        if (removeBtn) {
            e.preventDefault();
            const url = removeBtn.href;
            const card = removeBtn.closest('.group');
            
            if (card) card.style.display = 'none';

            fetch(url, { method: 'GET' })
            .then(res => {
                if(res.redirected) window.location.href = res.url;
                if(!res.ok) throw new Error();
            })
            .catch(err => {
                if (card) card.style.display = '';
                alert("Failed to remove from favorites. Please try again.");
            });
        }
    });

    // 2. Admin User Toggles
    document.body.addEventListener('submit', (e) => {
        const form = e.target.closest('form[data-optimistic="toggle-status"]');
        if (form) {
            e.preventDefault();
            const btn = form.querySelector('button[type="submit"]');
            const originalText = btn.textContent.trim();
            const originalClass = btn.className;
            
            if (originalText === 'Ban User') {
                btn.textContent = 'Activate';
                btn.className = 'px-3 py-1.5 rounded-lg bg-tertiary-container text-on-tertiary font-label-sm font-semibold hover:opacity-90 transition-opacity';
            } else {
                btn.textContent = 'Ban User';
                btn.className = 'px-3 py-1.5 rounded-lg bg-secondary-fixed text-secondary font-label-sm font-semibold hover:bg-secondary-container hover:text-on-secondary transition-colors';
            }

            const formData = new URLSearchParams(new FormData(form));
            fetch(form.action, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => {
                if(res.redirected) window.location.href = res.url;
                if(!res.ok) throw new Error();
            })
            .catch(err => {
                btn.textContent = originalText;
                btn.className = originalClass;
                alert("Failed to update user status.");
            });
        }
    });

    // 3. Delete Property
    document.body.addEventListener('submit', (e) => {
        const form = e.target.closest('form[data-optimistic="delete-property"]');
        if (form) {
            e.preventDefault();
            
            // Confirm dialog handling
            if (!confirm('Are you sure you want to delete this property?')) {
                return;
            }

            const row = form.closest('.p-5, tr, .group');
            if (row) {
                row.style.display = 'none';
            }

            const formData = new URLSearchParams(new FormData(form));
            fetch(form.action, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => {
                if(res.redirected) window.location.href = res.url;
                if(!res.ok) throw new Error();
            })
            .catch(err => {
                if (row) row.style.display = '';
                alert("Failed to delete property.");
            });
        }
    });

    
    // 3.5 Approve/Reject Property
    document.body.addEventListener('submit', (e) => {
        const form = e.target.closest('form[data-optimistic="moderate-property"]');
        if (form) {
            e.preventDefault();
            const row = form.closest('.group, tr');
            if (row) row.style.display = 'none';
            const formData = new URLSearchParams(new FormData(form));
            fetch(form.action, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => {
                if(res.redirected) window.location.href = res.url;
                if(!res.ok) throw new Error();
            })
            .catch(err => {
                if (row) row.style.display = '';
                alert("Failed to moderate property.");
            });
        }
    });

    // 4. Save/Like Properties
    document.body.addEventListener('click', (e) => {
        const favBtn = e.target.closest('button[data-optimistic="favorite"]');
        if (favBtn) {
            e.preventDefault();
            const propertyId = favBtn.getAttribute('data-property-id');
            const contextPath = favBtn.getAttribute('data-context-path') || '';
            const icon = favBtn.querySelector('.material-symbols-outlined, #heartIcon');
            const favText = favBtn.querySelector('#favText');
            
            if (!propertyId || !icon) return;

            let isSaved = icon.textContent.trim() === 'favorite';
            
            // Optimistically toggle
            isSaved = !isSaved;
            
            if (isSaved) {
                icon.textContent = 'favorite';
                icon.style.fontVariationSettings = "'FILL' 1";
                icon.classList.add('text-secondary-container');
                if (favText) favText.textContent = 'Saved';
            } else {
                icon.textContent = 'favorite_border';
                icon.style.fontVariationSettings = "'FILL' 0";
                icon.classList.remove('text-secondary-container');
                if (favText) favText.textContent = 'Save';
            }

            fetch(contextPath + '/favorites', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'action=' + (isSaved ? 'add' : 'remove') + '&propertyId=' + propertyId
            })
            .then(res => {
                if(res.redirected) window.location.href = res.url;
                if(!res.ok) throw new Error();
            })
            .catch(err => {
                // Revert
                isSaved = !isSaved;
                if (isSaved) {
                    icon.textContent = 'favorite';
                    icon.style.fontVariationSettings = "'FILL' 1";
                    icon.classList.add('text-secondary-container');
                    if (favText) favText.textContent = 'Saved';
                } else {
                    icon.textContent = 'favorite_border';
                    icon.style.fontVariationSettings = "'FILL' 0";
                    icon.classList.remove('text-secondary-container');
                    if (favText) favText.textContent = 'Save';
                }
                alert("Failed to update favorites. Please make sure you are logged in.");
            });
        }
    });

});
