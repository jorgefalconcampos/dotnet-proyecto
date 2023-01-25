using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace Models

{
    public class Usuario
    {
        [Key]
        public int idUsuario { get; set; }
        public String usuario { get; set; }
        public String password { get; set; }
        public String nombre { get; set; }
        public int edad { get; set; }
        public String correo { get; set; }
        public int estatura { get; set; }
        public double peso { get; set; }
        public String genero { get; set; }
        public String complexion { get; set; }
        public int diasActividad { get; set; }
        public String meta { get; set; }
        public double imc { get; set; }

    
    public Usuario()
    {

    }
    }

}
    

