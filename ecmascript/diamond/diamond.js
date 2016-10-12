/* jshint esversion: 6 */

module.exports =
  class Diamond {

    makeDiamond(letter){
      return this.rows(this.size(letter)) + '\n';
    }

    size(letter) {
      return 2 * (ord(letter) - A) + 1;
    }

    rows(size) {
      return range(size).map((i) => this.columns(i, size)).join('\n');
    }

    columns(i, size) {
      return range(size).map((j) => this.letter(i, j, Math.floor(size / 2))).join('');
    }

    /*
     * @param {int} i - the row to determine a letter for.
     * @param {int} j - the column to determine a letter for.
     * @param {int} s2 - half of the diamonds edge length.
     */
    letter(i, j, s2) {
      return (Math.abs(s2 - i) + Math.abs(s2 - j) === s2) ?
        String.fromCharCode(s2 - Math.abs(s2 - i) + A) : ' ';
    }
  };

const A = ord('A');

/*
 * build a range from 1 to and including i
 */
function range(i) {
  return [...Array(i).keys()];
}

function ord(letter) {
  return letter.charCodeAt(0);
}

