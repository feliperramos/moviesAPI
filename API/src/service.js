const app = require("express")();
const http = require("http");
const serverPort = require("../config/config");
const axios = require("axios");

const API_URL = "https://jsonmock.hackerrank.com/api/movies/search/";

/*
 * getMovies of jsonmock API
 */
const getMovies = async (title, page) => {
  return await axios.get(`${API_URL}?Title=${title}&page=${page}`);
};

/*
 * function inicialize, start server
 */
function initialize() {
  return new Promise((resolve, reject) => {
    httpServer = http.createServer(app);

    httpServer
      .listen(serverPort.port, "0.0.0.0")
      .on("listening", () => {
        console.log(`Server running in localhost:${serverPort.port}`);
        resolve();
      })
      .on("error", err => {
        reject(err);
      });
  });
}

/*
 * callApi function, to return the request of user
 */
async function callApi() {
  await app.get("/api/movie/count/", async (req, res) => {
    const title = req.query.title;
    const page = 1;

    const moviesFetch = await getMovies(page, title);
    const moviesResponse = moviesFetch.data;
    const movies = moviesResponse.data;

    let data = [...movies];

    if (moviesResponse.total_pages > 1) {
      let requests = [];
      let i = 2;

      while (i <= moviesResponse.total_pages) {
        requests.push(getMovies(title, i));
        i++;
      }

      const allMovies = await Promise.all(requests);

      allMovies.map(req => {
        const result = req.data;
        const movieResult = result.data;

        data.push(...movieResult);
      });
    }

    const result = orderPerYear(data);

    res.send(result);
  });
}

const orderPerYear = (movies = []) => {
  let mapMovies = new Map();

  movies = movies.sort((a, b) => (a.Year > b.Year ? 1 : -1));

  movies.map(movie => {
    mapMovies.set(
      movie.Year,
      mapMovies.has(movie.Year) ? mapMovies.get(movie.Year) + 1 : 1
    );
  });

  let res = [];

  for (const [year, movies] of mapMovies) {
    res.push({ year, movies });
  }

  return {
    moviesByYear: res,
    total: movies.length
  };
};

module.exports = {
  initialize: initialize,
  callApi: callApi
};
