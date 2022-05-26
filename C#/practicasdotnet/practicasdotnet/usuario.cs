using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace practicasdotnet
{

    public class usuario
    {
        
        public int usuaCODI;
        public string usuaNom;
        public int usuaActivo;

        public usuario() { } //Constructor vacio por temas de seguridad

        public usuario(int usuaCODI, string usuaNom, int usuaActivo) {
            this.usuaCODI = usuaCODI;
            this.usuaNom = usuaNom;
            this.usuaActivo = usuaActivo;
        }

        public int getUsuario() {
            return 0;
        }
    }
}