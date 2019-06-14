import VMasker from 'vanilla-masker'

const vmaskerCep = () => {
  const ceps = Array.from(document.querySelectorAll(".cep"))

  if (ceps) {
    ceps.map(cep => {
      VMasker(cep).maskPattern('99999-999')
    })
  }
}

const vmaskerCpf = () => {
  const cpfs = Array.from(document.querySelectorAll(".cpf"))

  if (cpfs) {
    cpfs.map(cpf => {
      VMasker(cpf).maskPattern('999.999.999-999')
    })
  }
}

const vmaskerDate = () => {
  const dates = Array.from(document.querySelectorAll(".date"))

  if (dates) {
    dates.map(date => {
      VMasker(date).maskPattern('99/99/9999')
    })
  }
}

const vmaskerPhones = () => {
  const tels = Array.from(document.querySelectorAll(".phone"))

  if (tels) {
    tels.map(tel => {
        // let telMask = ['(99) 9999-99999', '(99) 99999-9999']
        VMasker(tel).maskPattern('(99) 99999-9999')
        // tel.addEventListener('input', inputHandler.bind(undefined, telMask, 14), false)
    })
  }
}
const vmaskerMoney = () => {
  const moneys = Array.from(document.querySelectorAll(".money"))

  if (moneys) {
    moneys.map(money => {
      VMasker(money).maskMoney({
        // Decimal precision -> "90"
        precision: 2,
        // Decimal separator -> ",90"
        separator: ',',
        // Number delimiter -> "12.345.678"
        delimiter: '.',
        // Money unit -> "R$ 12.345.678,90"
        unit: 'R$',
        // Force type only number instead decimal,
        // masking decimals with ",00"
        // Zero cents -> "R$ 1.234.567.890,00"
   
      })
    })
  }
}

$(document).ready(function() {
  vmaskerCep()
  vmaskerMoney()
  vmaskerCpf()
  vmaskerDate()
  vmaskerPhones()
})