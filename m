Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38VUacck;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T6srVvW/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2OkpDkbCyoJLFOdO1lzyvVFusub3trHvPVp03It2fqI=; b=38VUacckJ00KPa
	4oqLgliQNnmY4ISaKKfEhBxrmZffopjm3fB/eSEwlLO6qKeW/OtAlLS437NfaoQsyTJJD2SBvJgN/
	yQ+ntEIAsfHh/zBE68P3GghHQCEwWaD2AoVAEWTdBX30staGOMw1nAItXZfvlXAnJau5ShEsNaBeG
	COXwpKoBMmM87TpqpAjgsSrJm+f41eQhL6iyUa++Jft1tP32nWcDPvHkd6TcLnXDEDqpUCItBIsg/
	sxRuAzBhvpW4kYQOv1NoVoOlrEyg0Utb9h94w1jjEE2xEo2lX1aPDZ+ul25l3AAU3eboNI5yMkXFd
	DCLZnQYqV1VRCfFrQXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfR-0000000H1zI-41xW;
	Fri, 27 Nov 2026 16:19:22 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfI-0000000H1ur-24MH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:19:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161906euoutp02f25e0426f3dd2cb44ea0da3fdc3ab7f5~r80M_qXbo1000310003euoutp02Q
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 16:19:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127161906euoutp02f25e0426f3dd2cb44ea0da3fdc3ab7f5~r80M_qXbo1000310003euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796346;
	bh=2OkpDkbCyoJLFOdO1lzyvVFusub3trHvPVp03It2fqI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=T6srVvW/342bRiJ+FwBSXVFm+sfF5Qa6TqQ1+eTiT9DO7Mgc9OHNQZ1P9kbauzQ7B
	 Kiuj5/bHVYOlDuna3tiPvpLpD1MJWJcacVzuVs4xRB0+DArXp50mAe/fNe4M8JUPvK
	 CdbD2ga4i2g6abDHROG98JaV+oPa1CCoRA/rHH98=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267~r80MgJ9mv2630926309eucas1p1l;
	Fri, 27 Nov 2026 16:19:06 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161905eusmtip2a3cc83f060c560cb84668452b3da5cf4~r80LjIpgr2967129671eusmtip2z;
	Fri, 27 Nov 2026 16:19:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 27 Nov 2026 17:18:59 +0100
Subject: [PATCH 1/3] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-1-465622e1b7ad@samsung.com>
In-Reply-To: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=xVFAkBd12BJey0Nt5oHwW5AmpKXWLEYRNqtQ/ReT9fM=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri2XMyptPHtq3rnnmgwnXS/8OnM5tiv7jWrG7KMbg
	zh6/DZEdZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJsKQyMtyftNxsxjR9V+O5
	i2039X74Ya7yy5BPU6L4wtSpfz7x3YpnZHhz54C8reRJ3vBDH37xm16dG+Jn92LLnJ43h++uZ7w
	wr5wPAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
X-EPHeader: CA
X-CMS-RootMailID: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
References: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
	<CGME20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_081913_842003_06414466 
X-CRM114-Status: GOOD (  13.44  )
X-Spam-Score: -2.8 (--)
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

v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
opposite. Most CEA modes drive both syncs with the same polarity so it
goes unnoticed; it only shows up on modes where the two differ.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Reported-by: Byron Stanoszek <gandalf@winds.org>
Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
Suggested-by: Dominique Belhachemi <db@domibel.de>
Tested-by: Maud Spierings <maud_spierings@murena.io>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 4d9d06d0419646f00142f984b797e810df37779a..3bdcacf3cbc8427c8420eac9a37e3ecb79682414 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -122,8 +122,8 @@ enum {
 #define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		((n) << 3)
-#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
 #define v_INETLACE(n)			((n) << 1)
 #define v_EXTERANL_VIDEO(n)		((n) << 0)
 

-- 
2.34.1


