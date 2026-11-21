Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cKZ/ZRLJ;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x5BRC18z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LrUW/HVyUin0TofWGwTk9dRHQBiji2IVRbA5AhcMZX8=; b=cKZ/ZRLJf4Fcjv1fGwhniFxUaq
	+QUbPPnLjEf8tNeVohPeKheRvwJDx25lOaCY5+LLXBrUamkfQcc4x8r2z48LppWbX2VOdpYftBbui
	NJFyGdnNQKxULvSClLvLlwP+CgRAmxIv8DgsULUHGMZeqYa1jqt9L1jdl6l4noU8XdBce9Sfm/yLZ
	LX7ECltB6YV0cI2neVi0eHyu6jgq1uHL9aYPCohb8S9zzMZtcfHj7yOUrP4UYXBYo0nH7NQP6fHyT
	+kSowFqjpKvCfdEI4Sl3U7abAZZx6mKjpVQvbfCLXTtid0Y92qGLJk+pzKqzE1ukX1xaX2YDlfT78
	cYjyKCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUobi-0000000HYOD-3TSb;
	Sat, 21 Nov 2026 17:10:34 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUobf-0000000HYNm-3Wk6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795281027; bh=LrUW/HVyUin0TofWGwTk9dRHQBiji2IVRbA5AhcMZX8=;
	h=From:To:Cc:Subject:Date;
	b=x5BRC18z9pl/WBB4DWairDyF55ypRyVNU8x7r6E3W2Ueh7iGwvgYRgHVqboa4fjGp
	 EWjP8WoV/EqklY9NUcqWyOC/FQrvpFNV3KQzokJKtCYtf7xK5Jc4ftNc9KRP8lwPoM
	 YPn6QsW9SgbFSzaZc23SsOvvYDbEo75GElzGwBLI=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 29831E76; Sun, 22 Nov 2026 01:10:24 +0800
X-QQ-mid: xmsmtpt1795281024tfj1gwz0l
Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJcREJkrvuUFBXNINloNXIHma/buZUhOS7t6fyIaZeXo2vAaT2c2
	 4UFFx4v9cpXIbPv3LG8FQctTkaEh2zJb3NVFAQvxlROJTJ9fnnrO3h+7K6zsPMvr6wu2NoO+i6vr
	 o4p/gsxdPEljwd/ZgKEWP2o6ARkNs6+6vVZbfsc7XWXFVczHug7C1fG5udlAEFp/KBowvqwx+9+3
	 yOKlisvYiQCKlaCROqK2e4lw4YVWy5eWLgSPr4Eahc/f4A9rejAhuHMHUV6DrCgDczx9fiIi98jg
	 eFS7Ae1SNvG79e/u4Iwpyrm8l3D8ShSLwuNGh2nDUcfnc8krCE62EzsqzfGegH7fnIbXWSKVS2vC
	 zH/cJBZMqtss2TL4Sa0THtdRgo4lFRJy93MKoOQuck1dE8DRhrpJvpjZ0aMAYPa2CYBSsN2RhFYV
	 NP6mxDVQRftjDd1FFKGJElG2vM7BY3rDm9FuNWcs3Wp/nXXCQbOAFOz5FIAntzDdrFOYc+YXpY6h
	 R+B5/dppM0BEy2zWYq6BcGipSLhJcOn0fwSszDi/7CRLuWGVuWfqYEL0Bt2gSk0On14wyPQB/VND
	 HFsfS5R1noNgAZFC/p3ovTorF/9F6l3e6Ifgm5udgtOmKYbX9orSf+CGNgCFDsqiUiQ0EqqGloSr
	 ci2Id63POkG6UUYqXFThgbuaeHwKPbJ0AH0B9qm9m2/ZlKFts6Ii3i1bSgPP86U9oY4wHE7Dj4iY
	 HUI09chVrU3jHOPfzd0FOjRG0G71sEkmER5WH2BBTVf4u7RRzxAuoXkHW2YbFxnUT3iT6LClagR2
	 e+wyYS908X07mKddcSLN8jdQqPejuSK3QdFtuT+36PGDlY1ws1toAmfQmL3+A8X/sz1OWewc6l6I
	 5j45/XxMhhlScaXQsftXbe3xtUg1xgw2XQIi646leL7DeAuKuwuO80GvIIlsiVNMAs5yu9sqMuPS
	 SplL0KCsoJVT4aMqyLXYKjVnJoDHGiEjMRe1w0D8k2rNmz+RQBfETi2G0+7QNr5weRpQB8z51bDc
	 9vGBkjqmXmeE88G/5xdqKgY2/KhCUfeAC7BCXll9ajhV/JA2ScoH6ou7V9Y9P00AzcbSrMF2cs/r
	 +A1b6QZK+ff0J5hs0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: ZhuXiangyu <1194781887@qq.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH v2] drm/rockchip: dsi: enable RK3506 PHY data lanes in GRF
Date: Sun, 22 Nov 2026 01:10:22 +0800
X-OQ-MSGID: <20261121171022.1702714-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_091032_358130_9B5402CD 
X-CRM114-Status: GOOD (  10.90  )
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

rk3506_chip_data currently only clears the turnaround, force-rx, and
force-tx-stop fields in RK3506_SYS_GRF_SOC_CON6. As a result, the DSI
PHY data lanes remain disabled unless the bootloader happens to enable
them.

Set RK3506_DSI_PHY_ENABLE_LANE0 and RK3506_DSI_PHY_ENABLE_LANE1 in
lanecfg1 so the data lanes are reliably enabled by the driver.

Tested on an RK3506B board: the panel receives the low-power init
sequence and the framebuffer console displays properly.

Fixes: cabeacc7eadc ("drm/rockchip: dsi: Add support for rk3506")
Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
Changes in v2:
- Split out from the combined drm/phy patch into a standalone drm
  subsystem patch per Heiko's review.
- Limit recipients to drm and Rockchip maintainers/lists.
- Fix Signed-off-by author name formatting.

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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
-- 
2.47.3


