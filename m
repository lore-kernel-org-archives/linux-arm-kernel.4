Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YpIZVJ1Y;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ispycg+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xmt8jo7oKKzTvhYcY6f1b8Zs3I9/GqGJBF3qAGH80D4=; b=YpIZVJ1YK6GhSCatRotwoJXXwm
	9VberuRSkdq4174v2jhalNWIUrT6pJnJf4ugNnfHJka+aHca7gRTpN3dJjOT5XBOJJXKaS3XBxCmO
	MZ3lbgzygIw8oGYNg1t8z481ta6BE3dt8CkT207nwIKrYYgjQh3xJ0L6uo2AdqCTNrxE5EjkTgb3Z
	f1rJETaGfMIDQH0pW3N+gZkHEi6DmxfyVX9fCEOo9bP6jPQ8SMcQOJO1VllKxvR3tarBxFZAHf8LB
	aextQsqmnQXHeZ1/pfMFeo0D5iFQgnLI2T539I6e3PGK+KUr/wqzGHYb+OhAGMd4KO7EhaARTLXSi
	urjMHXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfzl-0000000GuF9-0wNr;
	Sat, 21 Nov 2026 07:58:49 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfzh-0000000GuE2-1xKe;
	Sat, 21 Nov 2026 07:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795247921; bh=Xmt8jo7oKKzTvhYcY6f1b8Zs3I9/GqGJBF3qAGH80D4=;
	h=From:To:Cc:Subject:Date;
	b=Ispycg+a3sAa1WU5PXGrZMh41is5LNCwzCByGkiY+g934KrMoGXybO5ibYIyrQ/dh
	 Q0o4F/c9CiyI4TSnKEd/AkTk8QCld7LgW/yGhuvAp78eYPz3X8bL4SL5ONFKJHCdj9
	 954UKaKLVuD07iljE3JER49pDrXVSMpM5fT6IaUM=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id EA517A94; Sat, 21 Nov 2026 15:58:37 +0800
X-QQ-mid: xmsmtpt1795247917t4zunjgeo
Message-ID: <tencent_6F7C9E04169BCBAE4E162DAA3DCD5395B209@qq.com>
X-QQ-XMAILINFO: OKquegeHeYmF6WbOtyTZ71BnVYmwKY+O+h3/k7lMB2BxYQi7WXNhMgPMUkX+yU
	 ZCE4V++4VafBpe1iwLqDPTPTg1Wv6ymcQF1C6JbjYVrVE8JnEkhfekICSFy5FjjcDxecxUgc6CQU
	 4AoGiyLmhRlrgW+Q0M869OZ8zDBOubihez9mMiPgn+y440PqxBuPCl/5uXnG4Hzg5TALEjAr3xYE
	 PgoJLCCZByOC08JaiWJ1e5TFGndH7es9ddWW1cGgbd0yxd0CenwdSsEiY8n45vUsCBfqJ2b7xghU
	 Y7P/6zc4qVy/qmgtv4jKX4dcXBiypHOFkXQDrEIwexVNXYk62xANcB4XVOPz1SaBMdCmDogogcsP
	 D2IrT5iB9ewcttnvuRdFQzasuoPRN1B3SgKESL3K7GvZTap3TgZeycssYAxRbU+Od9VuDMxsEbMi
	 kxXmavRFNNaeVPDJzDwkRXfPMXAjOksopKsPylcTNIA7op2oeMm6abMGwjV2hXhAzoxzmAxh2ZA6
	 a73em9asBUV2l+i5ocTEix35BYQWd/TPqmgwR3qw+UvEQmcRk8pHipBHXhC1DhD3TNtnrOFcGC5m
	 WzoDvZ3S3Bf3Lxkd+mtk2WZOr/8/vXGzl2U9IVkN5qDbgfJJbmR80EZIfvviPaXxE+8Vt9rBpsKG
	 EWfX4Dfit8weSJ9dc9hWyqpjHf105dDuO29bw91qV/F6EeCS6ZHEkPIPvZZf3LJaEw7UYOgmWql9
	 FIXQoim0jTA920ASZHS81/IiukCfZvZ06PHsar8SC6Jtg1Dds1zQFstpTSjDSO+jS36ILMkUEdrb
	 t9GA25xozqMtINC3Tt56zrmthO315pz4btUyNtua6sJGMySbRmjBSmgKq+3o/DTUDScDWv820Tl4
	 DzFzeaVO0iFHFgf6RF8zoftqpqW4qFuX5/Lfne8CqaE3OXDmQEOJ4i9PVd1Zkj/oGtfjvuL/smOt
	 3gRwAkgpema9W0UkzyuPWqfnRLnsCtCbpnpnoRU5f4zlyr0432CkI2GGJhGPskcTrok8gW/z/Ltc
	 LY0RT/tLEi1gA9r4q45pwdvXuIJvpo8x/TANfndVJh8JQY5InapQpm4SPhJ8VmQOm67IkE1GUnJx
	 lM/yhLQvHO4Ky67e3hZMYxzOr/MBAlMfoBE7X7DrhUJ2n+JLp+q9tAWMLuZPVPiqGYdgD1
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH] drm/phy: rockchip: fix RK3506 DSI low-power command handling
Date: Sat, 21 Nov 2026 15:58:35 +0800
X-OQ-MSGID: <20261121075835.1283525-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_235845_934929_75B8C517 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two bugs keep the RK3506 MIPI-DSI link from initialising a panel: the
DPHY programs the wrong high-speed timing entry, and the PHY data lanes
are never enabled in the GRF.

1. phy-rockchip-inno-dsidphy picks the wrong HS timing entry

   The 1.5 GHz inno DSI PHY timing table stores its rates in Mbps while
   the other tables and the lookup use Hz. The mode enable code compares
   inno->pll.rate in Hz (e.g. 372000000) against timings[].rate in Mbps
   (e.g. 400), so the comparison never matches. The loop runs to the end
   and the last, fastest entry is used, which programs a TLPX/LPX
   counter that is far too large. The panel then cannot decode the
   low-power DCS commands and stays in sleep mode, so the display stays
   black even though the LP packets are visible on the data lane.

   Convert the 1.5 GHz timing table rates to Hz so that the lookup
   selects the correct entry.

2. The RK3506 DSI GRF lane enable bits are never written

   rk3506_chip_data only clears the turnaround / force-stop fields, so
   the PHY data lanes stay disabled unless the boot loader happens to
   enable them. Program RK3506_DSI_PHY_ENABLE_LANE0/1 as well.

Tested on the RK3506B JerryTech board: the panel now receives the init
sequence over LP and the framebuffer console is visible.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  6 +++-
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 30d6f83c..116cc140 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -199,6 +199,8 @@
 
 #define RK3506_SYS_GRF_SOC_CON6		0x0018
 #define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RK3506_DSI_PHY_ENABLE_LANE1	BIT(9)
+#define RK3506_DSI_PHY_ENABLE_LANE0	BIT(8)
 #define RK3506_DSI_TURNDISABLE		BIT(2)
 #define RK3506_DSI_FORCERXMODE		BIT(0)
 
@@ -1727,7 +1729,9 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
 		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
 		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
-			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE0, 1) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE1, 1)),
 		.max_data_lanes = 2,
 		.max_bit_rate_per_lane = 1500000000UL,
 		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 6ad04b0c..fcf7aa17 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -282,20 +282,20 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
 
 static const
 struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
-	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
-	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
-	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
-	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
-	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
-	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
-	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
-	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
-	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
-	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
-	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
-	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
-	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
-	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
+	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
+	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
+	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
+	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
+	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
+	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
+	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
+	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
+	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
+	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
+	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
+	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
+	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
+	{1500000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
 };
 
 static const
-- 
2.47.3


