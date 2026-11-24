Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xf+Lj4FZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CsX2K4gr;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HCJfdnxH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Srv8rcHLAJAs2t2TPg31VwudISEwEVC5eUbPY+Dzbd8=; b=Xf+Lj4FZNH9drfdoOyldtoWiKP
	eaQcK2bRgW8bQ4EaP57mgk9KyDlWsmMd635MhlKinO/6kkGGgL/bTLLYcfxLlJ51HgWkHH5PpQnWl
	4SyQTLcFZxAPgmv22BKR6A7zHBkeDz18kmWKxxznfQTxKIxj0c/4mT8j6xOPs+tVfpp5x76rJFrM9
	+Itdxpx+0MPbYt+qY6mMOfrOgqaXVer+8M5HjUkoVQEBRfvewg6WXicCwRj/qqGp6vaYfp0EFv7ZD
	2WpH//zhdtpc2doSJXPe71+yjfhSYcEcR7fX8KAG+YUPazH99O2KBr7JcNCE6i7qwRgRyldxD1fGF
	dUN2byvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkwf-00000005jv9-2PGR;
	Tue, 24 Nov 2026 07:28:05 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvK-00000005jL0-2iu1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505179; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=igMAIfZCNbOFtvleGfJ7d6euUGYeaasdKaSNtk906Xmg6DnoVK8CT2RRQq1pwUqQT1
    Ii0yBCtNovhvvZgCB27T6gIWeVoeTBvRSZYb87t6G2E5bU5RjIu7b3pnyIWroCiifEdF
    WPNS+kC0Vdj/urkhtkSSWxICD8hle/oVjkQQ2OFuqyNk0uO1PJS/zzAd6Pkr6PRIbiZ0
    roSkvoHttMe4brhcac4QyNkZ73Dkna/Nzr7bFyiDWaYASGHkPUqxmFTLlSOkigzL8i93
    zMPmos4+CFFYzLWf4nxvxGhPqSzq4uX1ru/5trTm20HpuF/9occD2GCnCSYuLNQDQ5Q/
    5ehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505179;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Srv8rcHLAJAs2t2TPg31VwudISEwEVC5eUbPY+Dzbd8=;
    b=OQi+Fmmo8/mwUjPKJ5A1C5D8cPcMDjTUOgrkLz+vEHk7fxwSadXLReLrRSdh/WvJZb
    BQbx5T+7BELdQdtWf8qQeYeqtA9WslsMmD3ETJx0y+0ihjjfRosvff5RMNRs1Ksysxhj
    B1lFvu/hdQ0B1roa9SPqpeRMzXHmbgAVIGmBizQkdSr3o8lrEgCWQVU9bTC2KjNwaxvl
    8kC3fLDQosZLqfhrDrSvxgHKAhIqT/CPLbl+ghaVZX1CRuTcJRaUgwH8YyMdTrJEyyyQ
    g5oBVs8HstfCJ32CL/u4J3mqJGSun8Ec28q1OqB1L941Yd7oXpYLVXtxQylNmwZv3MD3
    MNMA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505179;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Srv8rcHLAJAs2t2TPg31VwudISEwEVC5eUbPY+Dzbd8=;
    b=CsX2K4grDtkfuKJe2SA8EN89igEnflyJckHzpcWLl8RHR/zlFByYVZN9fg2aELr6Qr
    vIoucQDn1n88sL2kQc3oGFZi2/sQUwdp//V+Xo6fhdZxcSmHU/Lz4keNZ9wHCfLQWHxl
    zY+PxssjDK0+EZfY4dV5zW8/hb0hJB8kCVbH0Ro19Pt+TaQU4fdE4h7zBDfhow4R4IVO
    /BgbVNogmrGlUqjb7JC0OT4lbjbfg3lXcWJnydg++W/FJv6KZQSvttTz5eGI/4DEyg1o
    PAC7IPne25idIVSPJrxO0epmNHtp+dFg8RBZR6i9Y0dGqPnpchHTu15hKdqUBe3/GkgK
    6qUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505179;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Srv8rcHLAJAs2t2TPg31VwudISEwEVC5eUbPY+Dzbd8=;
    b=HCJfdnxH8wx/8C22xbS1CYyR4LwXme0uWeKGZSBqhaX2w7o+WupFIIPdyUuZ0CtqmQ
    1KEzNusC0g7xsOK0X3DA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QI1HR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:18 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Grond <grond66@riseup.net>
Subject: [PATCH v2 13/20] ARM: dts: omap3pandora: Disable unused DMA channels
Date: Tue, 24 Nov 2026 08:25:53 +0100
Message-ID: <9c47a735aeb0d1a5795119af0e9b8ae2bdcbad2e.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232650_684512_A27AD8F9 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the OpenPandora, only McSPI1 (spi0) is actually used. Because the device
tree defaults in arch/arm/boot/dts/omap3.dtsi leave all of the mcspi
interfaces enabled, the DMA channels which the device tree assigns to them
cannot be used for anything else. This is a problem because OMAP3's sDMA
controller can only have 32 DMA channels configured at any one time.

This can exhaust available sDMA channels and prevent McBSP audio
transfers from being allocated.

Disable unused McSPI2, McSPI3 and McSPI4 in the Pandora device tree.

Suggested-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Historical origin: 24727d33755e (Grond, 2021-12-08).
      The original contributor is credited with Suggested-by rather than
      an unverified current DCO sign-off.
      Commit-message and provenance review assisted by ChatGPT; code unchanged.

 .../boot/dts/ti/omap/omap3-pandora-common.dtsi  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index 06c5b23589991..2097ec15c6513 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -685,6 +685,23 @@ lcd_in: endpoint {
 
 };
 
+/*
+ * Only mcspi1 is used on the pandora, the others do not surface on the board
+ * due to pinmux configuration. disable the unused ones so that they do not
+ * consume DMA channels
+ */
+&mcspi2 {
+	status = "disabled";
+};
+
+&mcspi3 {
+	status = "disabled";
+};
+
+&mcspi4 {
+	status = "disabled";
+};
+
 /* n/a - used as GPIOs */
 &mcbsp1 {
 };
-- 
2.56.0


