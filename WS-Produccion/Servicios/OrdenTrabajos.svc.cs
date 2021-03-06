﻿using System;
using System.Collections.Generic;
using System.ServiceModel;
using WS_Produccion.Excepciones;
using WS_Produccion.Persistencia;

namespace WS_Produccion.Servicios
{
    public class OrdenTrabajos : IOrdenTrabajos, IOrdenTrabajoDetalle
    {
        private OrdenesDao ordDAO = new OrdenesDao();

        public OrdenTrabajo crearOrd(OrdenTrabajo ordCrear)
        {
            if (ordCrear.Fecha > DateTime.Now || ordCrear.FechaModificacion > DateTime.Now || ordCrear.FechaRegistro >DateTime.Now)
            {
                throw new FaultException<validacionFecha>(new validacionFecha()
                {
                    codigo = "1000",
                    descripcion = "La fecha debe ser menor a la fecha de hoy."
                },
                new FaultReason("Fecha es mayor a la Fecha de Hoy"));
            }
            return ordDAO.Crear(ordCrear);
        }

        public void eliminarOrd(int id)
        {
            ordDAO.Eliminar(id);
        }

        public List<OrdenTrabajo> listarOrd()
        {
            return ordDAO.Listar();
        }

        public OrdenTrabajo modificarOrd(OrdenTrabajo ordModificar)
        {
            if (ordModificar.Fecha > DateTime.Now || ordModificar.FechaModificacion > DateTime.Now || ordModificar.FechaRegistro > DateTime.Now)
            {
                throw new FaultException<validacionFecha>(new validacionFecha()
                {
                    codigo = "1000",
                    descripcion = "La fecha debe ser menor a la fecha de hoy."
                },
                new FaultReason("Fecha es mayor a la Fecha de Hoy"));
            }
            return ordDAO.Modificar(ordModificar);
        }

        public OrdenTrabajo obtenerOrd(int id)
        {
            return ordDAO.Obtener(id);
        }

        //-----------------------------------Detalle------------------
        private ordenesDetalleDAO ordDetDAO = new ordenesDetalleDAO();

        public List<OrdenTrabajoDetalle> listarOrdDet()
        {
            return ordDetDAO.Listar();
        }

        public OrdenTrabajoDetalle crearOrdDet(OrdenTrabajoDetalle ordDetCrear)
        {
            return ordDetDAO.Crear(ordDetCrear);
        }

        public OrdenTrabajoDetalle obtenerOrdDet(int id)
        {
            return ordDetDAO.Obtener(id);
        }

        public OrdenTrabajoDetalle modificarOrdDet(OrdenTrabajoDetalle ordDetModificar)
        {
            return ordDetDAO.Modificar(ordDetModificar);
        }

        public void eliminarOrdDet(int id)
        {
            ordDetDAO.Eliminar(id);
        }
    }

}
