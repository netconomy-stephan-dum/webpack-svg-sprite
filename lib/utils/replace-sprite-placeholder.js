const escapeRegExpSpecialChars = require('escape-string-regexp');

/**
 * @param {string} content
 * @param {Object<string, string>} replacements
 * @return {string}
 */
const replaceSpritePlaceholder = (content, replacements) => Object.keys(replacements).reduce(
  (result, subj) => result.replace(
    new RegExp(
      escapeRegExpSpecialChars(
        subj.replace(/\\/g, '\\\\')
      ),
      'g'
    ),
    replacements[subj]
  ),
  content
);

module.exports = replaceSpritePlaceholder;
