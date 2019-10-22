
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const children = Array.from(document.querySelectorAll('p'));
  if (children.length > 0){
    children.forEach(child => {
      child.parentNode.removeChild(child);
    });
  }

  let p = document.createElement('p');
  p.innerHTML = string;
  htmlElement.appendChild(p);
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I <3 Vanilla DOM manipulation.', partyHeader);