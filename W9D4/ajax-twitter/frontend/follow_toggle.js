const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);

    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on('click', e => {
      // e.preventDefault();
      this.handleClick();
      
    });
  }

  render(){
    if(this.followState === 'following' || this.followState === 'unfollowing'){
      this.$el.prop('disabled', true);
    } else {
      this.$el.prop('disabled', false);
    }
    
    if (this.followState === false){
      this.$el.text('Follow!');
    } else {
      this.$el.text('Unfollow!');
    }
  }

  handleClick(){
    if (this.followState === false) {
      APIUtil.followUser(this.userId)
      .then(res => {
        this.followState = true;
        this.render();
      });
      this.followState = 'following';
      this.render();
      
    } else {
      APIUtil.unfollowUser(this.userId)
      .then(res => {
        this.followState = false;
        this.render();
      });
      this.followState = 'unfollowing';
      this.render();
    } 
  }

}

module.exports = FollowToggle;