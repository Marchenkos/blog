const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  
  content: [
    './public/*.html',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        montserrat: ['Montserrat', ...defaultTheme.fontFamily.sans]
      },
      backgroundImage: {
        'home-splash': "url('home_bg.jpeg')"
      },

      keyframes: {
        ff: {
          '0%': { transform: 'translateY(-100px)' },
          '100%': { transform: 'translateY(0px)' },
        },
        showSlide: {
          '0%': { transform: 'translateY(-100px)' },
          '100%': { transform: 'translateY(0px)' },
        },
        hideSlide: {
          '0%': { transform: 'translateY(0px)' },
          '100%': { transform: 'translateY(-100px)' },
        },
        fadeOut: {
          '0%': {
            opacity: 1,
          },
          '50%': {
            opacity: 1,
          },
          '100%': {
            opacity: 0,
          }
        },
        fadeOutWithTranslate: {
          '0%': {
            opacity: 1,
            transform: 'translateY(0px)'
          },
          '100%': {
            opacity: 0,
            transform: 'translateY(-100px)'
          }
        },
        fadeIn: {
          '0%': {
            opacity: 0,
            transform: 'translateY(-500px)'
          },
          '100%': {
            opacity: 1,
            transform: 'translateY(0px)'
          }
        },
      },
      animation: {
        showSlide: 'showSlide 0.5s ease-in-out',
        hideSlide: 'hideSlide 0.5s ease-in-out',
        fadeOut: 'fadeOut 0.5s ease-in-out',
        fadeIn: 'fadeIn 0.5s ease-in-out',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
