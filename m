Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzqC27q4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apRVd0lS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=; b=TzqC27q4Qr4OOBb42gmmSolwuM
	VS6RJBvi20TEYkiv3TGABszpUPh7OC18BXl0wNm7pqRty1iUyr1hzU0ylZ6CAZzLs/u7HXBdw6aOi
	IMceSnDA1LYk+PrbXpgNSeXnkgHIGKxlVG2d5Fi/OW+jH3X3HsTD+5ytIbT5Zhg9kKzhuWEFedHUH
	P8z0PQsDgt1k4j44F3MMW4FF42NLg3/hulGHw+xeaVOmkjs8VIACVa4C3zxnBw9CqCmRzdzh3JbJM
	HcDpEMeW0Oc7MSa/+Htix09MAKssREzG9JrB99QnfbgXGWnfsCG2q+kL8djK6qRdTRBJOmKpv41zO
	4h/YoFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhIS-0000000Eapb-3Z6z;
	Thu, 26 Nov 2026 21:46:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGi-0000000EZxk-1exQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6319638f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729478; x=1796334278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=apRVd0lSSoajGMWdsZxdRhJzYB7iBWJafHEBWlejt+JNYih9OFax4dIV7t3qNFwKR4
         JHF8eIBO8PasymMLcj4SCi5Km2VOks5V+M6FEzEEY7BxBFpN3e7IWgiL5kok6++Z2vM5
         xMcYebZWuvN5lIVIGBfE02wyNScXx6mYWEbMw2/QqLExI0NHglX6yX2SAg1Mm7KBb8Oi
         fbMeAQU2Qfyx2pra1LShIKFhvnzZ6p/pEjzVCRtnv1G9IEzKGrJWjFS+aglIvM8OG1Xh
         XAsU+GjvSjo1XLLmIKZpVlsVoykC0C/zu/ubJOOzcWiTm25Dz4ueRG7k/JvlK60pnAHV
         XBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729478; x=1796334278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=GTtaCtWY8ynxiMc8bvUsAvJ4YEljnxEu0vFxkpin38hfytEzmfaR0JDZSvaTMkDkPa
         VU1CZ7/HGZ5loyAOhnM+klyhSVMcKBvy3M9VcxCmbqagS9YJPilBn5Oz8ijXYuEcT/Dn
         8sFy3iRg0Oz1lvp78Y2tSUgE616gM1uEI9V2YiqLvc9XQNU/uc5o5kfir1zZhBYDktWn
         nq7PrZRPIXfsIv4QorQnK7V8va28nkeL1SaH+SpsYXX2t/6juL1N5aK1NGnwOSbR7yq7
         DLRNN5Egf6GnpkC7t88UrGlOpEjKCcimzhc2Heb/I3bsTJJzlx+x8ojMm13J7dV7yKyS
         ej4Q==
X-Forwarded-Encrypted: i=1; AL+hErF83PL7fxCCxtvIxSt6hmNBPa4YATmCWzRxSTqZsIWMOu1OPfbWqaaxX+Q92mC2TktxFZ0PdyEbXfF1hfoR+oZr@lists.infradead.org
X-Gm-Message-State: APuU4Z/KHR3qE+uLtD33rMvtmLCBFp4eVlbArbpzPURKDmokLOtP98Us
	x5Pq1rHhwJkPwSiQ8hs5iNyJdSmDDtwuBGI42SaRsunR5aWvkn0sqsf4apcuuA==
X-Gm-Gg: AZFdTZc+ACRKbJyhnsQmCZoUDOQ1i/NfbNmLWHLV/opyP0SbQqbfTea5OSxsB719CvD
	Nf8Akh5Y/torx/YK6L19d6uwJ5cblalNh1FDAA/miLA13mha7mC923fNlEo+FYDMxnThykyxeRb
	IBTG/Gie+xpkToANoOjh3y7sqgBHo+honx1JJRKMD6dnZCX2zw02mvPREU0avngzws7rKoJxSKz
	BdrPaev2jLaE1x6O0MuO5oumkuoQ38fY+ZB6uqnRfDslWZFNXZA4E1YOoiCMtAhxMH4j/xQWS6I
	6uNHctJzYlkwwhyez5P7mr+e9JgPMF/+/LiwDdkK0oZf30WuJIczA+2LgdgwpjSHV+rPaKZkttd
	Fvv72MDtHQZvwFH8T9Psn8NWA1Y+W/kMSlMSe9DGAyKCxSOA8no0Gb3pEmsOtU+42zJ5RJkKWeA
	AcQGUKsszoHU5tTkUmBQe0ybr2aWONb4nYWqz5n8Q2YHN0OiIz9vCAISLmRhXDlEj2ZOJuuggGi
	1xak6UBHUVhW4WkAXgLtxdE07n/gSmOe0B81aMvWOb63N4F1VXdNedECAsXdVa+kH76SA2i9udI
	z1gG6g918ZBLAW5ZiFxkZKO+mcsdkrJPq3RhDnAQP8os5Y3xnxt5QpRMOfe7cWvgXvXGZwIEdX2
	XLnP5xsX6/PJdnTW04cQoUTodRp3zK5pAGHRJ4lu65LzDG6t8h6bJltKx3as3oINi9VjbxvP467
	PoAJd9Q6lhpsuhXqKRkcze+sySNfHxmWdba+HlQP++2xvOvYaUP5adxyYSRbilxGjcHXeQrItQx
	1SEH2ieZPYIcOW1gUPT1GuMjDx8BHqADBfyq7PRO7QEOShwKUymfzyIt340Rqg=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr44566145f8f.9.1795729478381;
        Thu, 26 Nov 2026 13:44:38 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] drm/sun4i: Add H616 display pipeline support
Date: Thu, 26 Nov 2026 22:44:22 +0100
Message-ID: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_134440_463362_4AF20E05 
X-CRM114-Status: GOOD (  14.77  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the remaining bits for the H616 display pipeline:
TCON TOP, TCON LCD (R40 style) and TCON TV support, HDMI PHY, display
engine compatible, DT nodes and HDMI enablement on several boards.

TCON LCD support also covers SoCs with the same die and full LCD
outputs, like T507: both TCON LCDs share one LVDS reset, so it is now
requested as shared, and TCON LCD1 programs the second LVDS PHY. TCON
TOP now also routes LCD TCONs to the LCD pins explicitly. Dual
link LVDS is not supported by the driver yet. As on R40, only two of
the four TCONs can be enabled at the same time, since there are two
mixers.

HDMI PHY tables follow the BSP: PLL settings per TMDS clock band, like
on H6, and BSP specific values at CEA clocks, including their 1000/1001
variants.

The series is based on linux-next, since DT patches touch boards which
were changed in sunxi dt-for-7.5.

Tested on T95 Max (X96 Mate DT) with a 4K monitor and with a HDMI
capture device: picture captured and checked at 25.175, 27, 40, 65,
80.14, 88.75, 108, 119, 148.5, 178.2 and 297 MHz. 4K60 at 594 and
593.41 MHz shows a clean picture on the monitor, which reports
scrambling, lock and no character errors over SCDC (channel 0, the only
one it reports).
All capture device EDID modes set and checked twice, plus 15 hotplug
cycles.
An earlier version of these patches was tested on MYD-YT507H (T507)
with an LVDS panel on TCON LCD0 and HDMI working at the same time.
Shared LVDS reset and TCON LCD1 (second LVDS PHY) changes are build
tested only.

Best regards,
Jernej

Jernej Skrabec (11):
  dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
  dt-bindings: display: Add H616 display engine compatibles
  drm/sun4i: Add support for H616 TCON TOP
  drm/sun4i: tcon: Request LVDS reset as shared
  drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
  drm/sun4i: tcon: Add support for R40 LCD
  drm/sun4i: Add H616 TCON TV support
  drm/sun4i: Add support for H616 HDMI PHY
  drm/sun4i: Add compatible for H616 display engine
  arm64: dts: allwinner: h616: Add display pipeline
  arm64: dts: allwinner: h616: Enable HDMI on several boards

 .../bus/allwinner,sun50i-a64-de2.yaml         |  20 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   4 +-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  11 +
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |   1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  33 ++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |  30 ++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |  25 ++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  30 ++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |  30 ++
 .../sun50i-h618-yuzukihd-chameleon.dts        |  30 ++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  67 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        | 170 +++++++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |   3 +-
 20 files changed, 895 insertions(+), 11 deletions(-)


base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.43.0


