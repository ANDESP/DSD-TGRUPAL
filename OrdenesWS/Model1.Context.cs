﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DBProduccionEntities1 : DbContext
    {
        public DBProduccionEntities1()
            : base("name=DBProduccionEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Articulo> Articulo { get; set; }
        public virtual DbSet<ArticuloFormulaProduccion> ArticuloFormulaProduccion { get; set; }
        public virtual DbSet<Movimiento> Movimiento { get; set; }
        public virtual DbSet<MovimientoDetalle> MovimientoDetalle { get; set; }
        public virtual DbSet<OrdenTrabajo> OrdenTrabajo { get; set; }
        public virtual DbSet<OrdenTrabajoDetalle> OrdenTrabajoDetalle { get; set; }
        public virtual DbSet<Parametro> Parametro { get; set; }
        public virtual DbSet<ParametroDetalle> ParametroDetalle { get; set; }
    }
}
