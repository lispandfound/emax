(defconfig packages
(use-package package-utils
    :ensure t
    :commands (package-utils-upgrade-all
               package-utils-upgrade-all-no-fetch
               package-utils-upgrade-by-name
               package-utils-upgrade-by-name-no-fetch
               package-utils-remove-by-name
               package-utils-list-upgrades
               package-utils-list-packages-async
               package-utils-install-async)
    :defer t
    :init (nmap
           "Epu" 'package-utils-upgrade-all
           "EpU" 'package-utils-upgrade-all-no-fetch
           "Epn" 'package-utils-upgrade-by-name
           "EpN" 'package-utils-upgrade-by-name-no-fetch
           "Epr" 'package-utils-remove-by-name
           "Epl" 'package-utils-list-package-async
           "EpL" 'package-utils-list-upgrades
           "Epi" 'package-utils-install-async))
(use-package try
  :ensure t
  :defer t
  :commands (try)
  :init (nmap "Ept" 'try)))
