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
    
    public partial class Movimiento
    {
        public Movimiento()
        {
            this.MovimientoDetalle = new HashSet<MovimientoDetalle>();
        }
    
        public int Id { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public Nullable<System.DateTime> FechaRegistro { get; set; }
        public Nullable<System.DateTime> FechaModificacion { get; set; }
        public string TipoMovimiento { get; set; }
        public Nullable<int> IdAlmacen { get; set; }
        public Nullable<int> IdOrdenTrabajo { get; set; }
    
        public virtual ParametroDetalle ParametroDetalle { get; set; }
        public virtual ICollection<MovimientoDetalle> MovimientoDetalle { get; set; }
        public virtual OrdenTrabajo OrdenTrabajo { get; set; }
    }
}
