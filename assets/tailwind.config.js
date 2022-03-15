module.exports = {
  darkMode: 'class',
  content: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex',
    './node_modules/flowbite/**/*.js',
  ],
  theme: {
    extend: {
      animation: {
        'spin-once': 'spin 1s linear',
      },
      boxShadow: {
        xs: '0 0 0 1px rgba(0, 0, 0, 0.05)',
        outline: '0 0 0 3px rgba(66, 153, 225, 0.5)',
      },
    },
  },
  variants: [],
  plugins: [require('flowbite/plugin'), require('@tailwindcss/typography')],
};
