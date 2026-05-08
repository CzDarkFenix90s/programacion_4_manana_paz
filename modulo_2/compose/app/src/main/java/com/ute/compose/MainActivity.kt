
// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.material3.*
import com.ute.compose.ui.screens.*



class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada sección:
                //componente basicos nativos
                // S01_SaludoScreen()
                // S02_TextScreen()
                // S03ButtonScreen()
                 //S04LayoutScreen()
                // S05ModifierScreen()
                // S06EstadoScreen()
                // S07StateHoistingScreen()
                 // S08BienvenidaScreen()
                //CompraTiendaScreen()
                //Paso02CardScreen()
                //Paso03LazyColumnScreen()
                //Paso04ScaffoldScreen()
                Paso05NavBarScreen()

            }
        }
    }
}