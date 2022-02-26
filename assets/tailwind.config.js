module.exports = {
  darkMode: 'media',
  content: [
    "./js/**/*.js",
    "../lib/*_web/**/*.*ex",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      animation: {
        'spin-once': 'spin 1s linear'
      }
    },
  },
  variants: [],
  plugins: [
    require('flowbite/plugin')
  ],
};
