import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const tabs = [
  {title: "uno", content: "Tabby Cat"},
  {title: "dos", content: "Mona Lisa Cat"},
  {title: "tres", content: "Boozi Cat"}
];

function Root() {
  return(
    <div>
      <Clock />
      <Tabs tabs={tabs}/>
    </div>
  )
}

export default Root;