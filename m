Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D9606A689
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjqHYg5h;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StDIdhSu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mj9v3GOHXJKCef8hiMsVWQMXbcKUeIq3msDs56h6kEw=; b=UjqHYg5h1clCCP
	pHshu/Z7gJJ1YqidD7LW8E09uGZQHve/9ssCcFAbdg+VS3vzbt/MC5EnaEITF9YF5hHc4/FLfAyrJ
	1yXnR7aWvLJDxl887IErxaOTfNlZHxCrb37YDxDfK4MqppexHu6D+mO0A3GOveFi/mF2BT9D3uUEl
	r3Eq+uQcr2AImVoa3fZAqiLyZQLBOHcwuWGf5lJ1E/LeZXpbW5QAKW4rEwVMZqaLa2veFXS0UOV2h
	9U1h2bpnlfhgHFPRSRfJ12ExAVNX08yNFKCCnc7xvQI2lc6gMJuyZTYB1ZpzrU4We71Zoc5xySwxF
	PdldFRcyT1s2XhUyu37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXE5-00000004FMj-1RvO;
	Mon, 23 Nov 2026 16:49:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXDp-00000004FHZ-1YhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E62243814;
	Mon, 23 Nov 2026 16:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3491F000D3;
	Mon, 23 Nov 2026 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452532;
	bh=mj9v3GOHXJKCef8hiMsVWQMXbcKUeIq3msDs56h6kEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=StDIdhSulwz6Nl9Q+XH4BeslhAsg/Ce+YaNEbWL/d5RRhcOSjlFB0uOXUJO/UctIh
	 K4B/1G/rQGt/muE80bXhwsNAnbfimhk6iqwgE4Xub1Zz2yrrsc1U+3WlNDN57p5TeN
	 zg++LoQCvdK+7irRuiyH+0nXXNI/qxLaZXsJiWwyBv99EEAHFSWeq4sGy0tpjOZW3a
	 7wa6mGkxB2Pl1VpIKwCXj/3Ckagm38Lu/rFbUFeHVf73fqGTjL/iSSIgkbCeysGAp8
	 usBJYusSPNAf2/7HwdlEn3k/CzaENf632KrrqrdSFysJNVeTwdW3TYLAhlG1fRlbCU
	 6I0mR7dNjFNLA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 01/10] clk: imx: imx8qxp-lpcg: Prevent stack overflow when parsing clocks
Date: Mon, 23 Nov 2026 16:47:34 +0000
Message-ID: <20261123164834.3330320-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

imx_lpcg_parse_clks_from_dt() allocates output_names, parent_names, and
bit_offset on the stack with IMX_LPCG_MAX_CLKS (8) entries each to match
the hardware limit of eight clock outputs per LPCG block.  However, it
only checks whether of_property_count_u32_elems() returns a negative
error code and enforces no upper bound on count.

If a Device Tree node specifies more than IMX_LPCG_MAX_CLKS entries in
clock-indices, subsequent calls to of_property_read_u32_array(),
of_clk_parent_fill(), and of_property_read_string_array() write past the
end of these stack buffers.  Reject counts exceeding IMX_LPCG_MAX_CLKS.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Closes: https://sashiko.dev/#/bug/linux-22dfac78-f44b-42f8-985a-995308723fc4
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 9ad016106b1e..5eb4bdbaf7d8 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -199,6 +199,10 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to count clocks\n");
 		return -EINVAL;
 	}
+	if (count > IMX_LPCG_MAX_CLKS) {
+		dev_err(&pdev->dev, "too many clocks: %d\n", count);
+		return -EINVAL;
+	}
 
 	/*
 	 * A trick here is that we set the num of clks to the MAX instead
-- 
2.56.1.750.gf70dc682cf-goog


