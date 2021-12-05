*** Settings ***
Library                     AppiumLibrary       20

*** Variables ***
&{USER1-DETAILS}            Username=Matti      Password=2611MAMA 
&{USER2-DETAILS}            Username=Marjo      Password=Marjo2       

${LOGIN-USER-FIELD}         //android.widget.EditText[contains(@text, "Username")]
${LOGIN-PASSWORD-FIELD}     //android.widget.EditText[contains(@text, "Password")]
${FILLED-USER-FIELD}        //android.widget.EditText[contains(@text, "Marjo")]
${FILLED-PASSWORD-FIELD}    //android.widget.EditText[contains(@text, "••••••")]
${LOGIN-SUBMIT-BUTTON}      //android.widget.Button[@index=4]
${OK-BUTTON}                //android.widget.Button[@index=0]

*** Test Cases *** 
Test
    Open Application    http://localhost:4723/wd/hub    platformName=Android   deviceName=emulator-5554 appPackage=host.exp.exponent   appActivity=host.exp.exponent.LauncherActivity automationName=Uiautomator2
    Wait Until Page Contains Element                                ${LOGIN-SUBMIT-BUTTON}  
    Input Text                          ${LOGIN-USER-FIELD}         ${USER2-DETAILS}[Username]        
    Input Text                          ${LOGIN-PASSWORD-FIELD}     ${USER2-DETAILS}[Password]
    Click Element                                                   ${LOGIN-SUBMIT-BUTTON}
    Wait Until Page Contains Element                                ${OK-BUTTON}
    Click Element                                                   ${OK-BUTTON}
    Clear Text                          ${FILLED-USER-FIELD}         
    Clear Text                          ${FILLED-PASSWORD-FIELD}     

    Input Text                          ${LOGIN-USER-FIELD}         ${USER1-DETAILS}[Username]        
    Input Text                          ${LOGIN-PASSWORD-FIELD}     ${USER1-DETAILS}[Password]
    Click Element                                                   ${LOGIN-SUBMIT-BUTTON}  