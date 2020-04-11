function createIframe2()
{
    var placeholder2 = document.getElementById('controlAddIn'); 
    var webPage2 = document.createElement('iframe'); 
    
    webPage2.id = 'webPage2'; 
    webPage2.height = '100%';
    webPage2.width = '100%'; 

    placeholder2.appendChild(webPage2); 
}

createIframe2();


