using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Microsoft.Phone.Scheduler;

namespace GuiaWP
{
    public partial class ctrRecordatorios : UserControl
    {
        public ctrRecordatorios()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click_1(object sender, RoutedEventArgs e)
        {
            ClaseRecordatorios record = new ClaseRecordatorios();
            DateTime fecha = dpFecha.Value.HasValue ? dpFecha.Value.Value : DateTime.Now;
            TimeSpan hora = dpHora.Value.HasValue ? dpHora.Value.Value.TimeOfDay : DateTime.Now.TimeOfDay;
            string mensaje = txtMensaje.Text;
            fecha = fecha.Date + hora;
            record.AddRecordatorio(fecha, txtTitulo.Text, mensaje);
        }

        private void btnRecordatorios_Click_1(object sender, RoutedEventArgs e)
        {
            ((Application.Current.RootVisual) as PhoneApplicationFrame).Navigate(new Uri("/Recordatorios.xaml", UriKind.Relative));
        }

        private void btnRecordatorios_Click_2(object sender, RoutedEventArgs e)
        {

        }
    }
}
