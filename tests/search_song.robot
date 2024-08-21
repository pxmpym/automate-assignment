*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../resources/keywords.resource
Documentation    ตัวอย่างการเข้าหน้าเว็บ Youtube เพื่อค้นหาเพลง  Baby Shark   

*** Test Case ***
Open Youtube For Search Song
    Open Youtube
    Search And Play All Songs
    Close Browser
   

 

