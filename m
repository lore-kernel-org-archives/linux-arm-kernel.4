Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F4iThvEM;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZI0ZBnr7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=; b=F4iThvEMImGP75
	DD2kArO/1GZKUGY7P+EwyHiaZdV58jED1z7lE2rmG/bjmam4s4yH6+XOkyiTz+vhuKHFtQg0ar/wD
	OaoVP7O61mATiWbZ7cf53tmuaQSSeLZfEduyzjzsXhDf/skp0gqmCXKsV2aC2s7yfk8fLy1/EpLgt
	voAu2GjTgZOEU68qeW3hZVU2t1Xx9h8VZhlWzC14+6OW4hCc7MIj1no0WOiEOwwJX51CXtMmUTrRY
	S2IDwSFQQVZD/uAPLdF2WwDPxIYp8DVlBpv5ASZmqJLywS4cBmsN8gV85hGS/uc7r61x1wAyyeql3
	PM8BInDMoWqfpDP8ciWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzsj-0000000BdO0-43mg;
	Thu, 19 Nov 2026 11:00:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzsb-0000000BdKE-3n6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:00:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43D94C4CBF1;
	Thu, 19 Nov 2026 11:00:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01DC060237;
	Thu, 19 Nov 2026 11:00:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D5A11BC0ED5;
	Thu, 19 Nov 2026 12:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086033; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=;
	b=ZI0ZBnr74DvtuFdI0t1iSYuANqwPuZZs8/7yPwybnvmZkD+2bqra+NXMQeYNgl/pEwPTn4
	NbWRHXsDu012v6UoGT2GlL3j5wuiDR2Mbr6MD7spoZubyuUSs5oy7pQkvER1Ic7gZXfdiQ
	ZV0Eyi4nmrogKX00d6wcEHS5JRc7IRcDvAwblO1U2y4oegMJfYIOxqdzLoSD8vjbdrCFQe
	kpyDhDHN5ZikR3adV2fP31LgjPgPXGpZr2C8ZmTcYXyNhg2b7vxIzVI0i2I0GLREvcg848
	hmBborznpZx1Ya6jbbZxIq+SVvcqw5wHnjeFwr8T98ArmSCCzuNwMXn+wNt01A==
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
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v10 1/5] bus: simple-pm-bus: Avoid inconsistencies between probe() and remove()
Date: Thu, 19 Nov 2026 12:00:07 +0100
Message-ID: <20261119110014.582363-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_030038_085095_DE9E0910 
X-CRM114-Status: GOOD (  16.56  )
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

At probe(), operations done depends on device_has_driver_override().

At remove() a call to device_has_driver_override() is also present to
identify operations that need to be done in order to revert operations
previously done at probe().

Nothing prevents device_has_driver_override() to return a different
value when called at probe() and when called at remove(). Indeed, a user
can set driver_override (or clear it) after the probe() call and before
the remove() call.

In that case, inconsistencies are present between pm_runtime_enable()
called at probe() and pm_runtime_disable() called at remove().

In order to ensure that pm_runtime_disable() is called only if
pm_runtime_enable() has been called at probe(), use the devres version
of pm_runtime_enable().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260630105701.7D0471F00A3A@smtp.kernel.org/
Fixes: 98e96cf80045 ("drivers: bus: simple-pm-bus: Add support for probing simple bus only devices")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index c920bd6fbaaf..4322a778e801 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -29,6 +29,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 	struct simple_pm_bus *bus;
+	int ret;
 
 	/*
 	 * Allow user to use driver_override to bind this driver to a
@@ -66,7 +67,9 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
@@ -76,14 +79,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static void simple_pm_bus_remove(struct platform_device *pdev)
 {
-	const void *data = of_device_get_match_data(&pdev->dev);
-
-	if (device_has_driver_override(&pdev->dev) || data)
-		return;
-
 	dev_dbg(&pdev->dev, "%s\n", __func__);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.56.0


