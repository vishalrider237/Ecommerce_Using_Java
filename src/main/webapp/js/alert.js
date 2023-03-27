function add_to_cart(pid,pname,pPrice){
    let cart=localStorage.getItem("cart");
    if (cart===null){
        // No Cart Present
        let products=[]
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:pPrice}
        products.push(product)
        localStorage.setItem("cart",JSON.stringify(products))
     //   console.log("product is added for the first time")
        showToast("Item is added to Cart")
    }
    else{
        // Cart Already Present
        let pCart=JSON.parse(cart)
        let oldProduct= pCart.find((item)=>item.productId===pid)

        if (oldProduct){
            // Only We have to increase Quantity
           oldProduct.productQuantity =oldProduct.productQuantity+1
            pCart.map((item)=>{
                if (item.productId===oldProduct.productId){}
                    item.productQuantity=oldProduct.productQuantity
            })
            localStorage.setItem("cart",JSON.stringify(pCart))
         //   console.log("product quantity is increased")
            showToast("Product Quantity is increased by "+oldProduct.productQuantity)
        }

        else{
            // We have to add Product
            let product={productId:pid,productName:pname,productQuantity:1,productPrice:pPrice}
            pCart.push(product)
            localStorage.setItem("cart",JSON.stringify(pCart))
         //   console.log("product is added")
            showToast("Product is added")
        }
    }
    updateCart()
}
// Update Cart
function updateCart(){
    let cartString=localStorage.getItem("cart")
     let cart= JSON.parse(cartString)
    if (cart===null || cart.length===0){
        console.log("Cart is Empty!!")
        $(".cart-items").html("( 0 )")
        $(".cart-body").html("<h3>Cart does not have any items</h3>")
        $(".checkout-btn").attr("disabled",true)
    //    $(".checkout-btn").addClass("disabled")
    }
    else{
        // There is Something in cart to show
        console.log(cart)
        $(".cart-items").html(`( ${cart.length} )`)
        let table=`
        <table class='table'>
        <thead class="thead-light">
           <tr>
           <th>Item Name</th>
           <th>Price</th>
           <th>Quantity</th>
           <th>Total Price</th>
           <th>Action</th>
        </tr>
        </thead>
         `
        let total_price=0
        cart.map((item)=>{
            table+=`
            <tr>
            <td>${item.productName}</td>
             <td>${item.productPrice}</td>
              <td>${item.productQuantity}</td>
               <td>${item.productQuantity * item.productPrice}</td>
               <td><button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm">Remove</button></td>
</tr>
            `
            total_price+=item.productPrice*item.productQuantity
        })

        table=table+`
        <tr>
        <td colspan="5" class="text-right font-weight-bold m-5">
        Total Price: ${total_price}</td>
        </tr>
</table>`
        $(".cart-body").html(table)
        $(".checkout-btn").attr("disabled",false)
    }
}
// delete Cart Item
function deleteItemFromCart(pid){
   let cart= JSON.parse(localStorage.getItem("cart"));
   let newCart=cart.filter((item)=>item.productId!==pid)
    localStorage.setItem("cart",JSON.stringify(newCart))
   updateCart()
    showToast("Item is removed from cart")
}


$(document).ready(function (){
    updateCart()
})

function showToast(content){
    $("#toast").addClass("display")
    $("#toast").html(content)
    setTimeout(()=>{
        $("#toast").removeClass("display")
    },2000)
}
function goToCheckout(){
    window.location="checkout.jsp"
}