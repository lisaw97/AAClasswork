
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  const dogNames = Object.keys(dogs);
  let completed = [];
  dogNames.forEach(dog => {
    let a = document.createElement('a');
    a.innerHTML = dog;
    a.href = dogs[dog];
    let li = document.createElement('li');
    li.className = 'dog-link hidden';
    li.appendChild(a);
    completed.push(li);
  });
  return completed;
}

function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  const dogList = document.querySelector('.drop-down-dog-list');
  dogLinks.forEach(link => {
    dogList.appendChild(link);
  });
}

attachDogLinks();

function handleEnter() {
  const dogNav = document.querySelector('.drop-down-dog-nav');
  let dogLink = Array.from(document.querySelectorAll('.dog-link'));
  
  dogNav.addEventListener('mouseenter', e => {
    dogLink.forEach(link => {
      link.className = 'visible';
         });
    
  });
}

function handleLeave() {
  const dogNav = document.querySelector('.drop-down-dog-nav');
  let dogLink = Array.from(document.querySelectorAll('.visible'));

  dogNav.addEventListener('mouseleave', e => {
    dogLink.forEach(link => {
      link.className = 'hidden';
    });

  });
}


handleEnter();
// handleLeave();