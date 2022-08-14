fetch("http://localhost:3004/products").then(Welcome=>{
    return Welcome.json();
}).then(thanks=> { 
    console.log(thanks);
    thanks.forEach(repas => {
        let global= document.getElementById("global");
        global.innerHTML+=`
        
        <div class="menu">
        <img src=${repas.img} alt height="200" width="200">
        <p class="menu_name"> ${repas.title}</p>
        <br>
        <div class="ajoutprix">
            <p class="prix"> ${repas.price}</p>
            <button id="add_cart_button"> Add to cart </button>
        </div>
    </div>
        `
    });
})
