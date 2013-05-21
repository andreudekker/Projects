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
    public partial class Recordatorios : PhoneApplicationPage
    {
        public Recordatorios()
        {
            InitializeComponent();

            IEnumerable<Reminder> recordatorios = ScheduledActionService.GetActions<Reminder>();

            recordatorios = recordatorios.OrderByDescending(x => x.BeginTime);

            lbRecordatorios.ItemsSource = recordatorios;

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }
    }
}