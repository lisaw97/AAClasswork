const FollowToggle = require('./follow_toggle.js');

$(() => {
  let $buttons = $('.follow-toggle');
  $buttons.each((index, el) => {
    new FollowToggle(el);
  });
});

