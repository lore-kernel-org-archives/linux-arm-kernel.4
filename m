Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e5vS9iiz;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S+Gw97xI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=; b=e5vS9iiz9zZTCw3jJV/I0SLqeY
	tQXViQ0Q2P+1ZT+sASaVrZT+zRkwERRBtH0tixh8jzvt3Q8me3ElRLpskGla/Ypkip/QYM3TGY6j/
	KvAlqgD/5E1H0CSV7gxzCOhOarE5G8D+FuCPGxaeN9UkCg50hEVdhtUUJ+/qFy9yBQOvtT2/Cr5UG
	aDkQ1RNN5QFdhx3UiWwV73h24ChHHLqJpYdP4+QG6oaxo3UqO62OeRBEHdRBTGq4nZFGV7vJg5FX+
	pK57XHYlY5w89OsEG5J4TLNRrNRC4al/cYgdQRtW+5wkWhX7XZk+0vAeaL9Wh8UrcRctSlBTXXxN0
	Qn9n/8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfD-0000000CG5e-0nuX;
	Thu, 26 Nov 2026 07:13:03 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfB-0000000CG5C-0zZ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:02 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id ABBF5403EF;
	Thu, 26 Nov 2026 18:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795677171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=;
	b=S+Gw97xIOtAkRieQQs+SOn+HpjNXnlZbOYRP5t3zwnganqxBG9AmklkK9fPBfYfgGF/JpT
	946886chveBS0Dd6+fwGs+lLIlUkDfeGK5qjyfOo5lJLKJFDsZJNQAvf0bOERUr15+T/Ly
	MnbWZKRQFVR0X3f7sIMsVUppIAiU+t7HH7VUiIEOvw15UKXVOyhcvg82QPe8B5zKkxGWwa
	tpmsmVsKMMAfbpxmTkRKYyzAhPTqq+kcxlhEWh+5lNqfxqwPkPJLAIHVS5h59WFPM8Cs3E
	e/xQLW+PPxckrv/wRSag6b0sMAGzRh5FlBSMDgv54ou1jbEsFyd1kyRz8PA5vg==
X-GPT-Reason: legitimate. This is a technical software patch (Linux
	kernel style) sent from alastair@d-silva.org, which is a recognized
	personal address in the context. The content is a specific code
	diff regarding hardware clock gating (sunxi-ng: a733) and includes
	a valid "Fixes" reference, "Signed-off-by" line, and standard development
	headers. There are no phishing indicators, no suspicious links,
	and the content perfectly aligns with technical development rather
	than unsolicited marketing or scams.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] clk: sunxi-ng: a733: Mark msi-lite0 clocks as critical
Date: Thu, 26 Nov 2026 18:12:51 +1100
Message-ID: <20261126071251.2671198-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231301_431920_79135FF9 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

The ahb-msi-lite0 and mbus-msi-lite0 clocks gate the shared MSI-Lite0
bus fabric used by GMAC0 and other peripherals. The bus-msi-lite0 clock
only gates the register configuration interface. Until a bus or
interconnect driver models MSI-Lite0 consumers, referencing these shared
clocks only in GMAC0 does not reflect the shared fabric. Without
CLK_IS_CRITICAL, clk_disable_unused() gates them off and breaks GMAC0
link-up and DMA.

Mark ahb-msi-lite0 and mbus-msi-lite0 as CLK_IS_CRITICAL, matching
ahb-cpus and mbus-store in this driver.

Fixes: ed757071ac3d ("clk: sunxi-ng: a733: Add bus clock gates")
Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..74759dc6b292 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -567,8 +567,9 @@ static SUNXI_CCU_GATE_HWS(ahb_serdes_clk, "ahb-serdes", ahb_hws,
 			  0x5c0, BIT(8), 0);
 static SUNXI_CCU_GATE_HWS(ahb_usb_sys_clk, "ahb-usb-sys", ahb_hws,
 			  0x5c0, BIT(9), 0);
+/* Keep enabled for the shared MSI-Lite0 AHB bus fabric. */
 static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
-			  0x5c0, BIT(16), 0);
+			  0x5c0, BIT(16), CLK_IS_CRITICAL);
 
 /* This gate controls access to the storage controller MMIO registers. */
 static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
@@ -597,8 +598,9 @@ static SUNXI_CCU_GATE_HWS(mbus_vid_in_clk, "mbus-vid-in", mbus_hws,
 			  0x5e0, BIT(24), 0);
 static SUNXI_CCU_GATE_HWS(mbus_serdes_clk, "mbus-serdes", mbus_hws,
 			  0x5e0, BIT(28), 0);
+/* Keep enabled for the shared MSI-Lite0 MBUS DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws,
-			  0x5e0, BIT(29), 0);
+			  0x5e0, BIT(29), CLK_IS_CRITICAL);
 
 /* Keep enabled for the storage controller DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
-- 
2.53.0


