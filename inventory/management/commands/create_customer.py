from django.core.management.base import BaseCommand
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = 'Creates a new customer user account'

    def add_arguments(self, parser):
        parser.add_argument('username', type=str, help='Username for the customer')
        parser.add_argument('password', type=str, help='Password for the customer')

    def handle(self, *args, **kwargs):
        username = kwargs['username']
        password = kwargs['password']

        if User.objects.filter(username=username).exists():
            self.stdout.write(self.style.ERROR(f'User {username} already exists'))
            return

        user = User.objects.create_user(
            username=username,
            password=password,
            is_staff=False,
            is_superuser=False
        )

        self.stdout.write(self.style.SUCCESS(f'Successfully created customer account for {username}')) 