from rest_framework import permissions


class IsUserOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow owners of an object to edit it.
    """

    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        if request.method in permissions.SAFE_METHODS:
            return True

        # Write permissions are only allowed to the owner of the snippet.
        return obj.username == request.user.username


class IsOwnerOrReadOnly(permissions.BasePermission):


    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        if request.method in permissions.SAFE_METHODS:
            return True

        # Write permissions are only allowed to the owner of the snippet.
        return obj.user == request.user

class ReadOnlyANDJobOwnerforUDUavOwnerforD(permissions.BasePermission):


    def has_object_permission(self, request, view, obj):
        # Write permissions are only allowed to the owner of the snippet.
        if request.method in permissions.SAFE_METHODS:
            #如果是Read
            return True
        if obj.job.user == request.user:
            #如果不是Read，但是该Detail的job Owner,即接收申请者，则可删可改
            return True
        if request.method == 'DELETE' and obj.uav.user == request.user:
            #如果是Delete，但是该Detail的uav Owner,即申请者，则可删
            return True
        return False
