xscale += xrate;
yscale += yrate;
alpha -= faderate;

if (alpha <= 0)
    instance_destroy();
