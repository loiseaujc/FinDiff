import numpy as np
import matplotlib.pyplot as plt

kappa = np.linspace(0, np.pi, 1024)

# Standard 2nd order accurate finite difference.
kappa_std_5pts_4order = np.load("central_findiff_5pts_4order.npy")

# Standard 6th order accurate finite difference.
kappa_std_7pts_6order = np.load("central_findiff_7pts_6order.npy")

# Original Tam & Webb DRP scheme.
kappa_tam_webb_7pts_4order = np.load("tam_webb_7pts_4order.npy")

# Optimal DRP scheme.
kappa_drp_7pts_4order = np.load("optimal_drp_7pts_4order.npy")

# --------------------------
# -----     FIGURE     -----
# --------------------------

fig, ax = plt.subplots(1, 1, figsize=(9, 3))

ax.plot(kappa, kappa, color="black", lw=2)
ax.plot(
    kappa, kappa_std_5pts_4order, color="gray", lw=1, label="Standard 5pts/4th order"
)
ax.plot(
    kappa,
    kappa_std_7pts_6order,
    color="gray",
    lw=1,
    ls="--",
    label="Standard 7pts/6th order",
)

ax.plot(
    kappa,
    kappa_tam_webb_7pts_4order,
    color="red",
    lw=1,
    label="Tam & Webb (1993)",
)

ax.plot(
    kappa,
    kappa_drp_7pts_4order,
    color="dodgerblue",
    lw=2,
    ls="--",
    label="Optimal DRP 7pts/4th order",
)

ax.set(
    xlim=(0, np.pi),
    xlabel="Wavenumber",
    xticks=[0, np.pi / 4, np.pi / 2, 3 * np.pi / 4, np.pi],
    xticklabels=[
        r"$0$",
        r"$\dfrac{\pi}{4}$",
        r"$\dfrac{\pi}{2}$",
        r"$\dfrac{3\pi}{4}$",
        r"$\pi$",
    ],
)
ax.set(
    ylim=(0, np.pi),
    ylabel="Effective wavenumber",
    yticks=[0, np.pi / 4, np.pi / 2, 3 * np.pi / 4, np.pi],
    yticklabels=[
        r"$0$",
        r"$\dfrac{\pi}{4}$",
        r"$\dfrac{\pi}{2}$",
        r"$\dfrac{3\pi}{4}$",
        r"$\pi$",
    ],
)
ax.legend(loc=0)
plt.show()
