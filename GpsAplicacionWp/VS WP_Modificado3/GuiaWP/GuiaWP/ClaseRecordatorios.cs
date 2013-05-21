using Microsoft.Phone.Scheduler;
using System;
using System.Windows;

namespace GuiaWP
{
    class ClaseRecordatorios
    {
        public void AddRecordatorio(DateTime fecha, string titulo, string mensaje)
        {
            if (fecha < DateTime.Now)
                MessageBox.Show("La fecha seleccionada \n NO puede ser anterior a la fecha actual.");
            else if (string.IsNullOrEmpty(mensaje))
                MessageBox.Show("por favor escribir el contenido de su tarea");
            else
            {
                if (ScheduledActionService.Find(titulo) != null)
                    ScheduledActionService.Remove(titulo);
                Reminder reminder = new Reminder(titulo)
                {
                    Title = titulo,
                    Content = mensaje,
                    BeginTime = fecha,
                    RecurrenceType = RecurrenceInterval.Daily,
                    ExpirationTime = DateTime.Now.AddDays(2),
                    NavigationUri = new Uri("Recordatorio.xaml", UriKind.Relative)
                };

                ScheduledActionService.Add(reminder);
                MessageBox.Show("Recordatorio Guardado");
            }
        }
    }
}
