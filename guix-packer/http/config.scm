(use-modules (gnu))
(use-service-modules networking ssh)
(use-package-modules curl)

(operating-system
  (host-name "guixsd")
  (timezone "Europe/Paris")
  (locale "en_US.utf8")

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/vda")))
  (file-systems (cons (file-system
                        (device (file-system-label "my-root"))
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))

  (sudoers-file
   (plain-file "sudoers"
               (string-append (plain-file-content %sudoers-specification)
                              (format #f "~a ALL = NOPASSWD: ALL~%"
                                      "guix"))))

  (groups (cons (user-group (name "guix")) %base-groups))

  (users (cons (user-account
                (name "guix")
                (group "guix")
                (supplementary-groups '("wheel"))
                (comment "Default virtual machine user")
                (password (crypt "azijiauzjiirhziahrznniYTT" "$6$abc"))
                (home-directory "/home/guix"))
               '()))

  ;; Globally-installed packages.
  (packages (cons curl %base-packages))

  ;; Add services to the baseline: a DHCP client and
  ;; an SSH server.
  (services (append (list (service dhcp-client-service-type)
                          (service openssh-service-type
                                   (openssh-configuration
                                    (port-number 22))))
                    %base-services)))
