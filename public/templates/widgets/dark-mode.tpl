<nav>
	<div class="theme-switch-wrapper d-flex align-self-center">
		<button type="button" class="theme-switch position-relative d-flex align-items-center justify-content-center rounded-circle border-0" style="width: 36px; height: 36px;" aria-label="Toggle theme">
			<i class="fa-solid fa-sun theme-icon theme-icon-light"></i>
			<i class="fa-solid fa-moon theme-icon theme-icon-dark"></i>
			<i class="fa-solid fa-desktop theme-icon theme-icon-system"></i>
		</button>
	</div>
<style>
.theme-switch {
	background-color: var(--bs-tertiary-bg, var(--bs-secondary-bg));
	color: var(--bs-body-color);
	outline: 1px solid var(--bs-border-color);
	transition: background-color .2s ease, transform .1s ease;
}
.theme-switch:hover { background-color: var(--bs-secondary-bg); }
.theme-switch:active { transform: scale(0.92); }
.theme-switch .theme-icon {
	position: absolute;
	opacity: 0;
	transform: scale(.6) rotate(-30deg);
	transition: opacity .15s ease, transform .15s ease;
	pointer-events: none;
}
.theme-switch .theme-icon-light { color: var(--bs-warning, #f0ad4e); }
.theme-switch .theme-icon-dark { color: #1b73f9; }
.theme-switch .theme-icon-system { color: var(--bs-body-color); }
.theme-switch[data-mode="light"] .theme-icon-light,
.theme-switch[data-mode="dark"] .theme-icon-dark,
.theme-switch[data-mode="system"] .theme-icon-system {
	opacity: 1;
	transform: scale(1) rotate(0deg);
}
</style>
<script>
(function() {
	const button = document.querySelector('.theme-switch');
	const modes = ['light', 'dark', 'system'];
	const media = window.matchMedia('(prefers-color-scheme: dark)');

	function resolveTheme(mode) {
		return mode === 'system' ? (media.matches ? 'dark' : 'light') : mode;
	}

	function applyMode(mode) {
		button.setAttribute('data-mode', mode);
		document.documentElement.setAttribute('data-bs-theme', resolveTheme(mode));
	}

	let currentMode = localStorage.getItem('theme');
	if (!modes.includes(currentMode)) {
		currentMode = 'system';
	}
	applyMode(currentMode);

	media.addEventListener('change', () => {
		if (currentMode === 'system') {
			applyMode(currentMode);
		}
	});

	button.addEventListener('click', () => {
		currentMode = modes[(modes.indexOf(currentMode) + 1) % modes.length];
		localStorage.setItem('theme', currentMode);
		applyMode(currentMode);
	});
})();
</script>
</nav>
