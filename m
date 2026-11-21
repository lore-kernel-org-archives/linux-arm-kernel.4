Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2d4s8oTf;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gtQC1xM8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zeAGBzUvkXeOm8/CB9GEDh0u7+FI30sxlipMlqhTmnI=; b=2d4s8oTfg6XInusfWL0bAk5Fik
	FFsvgRYSz9PwTQtgX6jTrE6TQVzK5HcnvUD9M8VxTTmn6puSedhDNPhR2NEiM1SiFOjfYVeB9iTUi
	XL8F+nvXcv6dQYCRZki6MJhhWN5TjXHKagfIHEePT5ZTlB4ASh5yVu2eADD0HqnOxt54Fhsp69OKX
	La3G9fz+xHql7KzO/+R/8B1/QvLA+lW5Gw1QO6rlwA56fbahFxGKeEIg8RKe1yNAoY+1YAeFrPVmD
	06X8tWECg8NoPBwphP7hMGsayKGY8JtQDoZ0zG+E2l8qxMB5zV0z1OBVueIOrFCzZ55QG/h92b9I/
	WBqRO2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoca-0000000HYXT-0SR2;
	Sat, 21 Nov 2026 17:11:28 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUocX-0000000HYWC-17vY;
	Sat, 21 Nov 2026 17:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795281081; bh=zeAGBzUvkXeOm8/CB9GEDh0u7+FI30sxlipMlqhTmnI=;
	h=From:To:Cc:Subject:Date;
	b=gtQC1xM8obtKfjt5gvs/0bzkII2b22Kj4/W3pUrdxDIEaOIB/fgsoUHqYuSI6PYOs
	 t3WCrr6ZaNHALXLFP9+h8BQ5ozoOK8xR9MZJ82/ruE2kOCNHxsZYAzmUyL101ekLvZ
	 6HD32fvmsc+ECIdxg2bOARFup+xIB0xCNsgKxiio=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 2D22F85E; Sun, 22 Nov 2026 01:11:18 +0800
X-QQ-mid: xmsmtpt1795281078tmvupf2jg
Message-ID: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuvjAbzxDC/d292Dzu8u6ODXknC8jRsMFWVDLcsIjgINkf7SjZxi
	 5CoJ4Zk8Pmsg+MVa1E2WfndJK9wHKEnMX70Me40klfXK7EoPkJQUGZodA/sqAK65tNrhy7T5MWMh
	 Atu3+QVqJVQ4OCG/wQRYvCWuiYWF7IWSNDp1tNZ1HGnhhJKUG5jqO3hxWzhh8nxCqU+JIrnaNF9V
	 zA3Y1u3YztGF+EB1KZIUQq19e6UyjdQtwqUPOlLM5bWRuBBHNFlNwXoqRqQOYNJQumriyvLyPwVF
	 b/Kz5Kqz+yhqG19TLUuZerB0cd5soTFNH6+9rs4K3P2ozrPX/TkxEWMY6teGbc+8MIBMj7NqDAjS
	 2MQ01R/U234CtXliA6FEYRAWxmGfKtg/kApkfqG+sNYDBq2XOacLLGCLigtIz7v0HtjSSRQHujz8
	 3WO+frUiywH9KyF1aZB0zy43b0J5BxWUYCOcA2V1HyAbzHAVqOT/LFa+PoUHPe9ykaZsqYZqTkGC
	 Oxns19w/zWhfCv1c3owh2r6G7qUqNP9jDdNH500Ip3dkoD/MYLyRHtlwfnCx03zFt6GfR/LucrJP
	 YlHBHUFli87+/EMOzU7NH1udYTdYsSoi2R/ujPDD5JKTTm1DRYKep1BUcrU+fY8z//w45QcYDlFR
	 JMJH/bY08mh8pXEd/k6LO9Di2aqEBE2jV+vYATizT+45NyX/Xw/1b/ZQw3GeBv02bGz+b7nJbkd+
	 QzgCOgdzNYSrrB3+4nHsljt5aUvsCXgjfioc389ZB6dL0pxkiVXJxCGOeb/Phh2E7+BFjp/psLeL
	 H0KJIydCaOSuDCfPFW82s8PV6WH+wmQsaqxFCrwqfB99Q0w/2F+yTcgngYVH7ehj8+q4UrnfqRbz
	 2j7UrOqd/WdgzM+Lwxmz6+5SbuBpUn4559sZuxrVj53hlj2BT270JLXE4KTzTrF4LEQdqkavyALp
	 lOOXwj63ko6VbrJPHi2B7TmH8y0/z91KypoAmv7vi12C/l9hLXA5hKEZNcjztTZoFsGIYxUNsCdM
	 6AvlSVPrFwuUyihkXlrpUOB7vNHXN9bDUdgqqsWafoTPkDKlIrIiNKivBXn6xqJ9UnsYwa0AmIrF
	 gfA0VDTNDFKCdySZrp7o8bjcZuqegT8TK+Ywdr
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
Date: Sun, 22 Nov 2026 01:11:16 +0800
X-OQ-MSGID: <20261121171116.1703397-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_091125_653954_7E8043BC 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
whereas the other timing tables and the lookup loop use Hz. When
enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
372000000) against timings[].rate in Mbps (e.g. 400), so no entry
matches. The loop falls through to the last, fastest entry and programs
an excessively large TLPX/LPX counter, preventing panels from decoding
low-power DCS initialization commands.

Convert the 1.5 GHz timing table rate values to Hz so the lookup
selects the matching entry.

Tested on an RK3506B board: the panel receives the low-power init
sequence and the framebuffer console displays properly.

Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
Changes in v2:
- Split out from the combined drm/phy patch into a standalone phy
  subsystem patch per Heiko's review.
- Limit recipients to phy and Rockchip maintainers/lists.
- Fix Signed-off-by author name formatting.

 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

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


