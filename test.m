
TrqCmd =50:160;


Etorque = 78* (1-((TrqCmd/160).^2));

plot(TrqCmd, Etorque)