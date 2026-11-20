Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53605606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YtlGGqIK;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CIwpj3XN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZyG1HJB9CouJ88jrHvgbdE74CmzL9EWfbpLK4lLbZB8=; b=YtlGGqIKHMft8H
	6qxNOo5Dz1WjuxabiDfedTp9E4cwEqcbfoAxv7IWlicRWPu7AaZcXf5kkUY/44Ykbl9BBMSSyCwUK
	cc4GFqh9+vCjabKT5jQNEGGeuJ3hdUPFNzI0d/BzcAm4XIJYpmqB5eEjb1m8syHz7nxLPV9Au96nL
	2WcBcNVxjQJMJtSzsa46volAhcNd17nc+6BWf0tyzeaDpt5Ied1Z+EIGG4JzKT1fOd4ZNh42Ebm+8
	n1MuAtpRnuBghGS0HZlVYl6olS2SyYxZ8I7UNNTztrvUD+55K/IKNcmWr9jm3/Cnb477P47NzOQ+i
	OzcFZ7kB4XDc3eb7lqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOBj-0000000F1un-1SDX;
	Fri, 20 Nov 2026 12:57:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOBd-0000000F1sX-0Qnt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:57:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C2934E4168A;
	Fri, 20 Nov 2026 12:57:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7388A601B9;
	Fri, 20 Nov 2026 12:57:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54E9211BC01AF;
	Fri, 20 Nov 2026 13:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179470; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZyG1HJB9CouJ88jrHvgbdE74CmzL9EWfbpLK4lLbZB8=;
	b=CIwpj3XNGPVEq7IVMCfxfiYb0wfXVtbYAk7LTFhg1uGiNPczfzmjyDddimswPr9U/wH4ss
	Fs5+f/3LdbyXLDkfXHRw6gmUoLa4neaHD2mwVcKgxIYERAvILbd6o8PI+wWc84Ghjax9Y0
	Le2FGDnbNK+riJ1rvzW7nhgBpRCfz1JYV1Bb0FdVqlgI9rLy9FT2XNrvxUM31iQ66aPYyl
	ZimLXdN708HBxTTuuyY+KIlHXDekR7R2xUX2wVdxfMto0C5rmh8Y8aEBAjZMoREU7XHadz
	f6eNDNc+MPs0ablm2dQmMffOI8MkCdQweByyM+IZC0/BX++R9fdEWRb7d0BOgQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 2/2] ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources
Date: Fri, 20 Nov 2026 13:57:22 +0100
Message-ID: <20261120125722.209609-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045753_434031_3BCCF981 
X-CRM114-Status: GOOD (  22.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ACPI 6.5 introduced a clock input resource descriptor, which allows to
specify in the ACPI tables what clocks are connected to a given device.

This patch adds support for the most basic clock resource, which is the
one that represents a fixed clock. The new code will then create a
clk_hw for each fixed clock resource, which is then made available to
the device drivers, that can obtain it through a regular call to
clk_get(NULL).

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v4: Change clock names to "acpi-clkX", because ACPI devices names can be
    up to 17 characters long, and our clock name must be 16 characters
    max.

v3: No change

v2:
- Use the calculated clock name in devm_clk_hw_register_fixed_rate()
  instead of the device name
- Make sure clkres->scale is <= 2. The field is 2 bits but the value
  clkres->scale == 3 is not defined in the spec.
- Compute the fraction numerator using 64-bit math, to make sure it
  won't overflow on 32-bit systems.
- Initialize clocks only when the device_type matches
  ACPI_BUS_TYPE_DEVICE.
- Use a shorter name for clocks as the hard limit is 16 characters
  including the terminator.
---
 drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index 80ea7121744d..4e8824cc042d 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -10,17 +10,27 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/ioport.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 #include "internal.h"
 
+struct acpi_clk_data {
+	struct device *dev;
+	unsigned int idx;
+};
+
 /* Exclude devices that have no _CRS resources provided */
 #define ACPI_ALLOW_WO_RESOURCES		BIT(0)
 
@@ -130,6 +140,57 @@ static unsigned int acpi_platform_resource_count(struct acpi_resource *ares, voi
 	return AE_CTRL_TERMINATE;
 }
 
+static int acpi_add_fixed_clock(struct acpi_resource *res, void *d)
+{
+	static const unsigned long clk_scale[] = { 1, HZ_PER_KHZ, HZ_PER_MHZ };
+	struct acpi_resource_clock_input *clkres;
+	struct acpi_clk_data *data = d;
+	struct device *dev = data->dev;
+	struct clk_hw *clk;
+	unsigned long rate;
+	char name[64];
+	int err;
+
+	if (res->type == ACPI_RESOURCE_TYPE_CLOCK_INPUT) {
+		clkres = &res->data.clock_input;
+
+		if (clkres->mode) {
+			dev_warn(dev, "Only fixed rate clocks supported for now.\n");
+			return 1; /* keep going */
+		}
+
+		if (clkres->frequency_divisor == 0 || clkres->scale > 2)
+			return -EINVAL;
+
+		rate = DIV_ROUND_UP_ULL((u64)clkres->frequency_numerator * clk_scale[clkres->scale],
+					clkres->frequency_divisor);
+
+		snprintf(name, sizeof(name), "acpi-clk%u", data->idx++);
+
+		clk = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		err = devm_clk_hw_register_clkdev(dev, clk, name, dev_name(dev));
+		if (err)
+			return err;
+	}
+
+	return 1;
+}
+
+static void acpi_platform_init_clocks(struct acpi_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct acpi_clk_data data = { .dev = dev };
+	LIST_HEAD(list);
+	int ret;
+
+	ret = acpi_dev_get_resources(adev, &list, acpi_add_fixed_clock, &data);
+	if (ret < 0)
+		dev_err(dev, "Failed to add clock resources: %d\n", ret);
+}
+
 /**
  * acpi_create_platform_device - Create platform device for ACPI device node
  * @adev: ACPI device node to create a platform device for.
@@ -196,6 +257,9 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 			}
 			acpi_dev_free_resource_list(&resource_list);
 		}
+
+		if (IS_ENABLED(CONFIG_COMMON_CLK))
+			acpi_platform_init_clocks(adev);
 	}
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-- 
2.47.3


