﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WS_ProduccionTest.ServiceArticulo {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Articulo", Namespace="http://schemas.datacontract.org/2004/07/WS_Produccion")]
    [System.SerializableAttribute()]
    public partial class Articulo : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Nullable<bool> ActivoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DescripcionField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Nullable<int> IdFormulaProduccionField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Nullable<decimal> StockActualField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string TipoExistenciaField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<bool> Activo {
            get {
                return this.ActivoField;
            }
            set {
                if ((this.ActivoField.Equals(value) != true)) {
                    this.ActivoField = value;
                    this.RaisePropertyChanged("Activo");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Descripcion {
            get {
                return this.DescripcionField;
            }
            set {
                if ((object.ReferenceEquals(this.DescripcionField, value) != true)) {
                    this.DescripcionField = value;
                    this.RaisePropertyChanged("Descripcion");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Id {
            get {
                return this.IdField;
            }
            set {
                if ((this.IdField.Equals(value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<int> IdFormulaProduccion {
            get {
                return this.IdFormulaProduccionField;
            }
            set {
                if ((this.IdFormulaProduccionField.Equals(value) != true)) {
                    this.IdFormulaProduccionField = value;
                    this.RaisePropertyChanged("IdFormulaProduccion");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<decimal> StockActual {
            get {
                return this.StockActualField;
            }
            set {
                if ((this.StockActualField.Equals(value) != true)) {
                    this.StockActualField = value;
                    this.RaisePropertyChanged("StockActual");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string TipoExistencia {
            get {
                return this.TipoExistenciaField;
            }
            set {
                if ((object.ReferenceEquals(this.TipoExistenciaField, value) != true)) {
                    this.TipoExistenciaField = value;
                    this.RaisePropertyChanged("TipoExistencia");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="SinStockExceptions", Namespace="http://schemas.datacontract.org/2004/07/WS_Produccion.Excepciones")]
    [System.SerializableAttribute()]
    public partial class SinStockExceptions : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string codigoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string descripcionField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string codigo {
            get {
                return this.codigoField;
            }
            set {
                if ((object.ReferenceEquals(this.codigoField, value) != true)) {
                    this.codigoField = value;
                    this.RaisePropertyChanged("codigo");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string descripcion {
            get {
                return this.descripcionField;
            }
            set {
                if ((object.ReferenceEquals(this.descripcionField, value) != true)) {
                    this.descripcionField = value;
                    this.RaisePropertyChanged("descripcion");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceArticulo.IArticulos")]
    public interface IArticulos {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IArticulos/Modificar", ReplyAction="http://tempuri.org/IArticulos/ModificarResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(WS_ProduccionTest.ServiceArticulo.SinStockExceptions), Action="http://tempuri.org/IArticulos/ModificarSinStockExceptionsFault", Name="SinStockExceptions", Namespace="http://schemas.datacontract.org/2004/07/WS_Produccion.Excepciones")]
        WS_ProduccionTest.ServiceArticulo.Articulo Modificar(WS_ProduccionTest.ServiceArticulo.Articulo ArticuloAModificar);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IArticulos/Modificar", ReplyAction="http://tempuri.org/IArticulos/ModificarResponse")]
        System.Threading.Tasks.Task<WS_ProduccionTest.ServiceArticulo.Articulo> ModificarAsync(WS_ProduccionTest.ServiceArticulo.Articulo ArticuloAModificar);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IArticulos/Obtener", ReplyAction="http://tempuri.org/IArticulos/ObtenerResponse")]
        WS_ProduccionTest.ServiceArticulo.Articulo Obtener(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IArticulos/Obtener", ReplyAction="http://tempuri.org/IArticulos/ObtenerResponse")]
        System.Threading.Tasks.Task<WS_ProduccionTest.ServiceArticulo.Articulo> ObtenerAsync(int id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IArticulosChannel : WS_ProduccionTest.ServiceArticulo.IArticulos, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ArticulosClient : System.ServiceModel.ClientBase<WS_ProduccionTest.ServiceArticulo.IArticulos>, WS_ProduccionTest.ServiceArticulo.IArticulos {
        
        public ArticulosClient() {
        }
        
        public ArticulosClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ArticulosClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ArticulosClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ArticulosClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public WS_ProduccionTest.ServiceArticulo.Articulo Modificar(WS_ProduccionTest.ServiceArticulo.Articulo ArticuloAModificar) {
            return base.Channel.Modificar(ArticuloAModificar);
        }
        
        public System.Threading.Tasks.Task<WS_ProduccionTest.ServiceArticulo.Articulo> ModificarAsync(WS_ProduccionTest.ServiceArticulo.Articulo ArticuloAModificar) {
            return base.Channel.ModificarAsync(ArticuloAModificar);
        }
        
        public WS_ProduccionTest.ServiceArticulo.Articulo Obtener(int id) {
            return base.Channel.Obtener(id);
        }
        
        public System.Threading.Tasks.Task<WS_ProduccionTest.ServiceArticulo.Articulo> ObtenerAsync(int id) {
            return base.Channel.ObtenerAsync(id);
        }
    }
}
