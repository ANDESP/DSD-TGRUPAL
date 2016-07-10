//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OrdenesWS
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrdenTrabajo
    {
        public OrdenTrabajo()
        {
            this.Movimiento = new HashSet<Movimiento>();
            this.OrdenTrabajoDetalle = new HashSet<OrdenTrabajoDetalle>();
        }
    
        public int Id { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public Nullable<System.DateTime> FechaRegistro { get; set; }
        public Nullable<System.DateTime> FechaModificacion { get; set; }
        public Nullable<bool> Activo { get; set; }
        public Nullable<int> IdEstado { get; set; }
    
        public virtual ICollection<Movimiento> Movimiento { get; set; }
        public virtual ICollection<OrdenTrabajoDetalle> OrdenTrabajoDetalle { get; set; }
        public virtual ParametroDetalle ParametroDetalle { get; set; }
    }
}