Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED67606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAnPMD3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BiKncMYBCZs5gJx1ophytALHk5lCtmyYZ4hUu5vrHW4=; b=TAnPMD3NZHJTbFQTVyZjHmqgDZ
	lr/YJKyQSln6MRe/He9YbJbZM+nqWRQkb5ObD+avEGy+XjlLp8HxtPG1H//SS99yC7f/cd492fG+H
	UpvODbky5Wmq/GLpn/n0W9c4kJZNkFPojaiww72PqSHygebTBab0mw0iL1onHnFRL5DZI1uCLgj0/
	q1zlXz+0UF4SUiyzkE0ZZA/J2mB3ZuZWyXKEgjC3EWNk4hbioKX7JC6MPhaBCnwkldXBHmf+sOlMl
	lXdYQEi4nOP7m43nKGQMkT2O8d26iKgy0pa0F7Ydx2u0Def+YFyvtvex9MhKpwwbGxgIDS6ypKION
	xnB8l94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF9p-0000000GJYh-0S0O;
	Sat, 14 Nov 2026 14:55:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF9h-0000000GJRj-3Fno;
	Sat, 14 Nov 2026 14:55:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9Y-000000005HI-2cWW;
	Sat, 14 Nov 2026 14:54:52 +0000
Date: Sat, 14 Nov 2026 14:54:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 2/6] clk: rockchip: rv1126: Add PD_VEPU clock tree
Message-ID: <f06eeff485ae8cf4f0a2b73352ab1234017a6ca9.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_065501_820346_8ECE8011 
X-CRM114-Status: GOOD (  10.97  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The video encoder power domain of the RV1126 contains the RKVENC
encoder. Add its AXI and AHB bus clocks, the AXI and AHB clocks of the
encoder and the encoder core clock, together with the two interconnect
gates that stay enabled and the two parent selections of the bus and
core clocks.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/rockchip/clk-rv1126.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rv1126.c b/drivers/clk/rockchip/clk-rv1126.c
index f35bc9670c274..111595c9d990d 100644
--- a/drivers/clk/rockchip/clk-rv1126.c
+++ b/drivers/clk/rockchip/clk-rv1126.c
@@ -176,6 +176,8 @@ PNAME(mux_i2s2_out2io_p)		= { "mclk_i2s2", "xin12m" };
 PNAME(mux_gpll_cpll_xin24m_p)		= { "gpll", "cpll", "xin24m" };
 PNAME(mux_audpwm_p)			= { "sclk_audpwm_div", "sclk_audpwm_fracdiv", "xin24m" };
 PNAME(mux_dclk_vop_p)			= { "dclk_vop_div", "dclk_vop_fracdiv", "xin24m" };
+PNAME(mux_cpll_gpll_hpll_p) = { "cpll", "gpll", "hpll" };
+PNAME(mux_cpll_hpll_gpll_p) = { "cpll", "hpll", "gpll" };
 PNAME(mux_usb480m_gpll_p)		= { "usb480m", "gpll" };
 PNAME(clk_gmac_src_m0_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m0" };
 PNAME(clk_gmac_src_m1_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m1" };
@@ -719,6 +721,25 @@ static struct rockchip_clk_branch rv1126_clk_branches[] __initdata = {
 			RV1126_CLKSEL_CON(72), 8, 1, MFLAGS, 0, 7, DFLAGS,
 			RV1126_CLKGATE_CON(11), 1, GFLAGS),
 
+	/* PD_VEPU */
+	COMPOSITE(ACLK_PDVEPU, "aclk_pdvepu", mux_cpll_hpll_gpll_p, 0,
+		  RV1126_CLKSEL_CON(40), 6, 2, MFLAGS, 0, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(12), 0, GFLAGS),
+	COMPOSITE_NOMUX(HCLK_PDVEPU, "hclk_pdvepu", "aclk_pdvepu", 0,
+			RV1126_CLKSEL_CON(41), 0, 5, DFLAGS,
+			RV1126_CLKGATE_CON(12), 2, GFLAGS),
+	GATE(ACLK_VENC, "aclk_venc", "aclk_pdvepu", 0,
+	     RV1126_CLKGATE_CON(12), 5, GFLAGS),
+	GATE(HCLK_VENC, "hclk_venc", "hclk_pdvepu", 0,
+	     RV1126_CLKGATE_CON(12), 6, GFLAGS),
+	COMPOSITE(CLK_VENC_CORE, "clk_venc_core", mux_cpll_gpll_hpll_p, 0,
+		  RV1126_CLKSEL_CON(40), 14, 2, MFLAGS, 8, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(12), 1, GFLAGS),
+	GATE(0, "aclk_pdvepu_niu", "aclk_pdvepu", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(12), 3, GFLAGS),
+	GATE(0, "hclk_pdvepu_niu", "hclk_pdvepu", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(12), 4, GFLAGS),
+
 	/*
 	 * Clock-Architecture Diagram 9
 	 */
-- 
2.56.0

