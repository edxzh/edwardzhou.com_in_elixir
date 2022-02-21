module.exports = {
  content: ["./js/**/*.js", "../lib/*_web/**/*.*ex"],
  theme: {
    extend: {
      animation: {
        'spin-once': 'spin 1s linear'
      }
    },
  },
  variants: [],
  plugins: [require("@tailwindcss/forms")],
};
