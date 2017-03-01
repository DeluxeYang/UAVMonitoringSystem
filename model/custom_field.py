

from django.utils.timezone import utc
from django.contrib import auth
from django.contrib.auth import get_user_model
User = get_user_model()

from rest_framework import serializers
from rest_framework.fields import *  # NOQA # isort:skip
from rest_framework.relations import *  # NOQA # isort:skip
import urllib.request







class last_job_latestHyperlink(serializers.HyperlinkedIdentityField):
    # We define these as class attributes, so we don't need to pass them as arguments.
    view_name = 'last_job_latest'
    
    def to_representation(self, value):
        request = self.context.get('request', None)
        format = self.context.get('format', None)

        assert request is not None, (
            "`%s` requires the request in the serializer"
            " context. Add `context={'request': request}` when instantiating "
            "the serializer." % self.__class__.__name__
        )

        if format and self.format and self.format != format:
            format = self.format

        # Return the hyperlink, or error if incorrectly configured.
        try:
            url = self.get_url(value, self.view_name, request, format)
            response = urllib.request.urlopen(url)
            content = response.read().decode('utf-8')
            json = eval(content)
        except NoReverseMatch:
            msg = (
                'Could not resolve URL for hyperlinked relationship using '
                'view name "%s". You may have failed to include the related '
                'model in your API, or incorrectly configured the '
                '`lookup_field` attribute on this field.'
            )
            if value in ('', None):
                value_string = {'': 'the empty string', None: 'None'}[value]
                msg += (
                    " WARNING: The value of the field on the model instance "
                    "was %s, which may be why it didn't match any "
                    "entries in your URL conf." % value_string
                )
            raise ImproperlyConfigured(msg % self.view_name)

        if url is None:
            return None
        return json