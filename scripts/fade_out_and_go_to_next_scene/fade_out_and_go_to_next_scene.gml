fade_instance = instance_create_layer(0,0,"Instances", obj_fade_out)
with (fade_instance)
{
	depth = -9999;
	event_user(0);
}