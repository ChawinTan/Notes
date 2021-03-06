const theme = {
    fontFamily: 'Comic Sans MS',
    heading: {
        fontWeight: 700,
        color: 'rgba(51, 51, 51, 0.7)',
        letterSpacing: 2,
    },
    body: {
        color: 'rgba(51, 51, 51, 0.7)',
    },
    icon: {
        defaultColor: '#0084b4', // twitter dark blue
        mailIcon: '#ff4c4c',
        linkedinIcon: "#0072b1",
        githubIcon: "#6e5494",
        youtubeIcon: "#c4302b",
        facebookIcon: "#3b5998"
    },
    centering: {
        textAlign: "center",
        position: "absolute",
        left: "50%",
        top: "50%",
        webkitTransform: "translate(-50%, -50%)",
        transform: "translate(-50%, -50%)"
    },
    relativeCentering: {
        height: "100vh",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
    },
    link: {
        color: "#0084b4",
        fontFamily: "Comic Sans MS"
    },
    navBars: {
        backgroundColor: "#ffa500"
    },
};

// repeated fading animation material ui syntax
const useStyles = makeStyles((theme) => ({
  "@keyframes warningAnimation": {
    "0%": {
      textShadow: `0 0 2rem ${theme.palette.error.main}`,
    },
    "50%": {
      textShadow: `0 0 2rem transparent`,
    },
    "100%": {
      textShadow: `0 0 2rem ${theme.palette.error.main}`,
    }
  },
  root: {
    padding: '1rem',
    animation: '$warningAnimation 3000ms linear infinite',
  }
}));



