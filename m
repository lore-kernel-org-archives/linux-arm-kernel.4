Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+TGjOwG;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=a2sR3URN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4IV3yRHhQQZGklGZH5PN/o6RqZMOoboQKYnTyajhFCc=; b=G+TGjOwGiBNSOi
	Ddvwy+SlvpRkkHlsT7lpj/NneHcpkLL7Wk6TIrHjk4ltJ4d2igZ6zeygR9cic0DWuHsduBcxvYZN7
	G0GOzQscmoujRRP7Ouh74g0chgKnkd8T+tu1zE2hwFu7/YU9v+QpL37pbbj6mELhvLNJZtpw8/1DK
	yjl6SHHHpKc0qe0mwuWbB2KTq/kCvshCjMvy0PRwOwaW7nPoRO4vxCkPjC6yUUN/rZDAbdtbldxrY
	bZ1Z+kPLhD5nDW5gnD55FKyR2UKYzn0aMLj0FBRhcQ/UVULQeLJ9KSqEFeUoXEtOIYhvs3R4UImvg
	0EtN7x1GWCDPTU7+W/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWst4-0000000FWG8-0ITK;
	Fri, 27 Nov 2026 10:09:02 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssg-0000000FW15-02Wq;
	Fri, 27 Nov 2026 10:08:40 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2E3E04C989;
	Fri, 27 Nov 2026 21:08:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IV3yRHhQQZGklGZH5PN/o6RqZMOoboQKYnTyajhFCc=;
	b=a2sR3URNNvwmqriKJQLlHQsXDuT/MNX4DpVkNpGoiJp6Hr2aKNmtCz0hVJbcUkMSbwuhkv
	r7k849qq2iVbWCiWjKT4+ai2IKp2P3Ltf1wu86KzsZ+1cJq9BUthaiqgErQzFdpw4aBxk0
	MezMGMJYpOTbXbe96qpzdTTfHT1quXR6+SIjpqyvJefGLk8Is/UhJb5By36C2iVfkTbYw4
	7X8wQtWrEoq1F49cBI6zwfcJNTKEYXB/zyPzpz6hdZiA71KYgp20qu0dYsaUm6wCgy3SNT
	SJZAcZGswnTQTroGbFq9UCBKqF9NbTYaJp5dh8wniNpz2e7lIxJPeINr+qs73Q==
X-GPT-Reason: legitimate_personal_technical_communication. The
	content is a technical kernel patch description related to hardware
	clock gating, which perfectly aligns with the sender's identity
	(Alastair D'Silva) and the recipient's domain (d-silva.org). No
	indicators of spam, phishing, or marketing were found, as the From/Return-Path
	domains match, no URLs are present, and the subject line follows
	standard open-source development practices.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/6] clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as critical
Date: Fri, 27 Nov 2026 21:08:05 +1100
Message-ID: <20261127100808.2292229-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020838_208649_B68C3683 
X-CRM114-Status: UNSURE (   8.49  )
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

The mbus-msi-lite2 clock gates the shared MSI-Lite2 DMA fabric used by the
USB controllers. Without CLK_IS_CRITICAL, clk_disable_unused() gates it off
and breaks USB 2.0 host DMA transfers.

Mark mbus-msi-lite2 as CLK_IS_CRITICAL, matching mbus-store in this driver.

Fixes: ed757071ac3d ("clk: sunxi-ng: a733: Add bus clock gates")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..fb4ca4ef3992 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -605,8 +605,9 @@ static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
 			  0x5e0, BIT(30), CLK_IS_CRITICAL);
 static const struct clk_hw *mbus_store_hws[] = { &mbus_store_clk.common.hw };
 
+/* Keep enabled for the MSI-Lite2 DMA fabric shared by USB controllers. */
 static SUNXI_CCU_GATE_HWS(mbus_msi_lite2_clk, "mbus-msi-lite2", mbus_hws,
-			  0x5e0, BIT(31), 0);
+			  0x5e0, BIT(31), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma0_clk, "mbus-dma0", mbus_hws,
 			  0x5e4, BIT(0), 0);
-- 
2.53.0


