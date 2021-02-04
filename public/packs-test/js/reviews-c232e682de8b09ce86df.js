/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/reviews.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/reviews.js":
/*!*****************************************!*\
  !*** ./app/javascript/packs/reviews.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// class = "ratings"の子要素を取得
var stars = document.querySelector(".ratings").children; // const stars = document.getElementsByClassName("ratings").children;
// id = "rating-value"の要素を取得

var ratingValue = document.getElementById("rating-value"); // id = "rating-value-display"の要素を取得

var ratingValueDisplay = document.getElementById("rating-value-display"); // indexという変数を定義

var index; // reveiwの投稿ページに遷移するとstars.lengthの値（5）だけ繰り返し

var _loop = function _loop(i) {
  console.log(stars.length); // 星にカーソルが乗ったときに実行する関数を定義

  stars[i].addEventListener("mouseover", function () {
    // stars.lengthの値（5）だけ繰り返し
    // つまり、星カーソルが乗った時、5回繰り返される
    for (var j = 0; j < stars.length; j++) {
      console.log(stars.length); // まず全て星をくり抜く

      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    } // そのあと星の数だけ以下の関数が繰り返される。


    for (var _j = 0; _j <= i; _j++) {
      console.log(stars.length);

      stars[_j].classList.remove("fa-star-o"); // カーソルが乗った星まで星を塗りつぶす


      stars[_j].classList.add("fa-star");
    }
  }); // クリックされた星の番号+1をratingValueに代入

  stars[i].addEventListener("click", function () {
    ratingValue.value = i + 1;
    ratingValueDisplay.textContent = ratingValue.value; // indexにクリックされた星の番号を代入

    index = i;
  }); // 星からカーソルが離れたときに実行される関数

  stars[i].addEventListener("mouseout", function () {
    // まず5回繰り返す
    for (var j = 0; j < stars.length; j++) {
      // まず全ての星をくり抜く
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }

    for (var _j2 = 0; _j2 <= index; _j2++) {
      // クリックされている星まで塗りつぶす
      stars[_j2].classList.remove("fa-star-o");

      stars[_j2].classList.add("fa-star");
    }
  });
};

for (var i = 0; i < stars.length; i++) {
  _loop(i);
}

/***/ })

/******/ });
//# sourceMappingURL=reviews-c232e682de8b09ce86df.js.map