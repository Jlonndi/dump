/* NUI Stuff */

let interfaceVisible = false;
let access_type = null;

function setInterfaceVisibility(visible) {
  if(interfaceVisible) {
    escapeInterface();
  }

  interfaceVisible = visible

  if(visible) {
    if(access_type == 'atm' || access_type == 'phone') {
      $('.btn-action-deposit').hide();
    } else {
      $('.btn-action-deposit').show();
    }

    if(access_type == 'phone') {
      $('.btn-action-withdraw').hide();
    } else {
      $('.btn-action-withdraw').show();
    }

    $('body').show();
  } else {
    $('body').hide();
  }
}

function escapeInterface() {
  fetch(`https://blrp_banking/escape`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json; charset=UTF-8',},
    body: JSON.stringify({})
  }).then(resp => resp.json()).then(resp => {
    return resp;
  });
}

window.addEventListener('message', event => {
  if(!event.data) return false;

  if(event.data.command === 'interface:setVisible') {
    access_type = event.data.access_type;
    setInterfaceVisibility(event.data.visible);
  }

  if(event.data.command === 'interface:setData') {
    if(event.data.type === 'accounts') {
      resetWindow(event.data.data);
    }

    if(event.data.type === 'transactions') {
      resetTransactions(event.data.data);
    }

    if(event.data.type === 'cash') {
      $('#available-cash').text(formatAmount(event.data.data));
    }
  }

  if(event.data.command == 'interface:transactionError') {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text(event.data.message);
  }
});

document.onkeydown = evt => {
  if(!interfaceVisible) return false;
  evt = evt || window.event;
  if (evt.keyCode === 27) escapeInterface();
}

/* / NUI Stuff */

let accounts = [];
let active_account = null;

function renderTemplate(props) {
  return function(tok, i) {
    return (i % 2) ? props[tok] : tok;
  };
}

function formatAmount(amount) {
  let negative = (amount < 0);

  amount = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(amount);
  amount = amount.replace('.00', '');

  if(negative) {
    amount = '(' + amount + ')';
  }

  return amount;
}

function validateAndSubmitTransaction() {
  $('#transaction-error').text('');
  $('#transaction-submit').prop('disabled', 'disabled');

  let type = $('#transaction-type').val();
  let source = $('#transaction-source-hidden').val();
  let amount = $('#transaction-amount').val();
  let note = $('#transaction-note').val();
  let target_select = $('#transaction-target-select').val();
  let target_text = $('#transaction-target-text').val();

  if(type != 'deposit' && type != 'withdraw' && type != 'transfer') {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid action');
    return;
  }

  if(amount == '' || isNaN(amount)) {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid amount');
    return;
  }

  let valid_source = false
  let valid_amount = false
  let source_type = null;

  $.each(accounts, function(i, account) {
    if(account.number.toString() == source.toString()) {
      valid_source = true;
      source_type = account.source;

      if(type == 'deposit' || account.balance >= amount) {
        valid_amount = true
      }

      return false;
    }
  });

  if(amount < 0) {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid amount');
    return;
  }

  if(!valid_source) {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid source account');
    return;
  }

  if(!valid_amount) {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid amount: insufficient funds');
    return;
  }

  if(type == 'transfer' && target_select == -1 && target_text == '') {
    $('#transaction-submit').prop('disabled', false);
    $('#transaction-error').text('Invalid target account');
    return;
  }

  let target = -1;

  if(type == 'transfer') {
    if(target_select == -1) {
      target = target_text;
    } else {
      target = target_select;
    }
  }

  if(type == 'deposit') {
    target = source;
    source = null;
  }

  let data = {
    account_from_type: source_type,
    transaction_type: type,
    account_from: source,
    account_to: target,
    amount: amount,
    note: note
  };

  fetch(`https://blrp_banking/doTransaction`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json; charset=UTF-8',},
    body: JSON.stringify(data)
  }).then(resp => resp.json()).then(resp => {
    return resp;
  });
}

function getAccountDisplayName(account) {
  let alias = '';

  if(account.alias) {
    alias = '(' + account.alias + ')';
  }

  if(account.type == 'Personal') {
    alias = '(Personal)';
  }

  return account.number.toString() + ' ' + alias;
}

function resetWindow(_accounts) {
  $('#accounts').html('');
  $('#transactions').html('<h6>Select an account to view transaction history</h6>');
  $('#transaction-history-header').html('Transaction History');

  bootstrap.Modal.getOrCreateInstance(document.getElementById('modal-transaction')).hide();

  active_account = null;

  accounts = _accounts

  $.each(accounts, function(i, account) {
    if(account.balance < 0) {
        account['balance-style'] = 'danger';
    } else {
        account['balance-style'] = 'success';
    }

    account.balance_formatted = formatAmount(account.balance);

    account.display_name = getAccountDisplayName(account)

    let template = $('script[data-template="account-item"]').text().split(/\$\{(.+?)\}/g);

    $('#accounts').append(template.map(renderTemplate(account)).join(''));
  });

  if(access_type == 'atm' || access_type == 'phone') {
    $('.btn-action-deposit').hide();
  } else {
    $('.btn-action-deposit').show();
  }

  if(access_type == 'phone') {
    $('.btn-action-withdraw').hide();
  } else {
    $('.btn-action-withdraw').show();
  }
}

function resetTransactions(transactions) {
  if(transactions.length == 0) {
    $('#transactions').html('<h6>No transactions for this account</h6>');
  } else {
    $('#transactions').html('');

    $.each(transactions, function(i, transaction) {
      transaction.amount = formatAmount(transaction.amount);

      let template = $('script[data-template="account-transaction"]').text().split(/\$\{(.+?)\}/g);

      $('#transactions').append(template.map(renderTemplate(transaction)).join(''));
    });
  }
}

$('body').on('click', '#accounts .card', function(e) {
  e.stopPropagation();

  let target = $(e.target);

  if(target.hasClass('btn')) {
    return false;
  }

  let card = $(this);
  let account_number = card.data('account');

  // Don't reload the current account if we don't need to
  if(account_number == active_account) {
    return false;
  }

  active_account = account_number

  $('.card[data-account]').css('border', '1px solid rgba(250,250,250,.125)');
  card.css('border', '1px solid rgba(0, 230, 64, 1)');

  $.each(accounts, function(i, account) {
    if(account.number.toString() == account_number) {
      $('#transaction-history-header').html('Transaction History - ' + account.display_name);
    }
  });

  fetch(`https://blrp_banking/getTransactions`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json; charset=UTF-8',},
    body: JSON.stringify({
      account_number: account_number
    })
  }).then(resp => resp.json()).then(resp => {
    return resp;
  });

  $('#transactions').html('<h6>Loading Transactions...</h6>');
}).on('click', 'button[data-transaction]', function(e) {
  e.preventDefault();

  let button = $(this);
  let transaction = button.data('transaction');
  let transaction_verb = transaction.charAt(0).toUpperCase() + transaction.slice(1);
  let source_account = button.data('account');

  $('#transaction-submit').prop('disabled', false);
  $('#transaction-amount').val('');
  $('#transaction-note').val('');
  $('#transaction-error').text('');
  $('#transaction-type').val(transaction);

  $.each(accounts, function(i, account) {
    if(account.number.toString() == source_account) {
      $('#transaction-source').val(account.display_name);
      $('#transaction-source-hidden').val(source_account);
    }
  });

  if(transaction === 'transfer') {
    $('#transaction-target').show();

    $('#transaction-target-select').find('option').remove().end();
    $('#transaction-target-text').val('');

    $('#transaction-target-select').append($('<option>', {
      value: -1,
      text : 'Select an account'
    }));

    $.each(accounts, function(i, account) {
      if(account.number.toString() == source_account) {
        return;
      }

      $('#transaction-target-select').append($('<option>', {
        value: account.number,
        text : account.display_name
      }));
    });
  } else {
    $('#transaction-target').hide();
  }

  $('#modal-transaction-title').text(transaction_verb + ' Money');
  $('#transaction-submit').text(transaction_verb + ' Money');

  let modal_element = document.getElementById('modal-transaction')
  let modal = new bootstrap.Modal(modal_element)

  modal_element.addEventListener('shown.bs.modal', function (event) {
    $('#transaction-amount').focus();
    $('#transaction-target-select').val(-1);
    $('#transaction-target-select').prop('disabled', false);
    $('#transaction-target-text').val('');
    $('#transaction-target-text').prop('disabled', false);
  });

  modal.show();
});

$('#transaction-target-text').on('input', function() {
  $('#transaction-target-select').val(-1);

  if($(this).val().length > 0) {
    $('#transaction-target-select').prop('disabled', 'disabled');
  } else {
    $('#transaction-target-select').prop('disabled', false);
  }
});

$('#transaction-target-select').on('change', function() {
  $('#transaction-target-text').val('');

  if($(this).val() != -1) {
    $('#transaction-target-text').prop('disabled', 'disabled');
  } else {
    $('#transaction-target-text').prop('disabled', false);
  }
});

$('#transaction-submit').click(function() {
  validateAndSubmitTransaction();
});

$('#transaction-form').keypress(function(e) {
  if(e.which === 13) {
    let disabled = $('#transaction-submit').prop('disabled');

    if(!disabled) {
      validateAndSubmitTransaction();
    }
  }
});

$('#btn-exit').click(function(e) {
  e.preventDefault();

  escapeInterface();
});
