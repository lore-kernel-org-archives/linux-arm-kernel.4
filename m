Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC92606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GYeLZBN6;
	dkim=pass (2048-bit key) header.d=octarion.eu header.i=@octarion.eu header.a=rsa-sha256 header.s=mail header.b=kMxL3zg1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KFSasBaQ8OA2KKDICReL5AyVNlfF5o5HYocfZ1mZcWk=; b=GYeLZBN6cUXL16du/tu4Lmz0+b
	QCSj0/V6AxCAWd9UKgMcCfBQQg58tZ5xmZFo/HmWXBCuI7dJgZJbcuy+iYtNDHnb7sK233HOueuKN
	1TrmwB4KU+gce7AjkYxUj47DRg35IwKE6h/Y/AjgRzz9X62ur2w1V+a/5SizMLhLTjX2QvxPnHb+T
	1rHqbDyyIuczylbO4j03uDU+dgDTPP+g9jt+CoY5Il0l6JhLtG7KslBIK/EST2NT+GME6+Y58qRuI
	kvxFNXcFuH3kTvTGOhqj/SdaPcsVGOWgoA9K6RgVjiaEgRcjx1mlX5CyCNN5wHXnk8Vn/dhfNyiD9
	1eZ7w/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQgj-0000000FS97-2ImI;
	Fri, 20 Nov 2026 15:38:09 +0000
Received: from mail.octarion.eu ([2a03:a800:12:1:2::8240])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQgg-0000000FS6t-0nO4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:38:08 +0000
Received: from mail.octarion.eu (localhost [127.0.0.1])
	by mail.octarion.eu (Postfix) with ESMTP id AC0674AC0C0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octarion.eu; s=mail; t=1795189077; h=from:to:subject:date:message-id:mime-version; bh=KFSasBaQ8OA2KKDICReL5AyVNlfF5o5HYocfZ1mZcWk=; b=kMxL3zg1yr5R7HP5w9hCzCdsls68BJkrDbxotdBCYWeAYdzCy+caZF9QvYRb51gXSlkSH/UKkeVS
	CSQbyJWatmwbDsKXXgHbKsc9L5jDStAhC8tYScviUieqOYGLY2P+gindRa0fPs1C6S//CDpzueFY
	I6cyGrbWluqsO5rv1gAdyX30nzZXE+zXR++vKoabbT74MK3TdJwrNcIxMb9B6RKQN1h38sT4aBw4
	Rj+bkDKR5eUVIwYfuHwsv8bnLmwdi3uoqIhiwE9CD6kfmJcjfhL9wn//M0QrlIsKzOSfbdImAhFK
	Lj6fBs/rlJvB9w3U69I7l0rUhyDA0d/votFRIg==
Received: from localhost.localdomain (unknown [IPv6:2a02:1807:3930:3611:dd78:6350:fd25:20d0])
	by mail.octarion.eu (Postfix) with ESMTPSA id F09294AC0B1;
	Fri, 20 Nov 2026 15:37:56 +0000 (UTC)
From: Herman verschooten <Herman@octarion.eu>
To: Chen-Yu Tsai <wens@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herman verschooten <Herman@octarion.eu>
Subject: [PATCH] clk: sunxi-ng: sun6i-a31: Fix LCD CH0 and IEP clock mux widths
Date: Fri, 20 Nov 2026 16:37:23 +0100
Message-ID: <20261120153723.85232-1-Herman@octarion.eu>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_073806_687355_B6B211D5 
X-CRM114-Status: GOOD (  13.86  )
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

The source select fields of the LCD0/LCD1 CH0 clocks and the IEP DRC0,
DRC1, DEU0 and DEU1 clocks are 3 bits wide (bits 26:24), like those of
the BE, FE and MP clocks, but they are described as 2 bits wide. The LCD
CH0 clocks have 5 possible parents and the IEP clocks 6 (the same
de_parents as BE/FE/MP), so pll-mipi, pll9 and pll10 can never be
selected. Worse, if the bootloader left bit 26 set, Linux keeps it when
it reparents these clocks, and the register ends up selecting a
different or reserved source.

This happens on a Modecom FreeTab 8014 tablet, whose vendor bootloader
shows its boot logo on the LVDS panel and leaves bit 26 set in both the
LCD0 CH0 and the IEP DRC0 clock registers. Linux reparents them to
pll-video0-2x and pll-periph-2x by writing only bits 25:24, leaving both
registers at the reserved value 0b110: the TCON gets no clock and never
raises a vblank interrupt (drm_atomic_helper_wait_for_vblanks() times
out, the panel stays dark), and once the TCON clock is fixed by hand,
the unclocked DRC0 makes the panel show a flat colour instead of the
picture. When the same kernel is started over FEL, where these registers
start at zero, the display works.

Describe these muxes as 3 bits wide.

Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
Assisted-by: claude-opus-5-5
Signed-off-by: Herman verschooten <Herman@octarion.eu>
---
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
index bab65cf..0884dc5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
@@ -551,9 +551,9 @@ static const char * const lcd_ch0_parents[] = { "pll-video0", "pll-video1",
 						"pll-video0-2x",
 						"pll-video1-2x", "pll-mipi" };
 static SUNXI_CCU_MUX_WITH_GATE(lcd0_ch0_clk, "lcd0-ch0", lcd_ch0_parents,
-			       0x118, 24, 2, BIT(31), CLK_SET_RATE_PARENT);
+			       0x118, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_MUX_WITH_GATE(lcd1_ch0_clk, "lcd1-ch0", lcd_ch0_parents,
-			       0x11c, 24, 2, BIT(31), CLK_SET_RATE_PARENT);
+			       0x11c, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 
 static const char * const lcd_ch1_parents[] = { "pll-video0", "pll-video1",
 						"pll-video0-2x",
@@ -645,13 +645,13 @@ static SUNXI_CCU_M_WITH_MUX_GATE(mipi_csi_dphy_clk, "mipi-csi-dphy",
 				 BIT(15), 0);
 
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_drc0_clk, "iep-drc0", de_parents,
-				 0x180, 0, 3, 24, 2, BIT(31), 0);
+				 0x180, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_drc1_clk, "iep-drc1", de_parents,
-				 0x184, 0, 3, 24, 2, BIT(31), 0);
+				 0x184, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_deu0_clk, "iep-deu0", de_parents,
-				 0x188, 0, 3, 24, 2, BIT(31), 0);
+				 0x188, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_deu1_clk, "iep-deu1", de_parents,
-				 0x18c, 0, 3, 24, 2, BIT(31), 0);
+				 0x18c, 0, 3, 24, 3, BIT(31), 0);
 
 static const char * const gpu_parents[] = { "pll-gpu", "pll-periph-2x",
 					    "pll-video0", "pll-video1",
-- 
2.56.1


