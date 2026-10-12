package com.realestate.servlet;

import java.nio.file.Files;
import java.nio.file.Path;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import static org.junit.Assert.*;

public class ImageServletTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void findsCertificateInTheDeployedUploadDirectory() throws Exception {
        Path legacy = temporary.newFolder("legacy").toPath();
        Path deployed = temporary.newFolder("deployed").toPath();
        Path certificate = deployed.resolve("broker.pdf");
        Files.write(certificate, new byte[]{1, 2, 3});
        assertEquals(certificate.toFile(), ImageServlet.findUpload("broker.pdf", legacy.toFile(), deployed.toFile()));
    }

    @Test public void cannotDownloadFilesOutsideAnUploadDirectory() throws Exception {
        Path uploads = temporary.newFolder("uploads").toPath();
        Files.write(uploads.getParent().resolve("secret.txt"), new byte[]{1});
        assertNull(ImageServlet.findUpload("../secret.txt", uploads.toFile()));
    }
}
