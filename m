Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10F606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mbCd9pw4;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ElU+LS7w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eZ7TpthuV8NxvWtjX1I6039/M5HrbxLJ6NZYHgglK1k=; b=mbCd9pw4ZNoUp8
	DqjHV8sFBcFsgU17VQW/xcTkFG/Jia8/DLyfGHr1/ihYsFvt97Az7A1pDFIN2nKSvjBbjUDE5SjVv
	gl5kREMttwkDf3Z5ZWWb4DAYb17XOaRemca6fPbgfNk7INsDcy953PQhKQwGn8FRy3cq9BaIuQuo5
	5+DVgamgpmsJlU1A1wCFBT1l8O6T8lC/WjkuuXUf2hnV5oPIXBu7BPgZERex5BdUe2l1GD1U2ai9D
	ZyMf688EYWxR+9T9UATiqpPnIqzadXKv1tFUu7BFr0PBUbg8I+fQpPhdmJr4oh88u1KqkI+3lNfaw
	MLjENOqGY0hkA4uUHo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTztA-0000000Bddj-2WNQ;
	Thu, 19 Nov 2026 11:01:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzsy-0000000BdVx-3Odt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:01:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 575054E41665;
	Thu, 19 Nov 2026 11:00:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2193A60237;
	Thu, 19 Nov 2026 11:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C118D11BC1135;
	Thu, 19 Nov 2026 12:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086052; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eZ7TpthuV8NxvWtjX1I6039/M5HrbxLJ6NZYHgglK1k=;
	b=ElU+LS7wNRfwzwd/Hx49B9FhgLaingBKi8axxvY4vqwusO+ia7JYN0B9E3a2zfZRdGefBP
	iyhF7zPwrUA1wUNt43OV1CQ0uqRaDkEMxyKMkjFRrM+jZERwH7cpywY+hl6coR/vGDjiOO
	VhrRoNp7h2nutwgZ6LL6aimmGlZWG5iHBkFcJxU5IlTkM2fRec9CWRG9FFQZwk+cIxc2+l
	tSv6foicVyUmJ9Gy/yL7mqYyUwG2xS2Wlmv8aITocgB8cnoQnzYzKeI6VueLMS//D1TuTh
	9tCaxxxqQC6A+nONztG/M1np+wc9HEgvMScjxf5p9yI+5KhearZJ1xih237WNQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	stable+noautosel@kernel.org
Subject: [PATCH v10 5/5] bus: simple-pm-bus: Populate child nodes at probe
Date: Thu, 19 Nov 2026 12:00:11 +0100
Message-ID: <20261119110014.582363-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_030101_139816_E45CD71C 
X-CRM114-Status: GOOD (  25.97  )
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

The simple-pm-bus driver handles several simple busses. When it is used
with busses other than a compatible "simple-pm-bus", it doesn't populate
its child devices during its probe.

This confuses fw_devlink and results in wrong or missing devlinks.

Once a driver is bound to a device and the probe() has been called,
device_links_driver_bound() is called.

This function performs operation based on the following assumption:
    If a child firmware node of the bound device is not added as a
    device, it will never be added.

Among operations done on fw_devlinks of those "never be added" devices,
device_links_driver_bound() changes their supplier.

With devices attached to a simple-bus compatible device, this change
leads to wrong devlinks where supplier of devices points to the device
parent (i.e. simple-bus compatible device) instead of the device itself
(i.e. simple-bus child).

When the device attached to the simple-bus is removed, because devlinks
are not correct, its consumers are not removed first.

In order to have correct devlinks created, make the simple-pm-bus driver
compliant with the devlink assumption and create its child devices
during its probe.

Fixes: 628b8ca3e915 ("bus: simple-pm-bus: Remove child devices when the bus is unbound")
Cc: <stable+noautosel@kernel.org> # Need more devices described in LAN966x PCI dtso
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 23ac18551fd9..6afc992a750f 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -26,6 +26,12 @@ static void simple_pm_bus_depopulate(void *data)
 {
 	struct device *dev = data;
 
+	if (!pm_runtime_enabled(dev)) {
+		/* No PM runtime, we can directly depopulate */
+		of_platform_depopulate(dev);
+		return;
+	}
+
 	/*
 	 * Bus stays on for children
 	 * This ensure that the bus will not be put in idle asynchronously when
@@ -46,7 +52,7 @@ static void simple_pm_bus_depopulate(void *data)
 	pm_runtime_put_sync(dev);
 }
 
-static int simple_pm_bus_populate(struct device *dev,
+static int simple_pm_bus_populate(struct device *dev, bool default_populate,
 				  const struct of_dev_auxdata *lookup)
 {
 	struct device_node *np = dev->of_node;
@@ -55,7 +61,9 @@ static int simple_pm_bus_populate(struct device *dev,
 	if (!np)
 		return 0;
 
-	ret = of_platform_populate(np, NULL, lookup, dev);
+	ret = default_populate ?
+		of_platform_default_populate(np, lookup, dev) :
+		of_platform_populate(np, NULL, lookup, dev);
 	if (ret)
 		return ret;
 
@@ -83,16 +91,23 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	match = of_match_device(dev->driver->of_match_table, dev);
 	/*
 	 * These are transparent bus devices (not simple-pm-bus matches) that
-	 * have their child nodes populated automatically.  So, don't need to
-	 * do anything more. We only match with the device if this driver is
-	 * the most specific match because we don't want to incorrectly bind to
-	 * a device that has a more specific driver.
+	 * need to have their child nodes populated. So, don't need to do
+	 * anything more except populate child nodes during this probe(). We
+	 * only match with the device if this driver is the most specific match
+	 * because we don't want to incorrectly bind to a device that has a more
+	 * specific driver.
 	 */
 	if (match && match->data) {
-		if (of_property_match_string(np, "compatible", match->compatible) == 0)
-			return 0;
-		else
+		if (of_property_match_string(np, "compatible", match->compatible))
 			return -ENODEV;
+
+		dev_dbg(&pdev->dev, "%s: populate only\n", __func__);
+
+		ret = simple_pm_bus_populate(&pdev->dev, true, lookup);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret, "failed to populate\n");
+
+		return 0;
 	}
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
@@ -111,7 +126,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
-	ret = simple_pm_bus_populate(&pdev->dev, lookup);
+	ret = simple_pm_bus_populate(&pdev->dev, false, lookup);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to populate\n");
 
-- 
2.56.0


