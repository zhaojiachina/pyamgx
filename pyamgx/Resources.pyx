cdef class Resources:
    """
    Resources: Class for creating and freeing AMGX Resources objects.
    """
    cdef AMGX_resources_handle rsrc
    cdef public AMGX_RC _err

    def create_simple(self, Config cfg):
        """
        rsc.create_simple(cfg)

        Create the underlying AMGX Resources object in a
        single-threaded application.

        Parameters
        ----------
        cfg : Config

        Returns
        -------
        self : Resources
        """
        self._err = AMGX_resources_create_simple(&self.rsrc, cfg.cfg)
        return self

    def destroy(self):
        """
        rsc.destroy()

        Destroy the underlying AMGX Resources object.
        """
        self._err = AMGX_resources_destroy(self.rsrc)
