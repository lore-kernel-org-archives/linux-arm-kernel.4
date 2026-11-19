Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1F606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=novg/KkR;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WiJTMP4l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xVm1Ce6+fBSIOk0u3Q7iybNIMr5QVFe+QKMMIi0en+w=; b=novg/KkRAzxC8vx1oMcrSqAVRo
	Wo1MspsImyhvnnZjD53kgIjCcOFE7PHiB8vtqI6IFGll+3GSIV5yVmuNEQmyIZbMadIxwTUrGj2NI
	JTunX/mr7jKyr6cEajsIc59XyoCwnleBAgDHnrHEKAI42HcuQdI8i68/ORHEwmUzTrh9R2UKNAXUu
	l5Oq95fGIQGm1H4F9PjMRKDO+6Y3piAcif3lOSuSiAugzMd2/ZQeVw06qMijDq0021IbmrRcylBh4
	NffwTUiVykE4fii2R/yLCqhxMnSKU9BTvPF4qfwV9n1+lulykuftwIJlTcFZWu9kD7c/s3l8iuNlZ
	8eIIUy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0T4-0000000BiL7-2niQ;
	Thu, 19 Nov 2026 11:38:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0T1-0000000BiKe-3dJr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:38:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13F4CC4CBEF;
	Thu, 19 Nov 2026 11:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3D2460237;
	Thu, 19 Nov 2026 11:38:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C6D11BC1049;
	Thu, 19 Nov 2026 12:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795088287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xVm1Ce6+fBSIOk0u3Q7iybNIMr5QVFe+QKMMIi0en+w=;
	b=WiJTMP4lvtAY5cepu4nPJOnIfRD3+YqY3lShoC7++c6DmhX4L35I4tQmQgdlbyEc6bR498
	yx2GlNRdAhlJo+HVCHookO0baA50CymOI69Q+3MgFAr6qpWdbiGPhjJXrtthfXZ2JVwe1S
	4Qz2NeJgT3mgSDeq4LQ28u83vadYixj/wN3o5yc0dYKPEt8MKpv+CARD7QNNipDSN6pDW1
	7Cn91QHtV7sRMjC2PNz3p8oqQomGShFnM+N4Pb8QPibJA1IkfHad/Z2WZoglfLSo0tH+Z2
	sqoO6rJ5J9UL/j6/NpPFAo5kY8SNvfAJBb+sn2GX8rau4bXlOoUhMCXC3L9i7g==
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
Subject: [PATCH v11 0/5] lan966x pci device: Add support for SFPs, simple-bus part
Date: Thu, 19 Nov 2026 12:37:51 +0100
Message-ID: <20261119113758.603074-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_033816_050066_611289FD 
X-CRM114-Status: GOOD (  16.05  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Previously, I sent a big picture series adding support for SFP ports
available on the LAN966x PCI device [0].

In this series patches touch several parts and sub-system in the kernel.
Reviews have be done and it makes sense to split the series and send
parts separately.

This current series is the extraction of patches related to the
simple-bus driver. It has to be seen as a continuation of the big
picture series but related to this specific simple-bus part.

Patch 1 fixes an already existing issue reported by Sashiko.
Patch 2 removes the no more useful remove() function.

Patch 3 depopulates devices populated at probe() when the driver is
unbound.

Patch 4 prepares TI OMAP bus-only devices to be populated by the
simple-pm-bus probe().

Patch 5 makes the simple-bus driver compatible with fw_devlink
expectation consisting in creating its child devices at probe.

[0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes:

v10 -> v11
  v10: https://lore.kernel.org/all/20261119110014.582363-6-herve.codina@bootlin.com/

  - Patches 1..4
    No change

  - Patch 5
    Fix commit mentioned in Fixes tag.

v9 -> v10
  v9: https://lore.kernel.org/all/20261109140916.90625-1-herve.codina@bootlin.com/

  - Patches 1..3
    No change

  - Patch 4 (new patch in v10)
    Prepares TI OMAP bus-only devices to be populated by the
    simple-pm-bus probe(). This fixes an issue reported by Sashiko
    related auxdata lookup table dropped in simple_pm_bus_probe().

  - Patch 5 (patch 4 in v9)
    Use of_platform_default_populate() instead of of_platform_populate()
    for bus-only devices to fix the 'unpopulated grandchildren in
    simple_pm_bus_populate()' issue reported by Sashiko.
    Add Fixes tag.

v8 -> v9
  v8: https://lore.kernel.org/all/20260630102717.413501-1-herve.codina@bootlin.com/

  Rebase on top of v7.4-rc1

  - Patch 1 (new patch in v9)
    Fix an issue reported by Sashiko related to possible inconsistencies
    between operations done at probe() and the ones done at remove().

  - Patch 2 (new patch in v9)
    Fully remove the remove() function.

  - Patch 3
    Changed the way depopulate is performed and use devres feature.
    Took into account a pm_runtime possible issue (reported by Sashiko)
    related to async pm_request_idle() triggered when all child devices
    are removed from the bus.

  - Patch 4
    Use devres feature.

v7 -> v8
  v7: https://lore.kernel.org/all/20260511155902.34534-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1
  No nother changes

v6 -> v7

  Rebase on top of v7.1-rc1

  - Patch 1
    No changes

  - Patch 2
    Fix conflict due to device_has_driver_override() introduction.

Older iterations:
  Patches 4 and 5 in the big picture series
  https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Herve Codina (5):
  bus: simple-pm-bus: Avoid inconsistencies between probe() and remove()
  bus: simple-pm-bus: Remove the remove() function
  bus: simple-pm-bus: Remove child devices when the bus is unbound
  ARM: OMAP2+: pdata-quirks: Pass auxdata for simple-bus devices
  bus: simple-pm-bus: Populate child nodes at probe

 arch/arm/mach-omap2/pdata-quirks.c |  1 +
 drivers/bus/simple-pm-bus.c        | 92 ++++++++++++++++++++++--------
 2 files changed, 70 insertions(+), 23 deletions(-)

-- 
2.56.0


