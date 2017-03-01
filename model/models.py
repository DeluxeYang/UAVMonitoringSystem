from django.db import models
import json
from django.contrib.auth.models import  (BaseUserManager, AbstractBaseUser)


class Nation(models.Model):
    code = models.CharField(max_length=40,null=True, blank=True)
    province = models.CharField(max_length=40,null=True, blank=True)
    city = models.CharField(max_length=40,null=True, blank=True)
    district = models.CharField(max_length=40,null=True, blank=True)
    parent = models.CharField(max_length=40,null=True, blank=True)
    lng = models.FloatField(default=0)
    lat = models.FloatField(default=0)
    geohash = models.CharField(max_length=40,null=True, blank=True)

class MyUserManager(BaseUserManager):
    def create_user(self, username, email, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not username:
            raise ValueError('Users must have an username')

        user = self.model(
            username=username,
            email=email,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, password):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(username,
            password=password,
            email=email
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser):
    username = models.CharField(max_length=255,unique=True,)
    email = models.EmailField(verbose_name='email',max_length=255,)
    headshot = models.ImageField(upload_to='user/headshot/')
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    nation = models.CharField(max_length=40,null=True, blank=True)
    address = models.CharField(max_length=100,null=True, blank=True)
    phone = models.CharField(max_length=30,null=True, blank=True)
    describe = models.CharField(max_length=300,null=True, blank=True)
    level = models.IntegerField(default=0)

    objects = MyUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email']

    def get_full_name(self):
        # The user is identified by their email address
        return self.username

    def get_short_name(self):
        # The user is identified by their email address
        return self.username

    def __str__(self):              # __unicode__ on Python 2
        return self.username

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

class Job_type(models.Model):
    type = models.CharField(max_length=50)

    def __str__(self):              # __unicode__ on Python 2
        return self.type

class Farm_type(models.Model):
    type = models.CharField(max_length=50)

    def __str__(self):              # __unicode__ on Python 2
        return self.type 

class Job(models.Model):
    number = models.CharField(max_length=50,unique=True)
    user = models.ForeignKey(MyUser,related_name='job')
    describe = models.CharField(max_length=150,null=True, blank=True)
    shape_file_shp = models.FileField(upload_to='job/border',null=True, blank=True)
    shape_file_dbf = models.FileField(upload_to='job/border',null=True, blank=True)
    shape_file_shx = models.FileField(upload_to='job/border',null=True, blank=True)
    border_describe = models.CharField(max_length=150,null=True, blank=True)
    status = models.IntegerField(default=0)
    person_in_charge = models.CharField(max_length=30,null=True, blank=True)
    start_time = models.DateTimeField(null=True, blank=True)
    end_time = models.DateTimeField(null=True, blank=True)
    uav_need = models.IntegerField(default=0)
    uav_selected = models.IntegerField(default=0)
    each_pay = models.IntegerField(default=0)
    nation = models.CharField(max_length=40,null=True, blank=True)
    address = models.CharField(max_length=100,null=True, blank=True)
    job_type = models.ForeignKey(Job_type,related_name='job')
    farm_type = models.ForeignKey(Farm_type,related_name='job')
    section_num = models.IntegerField(default=1)

    def __str__(self):              # __unicode__ on Python 2
        return self.number

class UAV_Model(models.Model):
    uav_model = models.CharField(max_length=30,unique=True)
    name = models.CharField(max_length=30,null=True, blank=True)
    function_type = models.CharField(max_length=30,null=True, blank=True)
    serial_number = models.CharField(max_length=50,null=True, blank=True)
    company = models.CharField(max_length=30,null=True, blank=True)
    origin_place = models.CharField(max_length=50,null=True, blank=True)
    design_date = models.DateField(null=True, blank=True)
    weight = models.IntegerField(default=0)
    load_weight = models.IntegerField(default=0)
    diagonal_distance = models.FloatField(null=True, blank=True)
    propeller_num = models.IntegerField(default=0)
    max_rise = models.FloatField(null=True, blank=True)
    max_decline = models.FloatField(null=True, blank=True)
    max_speed = models.FloatField(null=True, blank=True)
    max_height = models.FloatField(null=True, blank=True)
    max_angle = models.FloatField(null=True, blank=True)
    precision_v = models.FloatField(null=True, blank=True)
    precision_h = models.FloatField(null=True, blank=True)
    GPS_mode = models.CharField(max_length=30,null=True, blank=True)
    signal_mode = models.CharField(max_length=30,null=True, blank=True)
    other = models.CharField(max_length=100,null=True, blank=True)

    def __str__(self):
        return self.name

class UAV(models.Model):
    user = models.ForeignKey(MyUser,related_name='uav')
    uav_model = models.ForeignKey(UAV_Model,related_name='uav')
    job = models.ManyToManyField(Job,through = "UAV_Job_Detail",related_name='uav')
    uav_id_code = models.CharField(max_length=50,unique=True)
    uav_sim = models.CharField(max_length=50,null=True, blank=True)
    controller_sim = models.CharField(max_length=50,null=True, blank=True)
    nation = models.CharField(max_length=40,null=True, blank=True)
    address = models.CharField(max_length=100,null=True, blank=True)
    purchase_time = models.DateTimeField(null=True, blank=True)
    mile_age = models.FloatField(null=True, blank=True)
    is_active = models.BooleanField(default=False)
    is_flying = models.BooleanField(default=False)
    last_job = models.CharField(max_length=50,null=True, blank=True)#job_number
    time = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.uav_id_code

class UAV_Job_Detail(models.Model):
    job = models.ForeignKey(Job,related_name='uav_job_detail')
    uav = models.ForeignKey(UAV,related_name='uav_job_detail')
    confirm = models.BooleanField(default=False)
    LLHT = models.FileField(upload_to='job/LLHT',null=True, blank=True)

class UAV_Job_Desc(models.Model):
    detail = models.ForeignKey(UAV_Job_Detail,related_name='uav_job_desc')
    time = models.DateTimeField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    lng = models.FloatField(default=0)
    lat = models.FloatField(default=0)
    height = models.FloatField(null=True, blank=True)
    AGL = models.FloatField(null=True, blank=True)
    compass = models.FloatField(null=True, blank=True)

class UAV_Job_Desc_THR(models.Model):
    desc = models.OneToOneField(UAV_Job_Desc)
    DataFlag = models.CharField(max_length=20,null=True, blank=True)
    NumAct = models.IntegerField(default=0)
    Limit_THR = models.CharField(max_length=20,null=True, blank=True)
    Time = models.IntegerField(default=0)
    VNorth = models.FloatField(null=True, blank=True)
    VEast  = models.FloatField(null=True, blank=True)
    VDown  = models.FloatField(null=True, blank=True)
    GPSFix = models.CharField(max_length=20,null=True, blank=True)
    Flag = models.CharField(max_length=20,null=True, blank=True)
    pDOP = models.CharField(max_length=20,null=True, blank=True)
    numSV = models.IntegerField(default=0)
    GPSWeek = models.IntegerField(default=0)
    GPSTow = models.DateTimeField(null=True, blank=True)

    ROLL = models.FloatField(null=True, blank=True)
    PITCH = models.FloatField(null=True, blank=True)
    YAW = models.FloatField(null=True, blank=True)
    ALT = models.FloatField(null=True, blank=True)
    TAS = models.FloatField(null=True, blank=True)

    WSouth = models.FloatField(null=True, blank=True)
    WWest = models.FloatField(null=True, blank=True)
    LRPM = models.FloatField(null=True, blank=True)
    RRPM = models.FloatField(null=True, blank=True)
    DensR = models.FloatField(null=True, blank=True)
    OAT = models.FloatField(null=True, blank=True)
    Xaccel = models.FloatField(null=True, blank=True)
    Yaccel = models.FloatField(null=True, blank=True)
    Zaccel = models.FloatField(null=True, blank=True)
    RollRate = models.FloatField(null=True, blank=True)
    PitchRate = models.FloatField(null=True, blank=True)
    YawRate = models.FloatField(null=True, blank=True)
    StaticP = models.FloatField(null=True, blank=True)
    DynP = models.FloatField(null=True, blank=True)
    XMagField = models.FloatField(null=True, blank=True)
    YMagField = models.FloatField(null=True, blank=True)
    ZMagField = models.FloatField(null=True, blank=True)
    FuelFlow = models.FloatField(null=True, blank=True)
    Fuel = models.FloatField(null=True, blank=True)

class UAV_SS(models.Model):
    uav = models.ForeignKey(UAV,related_name='uav_ss')
    time = models.DateTimeField(null=True, blank=True)
    job_number = models.CharField(max_length=50,null=True, blank=True)#job_number
    MainPowerV = models.FloatField(null=True, blank=True)
    MainPowerA = models.FloatField(null=True, blank=True)
    ServoPowerV = models.FloatField(null=True, blank=True)
    ServoPowerA = models.FloatField(null=True, blank=True)
    InternalV = models.CharField(max_length=20,null=True, blank=True)
    BoardT = models.FloatField(null=True, blank=True)
    RSSI = models.FloatField(null=True, blank=True)
    VSWR = models.FloatField(null=True, blank=True)
    DataSource = models.CharField(max_length=20,null=True, blank=True)
    NavHealth = models.CharField(max_length=20,null=True, blank=True)
    HorizStdDev = models.FloatField(null=True, blank=True)
    VertStdDev = models.FloatField(null=True, blank=True)
    RollBias = models.FloatField(null=True, blank=True)
    PitchBias = models.FloatField(null=True, blank=True)
    YawBias = models.FloatField(null=True, blank=True)
    XAccBias = models.FloatField(null=True, blank=True)
    YAccBias = models.FloatField(null=True, blank=True)
    ZAccBias = models.FloatField(null=True, blank=True)
    XMagBias = models.FloatField(null=True, blank=True)
    YMagBias = models.FloatField(null=True, blank=True)
    ZMagBias = models.FloatField(null=True, blank=True)
    GlobalStatus = models.CharField(max_length=20,null=True, blank=True)
    Failure = models.CharField(max_length=20,null=True, blank=True)
    Actions = models.CharField(max_length=20,null=True, blank=True)
    Tracker = models.CharField(max_length=20,null=True, blank=True)
    TrackerStatus = models.CharField(max_length=20,null=True, blank=True)
    OrbitRadius = models.FloatField(null=True, blank=True)
    NumLoops = models.FloatField(null=True, blank=True)
    LoopStatus = models.CharField(max_length=20,null=True, blank=True)

class Job_Border(models.Model):
    job = models.ForeignKey(Job,related_name='job_border')
    section = models.IntegerField(default=1)
    lng = models.FloatField(null=True, blank=True)
    lat = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)

class UAV_Desc_Recover(models.Model):
    uav = models.ForeignKey(UAV,related_name='uav_desc_recover')
    time = models.DateTimeField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    lng = models.FloatField(default=0)
    lat = models.FloatField(default=0)
    height = models.FloatField(null=True, blank=True)
    AGL = models.FloatField(null=True, blank=True)
    Compass = models.FloatField(null=True, blank=True)
    
class UAV_Desc_Recover_THR(models.Model):
    desc = models.OneToOneField(UAV_Desc_Recover)
    DataFlag = models.CharField(max_length=20,null=True, blank=True)
    NumAct = models.IntegerField(default=0)
    Limit = models.CharField(max_length=20,null=True, blank=True)
    Time = models.IntegerField(default=0)
    VNorth = models.FloatField(null=True, blank=True)
    VEast  = models.FloatField(null=True, blank=True)
    VDown  = models.FloatField(null=True, blank=True)
    GPSFix = models.CharField(max_length=20,null=True, blank=True)
    Flag = models.CharField(max_length=20,null=True, blank=True)
    pDOP = models.CharField(max_length=20,null=True, blank=True)
    numSV = models.IntegerField(default=0)
    GPSWeek = models.IntegerField(default=0)
    GPSTow = models.DateTimeField(null=True, blank=True)

    ROLL = models.FloatField(null=True, blank=True)
    PITCH = models.FloatField(null=True, blank=True)
    YAW = models.FloatField(null=True, blank=True)
    ALT = models.FloatField(null=True, blank=True)
    TAS = models.FloatField(null=True, blank=True)

    WSouth = models.FloatField(null=True, blank=True)
    WWest = models.FloatField(null=True, blank=True)
    LRPM = models.FloatField(null=True, blank=True)
    RRPM = models.FloatField(null=True, blank=True)
    DensR = models.FloatField(null=True, blank=True)
    OAT = models.FloatField(null=True, blank=True)
    Xaccel = models.FloatField(null=True, blank=True)
    Yaccel = models.FloatField(null=True, blank=True)
    Zaccel = models.FloatField(null=True, blank=True)
    RollRate = models.FloatField(null=True, blank=True)
    PitchRate = models.FloatField(null=True, blank=True)
    YawRate = models.FloatField(null=True, blank=True)
    StaticP = models.FloatField(null=True, blank=True)
    DynP = models.FloatField(null=True, blank=True)
    XMagField = models.FloatField(null=True, blank=True)
    YMagField = models.FloatField(null=True, blank=True)
    ZMagField = models.FloatField(null=True, blank=True)
    FuelFlow = models.FloatField(null=True, blank=True)
    Fuel = models.FloatField(null=True, blank=True)