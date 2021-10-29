$(document).keyup(function (e) {
  if (e.key === 'Escape') {
    CloseShop();
  }
});

function CloseShop() {
  $('body').fadeOut(100);
  $('.items').empty();
  $('.container').fadeOut(100);
  $('.modal').removeClass('visible');
  $.post('https://rsrp-weaponshop/focusOff');
}

document.addEventListener('DOMContentLoaded', function () {
  $('.container').hide();
});

function buyItem(item, zone) {
  
  $.post(
    'https://rsrp-weaponshop/buyItem',
    JSON.stringify({
      item: item,
      zone: zone,
    })
  );
}

function showModal(item, zone, itemLabel, desc) {
  $('.items').click(function () {
    $('.modal').addClass('visible');
    $('.modalimage').html(
      `<img src="./img/` +
        item +
        `.png"><div class="itemName"><p class="modal-label">` +
        itemLabel +
        `</div><p class="modal-desc">` +
        desc +
        `</p>`
    );
    $('.btn-open').html(
      `<button class="btn-1" onclick="buyItem('` +
        item +
        `', '` +
        zone +
        `')"></button>`
    );
  });

  $(document).click((event) => {
    if ($(event.target).closest('.btn-1').length) {
      $('.modal').removeClass('visible');
    }
  });
}

window.addEventListener('message', function (event) {
  var data = event.data;

  if (data.event === 'OPEN') {
    $('.items').empty();

    for (let i = 0; i < data.weapons.length; i++) {
      const weapon = data.weapons[i];

      $('.items').append(
        `
        <div class="item" onclick="showModal('` +
          weapon.item +
          `', '` +
          data.zone +
          `', '` +
          weapon.label +
          `', '` +
          weapon.desc.replace(/'/g, "").replace(/"/g, "") +
          `')">
          <img class="img-item" src="./img/` +
          weapon.item +
          `.png">
            <div class="label">
              <p class="itemString">` +
          weapon.label +
          `</p>
            </div>
        </div>
      `
      );
    }

    $('body').show();
    $('body').fadeIn(100);
    $('.container').show();
  }
});
