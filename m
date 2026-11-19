Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF4F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yvc9sKML;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vH62IJSf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sfUMDLC0E22rep4FDmPzBeyywhsxbumM+Fv7jNI+gdQ=; b=yvc9sKMLaJ9sgg
	8nsfDvXKoLpp0MF1oeiWGpyveFvl/B3ADa4XIuLDb2XvHGPxgKONcwBVR/187hQGPxAUlLbEp+T9i
	NV+atOJCRtF6JhrWg5IF47HDnTSPU8sZB+3UlLNjZD/3XpmyDQWN6Awv8CEIVWNyWqpK1VqmJD0kI
	QgJAoQ0sUEfK4bL7ZnSc41o6d6W0t1vC6Hh9h5MP2xDtMaYnQH46II1+SW5BMStF4kc15+7WbK8vF
	0mkzcfcdEVrGj6aCEkzs35w9Sx0TjvXI+zFqbCqo/AyF4snHuc6M2RHz3XOkKqF1pZHevtpkgKMfS
	9/VXHrvDFXpgK46othYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Ta-0000000BiX3-1alm;
	Thu, 19 Nov 2026 11:38:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0TR-0000000BiSH-2nDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:38:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B59374E41665;
	Thu, 19 Nov 2026 11:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A23260237;
	Thu, 19 Nov 2026 11:38:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B62511BC1049;
	Thu, 19 Nov 2026 12:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795088318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sfUMDLC0E22rep4FDmPzBeyywhsxbumM+Fv7jNI+gdQ=;
	b=vH62IJSfk2XQNAcZcOawsmDUuKG1V6DF1t78czfPI/wXjtAyyxmZ5g0DsFDmpPai74l5FX
	xwPr1af83Q2hl7omU7WEDzYUp/lcehTfdJ8QfEZWjVbGfJxDgZtjvw83uPVIPmt6YPg2Gt
	c8paOuDl5DewOPhtXLTwSJIvD6WKli62bvgXTrVWLpRzuqnuhN8PvHqo8CMgVzhEt16Qaq
	nKIFrH9nlKTEYyadNR4jw6uVMve1UM9XrODKurMtoh7l9e9xcpVtP+Rw8qvx1Q+qB3dAY0
	goEfv6piXKEx7Hl3V7uXl7B863e4urBnLgUS0BLYNR8TIVK/We89KMDDKgFtZA==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v11 4/5] ARM: OMAP2+: pdata-quirks: Pass auxdata for simple-bus devices
Date: Thu, 19 Nov 2026 12:37:55 +0100
Message-ID: <20261119113758.603074-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119113758.603074-1-herve.codina@bootlin.com>
References: <20261119113758.603074-1-herve.codina@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_033841_880452_A6CD8FCA 
X-CRM114-Status: GOOD (  14.68  )
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

The simple-pm-bus driver takes the of_dev_auxdata lookup table from the
platform data of the bus device, following the convention introduced for
"simple-pm-bus" by commit eda080eabf5b ("drivers: bus: simple-pm-bus:
Fix compatibility with simple-bus for auxdata").

omap_auxdata_lookup only has an entry for the "simple-pm-bus"
compatible, so a simple-bus node created by of_platform_populate() with
this lookup table has no platform data, and the lookup table is not
available to the driver for that bus.

As a prerequisite for introducing platform device population for
bus-only devices in the simple-pm-bus driver, the lookup table must also
be available on simple-bus devices. When the driver populates the
children of such a bus from its probe(), it takes the lookup table from
the platform data of the bus device; otherwise those children are created
without the bus_id and platform_data overrides.

Add the corresponding "simple-bus" entry, mapping it to the same table
as the "simple-pm-bus" one.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index b947bacf23a3..f591a94d9c73 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -491,6 +491,7 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 #endif
 	/* Common auxdata */
 	OF_DEV_AUXDATA("simple-pm-bus", 0, NULL, omap_auxdata_lookup),
+	OF_DEV_AUXDATA("simple-bus", 0, NULL, omap_auxdata_lookup),
 	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
 	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
 	OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),
-- 
2.56.0


