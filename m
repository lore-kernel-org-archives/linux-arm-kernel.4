Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B33606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HbqmWBFu;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pOnXL6HE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HrJaQ4IGLrTeqJ8I6ef+9LA4sxmOsqML/877ZscWApY=; b=HbqmWBFua2c0UQ
	UUinI2vEhOwAgHU/MUBU86Y+Eef1w4IkEXXG5gr02I9DwoZpyuyNuKlYDAM3W+iklMEv5MCdxMgmx
	eWVqyZJa5Fx99OPI8R5NtukGMCgMo7FVEz50Wcoq2DMk5GoG1VwR0bLQZANgOCJMuQwaQghsA74w0
	IEPz4TcIO2LAEpyqSOmj3M2UBXDOd+ed3B7NytL0H94J9jsigogC0nWVERzD+5IlXsGAiuPyILwfM
	c3KEpxzRDknQfwKyos7l8pZ3Yu7Dz9z43Uetsw2vVWc11lDnt03q0D5V5ZdMpMRe/a1JT7RBKOAWl
	h2+Q3Nr/Do/kiOK8TBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSI-0000000F7aX-1lX0;
	Fri, 27 Nov 2026 07:33:14 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSF-0000000F7YD-3B5J;
	Fri, 27 Nov 2026 07:33:13 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 111994C970;
	Fri, 27 Nov 2026 18:33:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrJaQ4IGLrTeqJ8I6ef+9LA4sxmOsqML/877ZscWApY=;
	b=pOnXL6HEVb1YWk1+ScGANAZ3AjUNnpSk/GVj54FmAG4l95a6pglNkG6dTFLokhXxqTRyDo
	tI32ohAUHF71QIASwej0tSDJyihhBW8osYU3jtbc7x60eBTb13Kmcn5bHjB1Ys09q31anq
	Mx7snKOAH2UCO4eI2ue2B/bmjaGnzdQrJwovX7olDGrK8VuuhoXNv55yVGtjYbxRMq8oIS
	QTrzhMSAGcQ8CS+RR/01z2CLVnbiH/olYzgiEn8hngepESaonfU0vKd8p2EgsV6RIeN3rJ
	MMVEArwH53X2rzr3sZOaFbJoDXAGmq4W1Y+ET3MBUn6FLrDel2rj/PIEv7omhQ==
X-GPT-Reason: This is a legitimate personal/professional communication.
	The email is a technical patch submission regarding a "clk: sunxi-ng" kernel
	update, which matches the sender's domain (alastair@d-silva.org)
	and the intended recipient's domain (alastair@d-silva.org), indicating
	a consistent identity. There are no phishing indicators, no URLs,
	no urgency/scare tactics, and the content is a standard, professional
	software development contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 04/11] clk: sunxi-ng: sun60i-a733: Add USB2 bus and sys clocks
Date: Fri, 27 Nov 2026 18:32:24 +1100
Message-ID: <20261127073231.1776847-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233311_970607_5CA0B28D 
X-CRM114-Status: UNSURE (   9.67  )
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

Implement CLK_BUS_USB2 and CLK_USB2_SYS gate clocks for the A733 USB 3.0
controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..ef22e82a4e05 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -1317,6 +1317,8 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb2_mf_clk, "usb2-mf", usb2_mf_utmi_paren
 				      BIT(31),	/* gate */
 				      0);
 
+static SUNXI_CCU_GATE_HWS(bus_usb2_clk, "bus-usb2", ahb_hws, 0x135c, BIT(0), 0);
+
 static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb2_u3_utmi_clk, "usb2-u3-utmi", usb2_mf_utmi_parents,
 				      0x1360,
 				      0, 5,	/* M */
@@ -1569,6 +1571,8 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(isp_clk, "isp", isp_parents, 0x1860,
 
 static SUNXI_CCU_GATE_DATA(res_dcap_24m_clk, "res-dcap-24m", hosc, 0x1a00, BIT(3), 0);
 
+static SUNXI_CCU_GATE_HWS(usb2_sys_clk, "usb2-sys", mbus_hws, 0x1b30, BIT(0), 0);
+
 static const struct clk_parent_data apb2jtag_parents[] = {
 	{ .hw = &sys_24M_clk.hw },
 	{ .fw_name = "losc" },
@@ -1855,6 +1859,8 @@ static struct ccu_common *sun60i_a733_ccu_clks[] = {
 	&usb2_mf_clk.common,
 	&usb2_u3_utmi_clk.common,
 	&usb2_u2_pipe_clk.common,
+	&bus_usb2_clk.common,
+	&usb2_sys_clk.common,
 	&pcie_aux_clk.common,
 	&pcie_axi_slv_clk.common,
 	&serdes_phy_clk.common,
@@ -2189,8 +2195,10 @@ static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
 		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
 		[CLK_FANOUT3]		= &fanout3_clk.common.hw,
+		[CLK_BUS_USB2]		= &bus_usb2_clk.common.hw,
+		[CLK_USB2_SYS]		= &usb2_sys_clk.common.hw,
 	},
-	.num	= CLK_FANOUT3 + 1,
+	.num	= CLK_USB2_SYS + 1,
 };
 
 static const struct ccu_reset_map sun60i_a733_ccu_resets[] = {
-- 
2.53.0


