object matrix { 
    var energia = 100

    method saltar() {
    energia = energia / 2
    }

    method vitalidad() = energia/10

    method elegido() = true
}

object morfeo {
    var vitalidad = 8
    var descansado = true

    method saltar() {
        descansado = not descansado
        vitalidad = (vitalidad - 1).max(0)
    }

    method vitalidad() = vitalidad

    method elegido() = false
    
}

object trinity {


    method saltar() {
        
    }

    method vitalidad() = 0

    method elegido() = false
}

object nave {
    const pasajeros = [morfeo]

    method subirPasajero(pasajero) {
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero) {
        pasajeros.remove(pasajero)
    }

    method cantidadPasajeros() = pasajeros.size()
    method pasajeroMasVital() = pasajeros.max({p => p.vitalidad()})
    method pasajeroMenosVital() = pasajeros.min({p => p.vitalidad()})
    method vitalidadEquilibrada() = self.pasajeroMenosVital().vitalidad() * 2 > self.pasajeroMasVital().vitalidad()
    method hayElegido() = pasajeros.any({p => p.elegido()})

    method naveChoca() { 
        pasajeros.forEach({p => p.saltar()}) 
        pasajeros.clear()
    }

    method naveAcelera() {
    pasajeros.filter({ p => !p.elegido() }).forEach({ p => p.saltar() })
    }
}   
