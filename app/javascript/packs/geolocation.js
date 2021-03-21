// CSRFトークンを取得・セット
function set_csrftoken() {
    $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
        if (!options.crossDomain) {
            const token = $('meta[name="csrf-token"]').attr('content');
            if (token) {
                return jqXHR.setRequestHeader('X-CSRF-Token', token);
            }
        }
    });
}

function geolocation () {
    navigator.geolocation.getCurrentPosition(successFunc, errorFunc);
}

// 成功時に緯度と経度を取得
function successFunc(position) {
    // hotpepperApiで値を使用するために、小数点第二位以下を切り捨てる
    let lat = Math.round(position.coords.latitude*100) / 100;
    let lng = Math.round(position.coords.longitude*100) / 100;

    // formで入力されたデータを全て取得し、送信したいデータを選択する
    const formData = $('form').serializeArray();
    let restaurant_range = formData["1"]["value"];


    set_csrftoken();

    // 緯度と経度をpostする
    $.ajax({
        type: "POST",
        url: '/search',
        data: {
            // authenticity_token: auth,
            range: restaurant_range,
            latitude: lat,
            longitude: lng
        }
        // dataType: "JSON",　
        // processData: false,
        // contentType: false
        // async: false
    })
        .done(function(data) {
            console.log("success");
            // alert("success");
        })
        .fail(function(data) {
            console.log(data)
            alert("error");
        })
        .always(function() {
            $(".search_submit-btn").prop("disabled", false);
            $(".search_submit-btn").removeAttr("data-disable-with");
        });
}

// エラー時の処理
function errorFunc(error) {
    let errorMessage = {
        0: "エラーが発生しました",
        1: "位置情報の取得が許可されませんでした",
        2: "位置情報が取得できませんでした",
        3: "タイムアウトしました",
    };
    alert(errorMessage[error.code]);
}

// submitがクリックされた際に発火する
$("#search_input").on("submit", function(e) {
    e.preventDefault();
    geolocation();
});