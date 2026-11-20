Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E160A2620
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hfS1EEh1;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BWjzVm+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UGgNyp7svh7X4XAI34FVv4NHd5d512BAdv477CcIj7Y=; b=hfS1EEh19LBSqu
	DDKl3a6xc7TFA6OIz2EXNwzm4kHp/OuhdwfXldK2sCdX+aI3xQrj7J5gnFWqg2/1mp55axIcxRBPe
	nr2fMJYMaNoflFOIik97OO5Nj+gq+ievKClq8NwwHtJ26RDu8VH4RcBWvzvlezux0bcGh7I2kw3Tg
	Iy8u2RM3f+NHzhxTVsYO17LPgApi84prjIDBp0qjeVVg/wSoGPv2Bxre+8CO/XB/8nm01WC4bWkbA
	2K36KxqRdNry0Wt60n4lxiSTsg3QmrjkGIzZI9/xSva1MpAiJFEZAs5P0T216hwZi0xH+memtCEQZ
	c0IKo4emAYnPWvGDlPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOAa-0000000F1Ui-3J5Q;
	Fri, 20 Nov 2026 12:56:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOAP-0000000F1O5-1NAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:56:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9D191A174A;
	Fri, 20 Nov 2026 12:56:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A28FE601B9;
	Fri, 20 Nov 2026 12:56:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8B4A11BC017C;
	Fri, 20 Nov 2026 13:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UGgNyp7svh7X4XAI34FVv4NHd5d512BAdv477CcIj7Y=;
	b=BWjzVm+cZUWQ9mNygpkvKADtuX7/Q6GCq/hzSWSf16hs5Up55nfy2SN3mGGyMGFbdCXibk
	FJ6IQn9FSOVZTZBUlhLJCaXNBPz2HVM122BwVevchi4wv6hIlSRc1B7qJwIdxFSUYtIE+A
	JigaCIKCVHPaIqzxmVO4ILhrSab5zCNsDxumKTHAiw/G6qU+mHycuZ6SqzyomQsU6kFZcD
	9VEZu+1mBlkDQOLl7dyh0iIc7afYrop0kj9EgGJppKK34iOqWRNUxIsislEqu7RU0A4E09
	08Ebtw/6S0SlorSDGvuAppgyaFksHvtGN5gFessULZa0d1/1ygGrObgUUXCPAA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:51 +0100
Subject: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode
 constants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045638_135728_A35B03E2 
X-CRM114-Status: GOOD (  10.94  )
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

Add the `CDNS_TORRENT_MODE_*` constants to
include/dt-bindings/phy/phy-cadence.h such as SATA-LP and 2500BASE-X.

These constants are used by the new Cadence Torrent PHY driver and
are referenced by the `cdns,phy-mode` property of the Cadence Torrent
PHY binding to select the PHY mode.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 9 +++++++++
 include/dt-bindings/phy/phy-cadence.h                          | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 8e845e2373ac..17a8343ac899 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -101,6 +101,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12]
 
+      cdns,phy-mode:
+        description:
+          Specifies an optional mode of PHY for which the group of PHY lanes is used.
+          Refer include/dt-bindings/phy/phy-cadence.h for the constants to be used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 63
+        default: 0
+
       cdns,num-lanes:
         description:
           Number of lanes.
diff --git a/include/dt-bindings/phy/phy-cadence.h b/include/dt-bindings/phy/phy-cadence.h
index 0671991208fc..94945b843288 100644
--- a/include/dt-bindings/phy/phy-cadence.h
+++ b/include/dt-bindings/phy/phy-cadence.h
@@ -15,6 +15,14 @@
 #define CDNS_TORRENT_DERIVED_REFCLK	1
 #define CDNS_TORRENT_RECEIVED_REFCLK	2
 
+#define CDNS_TORRENT_MODE_NONE		0x00
+#define CDNS_TORRENT_MODE_USB_G1	0x01
+#define CDNS_TORRENT_MODE_USB_IO_11V	0x02
+#define CDNS_TORRENT_MODE_XAUI_LP	0x04
+#define CDNS_TORRENT_MODE_SATA_LP	0x08
+#define CDNS_TORRENT_MODE_2500_BASEX	0x10
+#define CDNS_TORRENT_MODE_QSGMII	0x20
+
 /* Sierra */
 #define CDNS_SIERRA_PLL_CMNLC		0
 #define CDNS_SIERRA_PLL_CMNLC1		1

-- 
2.56.1


