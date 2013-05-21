using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;
using System.Device.Location;
using System.Device;
using Microsoft.Phone.Scheduler;
//msdn.com/library
//Class GeoCoordinateWatcher
namespace GuiaWP
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        //codigo nuevo:
        GeoCoordinateWatcher watch;
        String txtPrecision = string.Empty;
        Double distancia = 0;
        GeoCoordinate ultimopunto;

        public MainPage()
        {
            InitializeComponent();

            // Establecer el contexto de datos del control ListBox control en los datos de ejemplo
            DataContext = App.ViewModel;
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        // Cargar datos para los elementos ViewModel
        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            if (!App.ViewModel.IsDataLoaded)
            {
                App.ViewModel.LoadData();
            }
        }

        private void BTN_LOW_Click_1(object sender, RoutedEventArgs e)
        {
            txtPrecision = "Precision normal";

        }
        private void StartLocationService(GeoPositionAccuracy precision)
        {
            txtEstado.Text = "Iniciando, " + txtPrecision;
            watch = new GeoCoordinateWatcher(precision);
            this.watch.MovementThreshold = 10;
            this.watch.PositionChanged += watcher_PositionChanged;
            this.watch.Start();
        }
         void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
         {
             if (!e.Position.Location.IsUnknown)
             {
                 this.txtlatitud.Text = e.Position.Location.Latitude.ToString();
                 this.txtlongitud.Text = e.Position.Location.Longitude.ToString();
                 if (this.ultimopunto != null)
                 {
                     this.distancia += e.Position.Location.GetDistanceTo(this.ultimopunto);
                 
                 }
                 this.txtdist.Text = this.FormDouble(this.distancia / 1000, "0,0") + "KM" ;
                 this.ultimopunto = e.Position.Location;
                 recordar();
             }
         
         }
         private string FormDouble(double value, string format)
         {
             if (double.IsNaN(value))
             {
                 return "---";
             
             }
             return value.ToString(format);
         
         }

        private void BTN_STOP_Click_1(object sender, RoutedEventArgs e)
        {
            if (watch != null)
                watch.Stop();
            txtEstado.Text = "Servicio de localización apagado";
            distancia = 0;
            txtlatitud.Text = string.Empty;
            txtlatitud.Text = string.Empty;
            txtdist.Text = string.Empty;
        }

        private void BTN_HIGHT_Click_1(object sender, RoutedEventArgs e)
        {
            txtPrecision = "Precision Alta";
            StartLocationService(GeoPositionAccuracy.High);

        }

        private void btnRecordar_Click_1(object sender, RoutedEventArgs e)
        {
            ClaseRecordatorios record = new ClaseRecordatorios();
            string longitud = string.Format("{0:n3}", Double.Parse(txtlongitud.Text));
            string latitud = string.Format("{0:n3}", Double.Parse(txtlatitud.Text));

            string mensaje = string.Format("{0} / {1}", longitud, latitud);
            record.AddRecordatorio(DateTime.Now, mensaje, mensaje);
        }

            private void recordar()
            {
                string longitud = string.Format("{0:n3}", double.Parse(txtlongitud.Text));
                string latitud = string.Format("{0:n3}", double.Parse(txtlatitud.Text));
                string revisar = string.Format("{0} / {1}", longitud, latitud);
                IEnumerable<Reminder> recordatorios = ScheduledActionService.GetActions<Reminder>();
                foreach(Reminder item in recordatorios)
                {
                    if(revisar == item.Content)
                        MessageBox.Show(string.Format("Estas cerca de un sitio para recordar {0}", item.Content));

                }
            }
    }
}