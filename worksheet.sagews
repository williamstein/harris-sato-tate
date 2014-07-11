︠7b4bc4e3-e388-4783-bf41-a1990e390476︠
def dist(v, b, left=float(0), right=float(pi)):
    """
    We divide the interval between left (default: 0) and
    right (default: pi) up into b bins.

    For each number in v (which must left and right),
    we find which bin it lies in and add this to a counter.
    This function then returns the bins and the number of
    elements of v that lie in each one.

    ALGORITHM: To find the index of the bin that a given
    number x lies in, we multiply x by b/length and take the
    floor.
    """
    length = right - left
    normalize = float(b/length)
    vals = {}
    d = dict([(i,0) for i in range(b)])
    for x in v:
        n = int(normalize*(float(x)-left))
        d[n] += 1
    return d, len(v)
︡6e892eb5-104f-4557-9689-6a0ce30fda6e︡
︠698d8701-016c-4b89-bf31-84baf73cb68e︠
def graph(d, b, num=5000, left=float(0), right=float(pi)):
    s = Graphics()
    left = float(left); right = float(right)
    length = right - left
    w = length/b
    k = 0
    for i, n in d.iteritems():
        k += n
        # ith bin has n objects in it.
        s += polygon([(w*i+left,0), (w*(i+1)+left,0),
                     (w*(i+1)+left, n/(num*w)), (w*i+left, n/(num*w))],
                     rgbcolor=(0,0,0.5))
    return s
︡f86e6c28-19a6-4af9-a8db-c419d1369135︡
︠989139b0-9288-4883-93c5-1aeb6313aa1f︠
%time
n=10^7
D = delta_qexp(n)
v = [D[p]/(2*float(p)^(5.5)) for p in prime_range(n)]
print "normalized"
︠8f5902b8-b14e-4505-8cfd-ba410859f14c︠
%time
b = 500
d, total_number_of_points = dist(v,b,-1,1)
print "distributed"
g = graph(d, b, total_number_of_points, -1, 1)
print "saving..."
g.show()
print ""

︡1b12ea48-5d8c-4088-ac2e-88a8bd7eac38︡{"stdout":"distributed\n"}︡{"stdout":"saving...\n"}︡{"once":false,"file":{"show":true,"uuid":"5dac3953-5662-4605-b777-6bd954acdd75","filename":"/projects/c6b42aa2-a189-445d-8bb7-880848c5b633/.sage/temp/compute1dc1/26814/tmp_nWe015.svg"}}︡{"stdout":"\n"}︡
︠3eeea0a1-b41e-49e6-b0d9-25ff37a42758︠
g.show(fontsize=18)
︡7dcdc485-fbbe-4ec8-807c-8c431b1bbbc5︡{"once":false,"file":{"show":true,"uuid":"3bae5ec6-4df6-4270-9867-5f5f4ff4de10","filename":"/projects/c6b42aa2-a189-445d-8bb7-880848c5b633/.sage/temp/compute1dc1/26814/tmp_TiRnds.svg"}}︡
︠4318b8f4-4fc3-4453-be49-607186787393︠
# First we compute the normalization so
# that the resulting function has integral 1.

f = maxima('-sin(acos(x))^2/sqrt(1-x^2)')
PI = float(pi)

# It turns out to be 4/3
def f(x):
    if abs(x) == 1 or x < -1:
        return 0
    return (2/PI) * sqrt(1-x^2)
    #return (2/PI)*math.sin(math.acos(x))^2/(sqrt(1-x^2))

def sin2acos():
    PI = float(pi)
    return plot(f, -1.01,1, plot_points=200,
              rgbcolor=(1,0,0), thickness=3, alpha=0.6)

︡07ad5d8c-ee49-4f02-be1b-7330a92caba6︡
︠971ae87e-e34a-4a63-9700-4796e3cf8742︠
(g+plot(sin2acos())).save('harris-sato-tate-circle-ten_million.pdf',ymin=0,ymax=.7,figsize=[10,5], fontsize=22)
︡c126bab1-e490-4964-95f1-1227ac6dab3a︡
︠e1626716-7f99-432c-8c3e-2d04f15f9aa1︠









