var app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function ($scope, $http, $window){
    // Quan ly gio hang
    $scope.cart = {
        items: [],
        //Them san pham vao gio hang
        add(id){
            alert("Them vao gio hang thanh cong")
            var item = this.items.find(a => a.productId == id);
            if(item){
                item.qty++;
                this.saveToLocalStorage();
            }else {
                $http.get(`/rest/products/${id}`).then(resp => {
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();
                })
            }
        },
        //Xoa san pham khoi gio hang
        remove(id){
            var index = this.items.findIndex(item => item.productId == id);
            this.items.splice(index,1);
            this.saveToLocalStorage();
        },
        //Xoa sach cac mat hang trong gio
        clear(){
            this.items = [];
            this.saveToLocalStorage();
        },
        //Tinh thanh tien cua 1 san pham
        amt_of(item){},
        //Tinh tong so luong mat hang trong gio
        get count(){
            return this.items.map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        //Tong thanh tien cac mat hang trong gio
        get amount(){
            return this.items.map(item => item.qty * item.unitPrice)
                .reduce((total, qty) => total += qty, 0);
        },
        //Luu gio hang vao localStorage
        saveToLocalStorage(){
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        //Doc gio hang tu localStorage
        loadFromLocalStorage(){
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) :[];
        }
    }

    $scope.cart.loadFromLocalStorage();

    $scope.order = {
        orderDate: new Date(),
        address: "",
        account: {username: $("#username").text()} ,
        get orderDetails(){
          return $scope.cart.items.map(item => {
              return{
                  product: {productId: item.productId},
                  unitPrice: item.unitPrice,
                  quantity: item.qty

              }
          });
        },
        purchase(){
            var order = angular.copy(this);
            //Thuc hien dat hang
            $http.post("/rest/orders", order).then(resp => {
                alert("Dat hang thanh cong");
                $scope.cart.clear();
                $window.location.href = "/order/detail/"+resp.data.orderId;
            }).cath(error => {
                alert("Dat hang loi");
                console.log(error)
            })
        }
    }
})