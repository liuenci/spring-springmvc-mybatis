function getCity(callback){
    $("<div>").attr("id", "win-city").window({
        width: 400,
        height: 320,
        closed: true,
        href: 'city_list',
        title: '城市选择器',
        onClose: function(){
            $(this).window("destroy");
        },
        onLoad: function(){
            $("#citys div").click(function(){
                var n = $(this).html();
                callback({n: n});
                $("#win-city").window("close");
            });
        }
    });
    $("#win-city").window("open");


}