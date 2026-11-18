Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF760A2621
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhx/t2Az;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=prZzb8XM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2QkUzJRe8ww4UhAZVZ0N75Y2fS2ppLIbZH0pa1w2a0I=; b=nhx/t2AzwtxzpS
	iPZjcucZ3PIWTJK/QdiKhc/Dm9vhESWECuNnIDcJW+/glygR4yxC0aGjv8p47qI7NdzleFbZ2qBtO
	CzBrOCkYP9cMwN3ILZNFX6QHiSfRp3E9cQJ7sw+k4wS+5Tbl6wnYMsfh6kCbgoImQ1igU/7OhzF13
	Ml7mGeFEmbC4HhnnmrSFwaafL2XcqVU3uZkZviQKZmU5ME61qaZhr0MIiT0q0utYPXAbauBG2flpV
	xnKaz0BC7YU7eGCRFkiYNxyzG5k8xq0rNJw98p4rKs/o3Up9hyLp5CmqlVP07fI3WFoRhVdUeDO1B
	F3Z0Vl8Rw20pGqjksjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj76-00000009h5q-0JID;
	Wed, 18 Nov 2026 17:06:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj71-00000009h3G-3iMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:06:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67AD64E41636;
	Wed, 18 Nov 2026 17:06:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F5E45FE9B;
	Wed, 18 Nov 2026 17:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 569DE11BC1F23;
	Wed, 18 Nov 2026 18:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2QkUzJRe8ww4UhAZVZ0N75Y2fS2ppLIbZH0pa1w2a0I=;
	b=prZzb8XMu7pxAhm4IwUFoJIAjQo70p+pbzyqMlAfWcTqyacXCRdCAOiG7CvIW3+Rfko3m0
	HIvf8ZOCo2gKdUlPN/dgzD8LPDGm/RmPqm+YQx6gNt6Lrue+6kkpT8dEc93SmPRK20m+JP
	YsLP8OjPnSsxJCl4EF8yktJre984/V8x7jZGgZATS0esHWmctgQQtilL4yXGnM9ga0LZfL
	Ynw5k1Afr6Kkg8uQsCdZfdBsMUeKL5y+Cqt9eWZY1nQnM6AWauGKcn2LusOs34+3WanbBj
	8IkmXxYuypn6mge8HY567YgRXhDfwTRKRCcpSQBy6akD1pR4mEZ6eal/QsazgA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:13 +0100
Subject: [PATCH v12 04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-4-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090624_239892_1789C409 
X-CRM114-Status: GOOD (  17.72  )
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

HXT and LXT are crystal oscillator inputs of the clock controller. As
such, they are external clock sources which should not be registered by
this driver.

HXT is already described in the DT, but is not named. In order to point
to this parent from its direct child which is HXT_GATE, we must provide
a fw_name (when it is named, new DTs) and a .name (for when it's not
named, but the fixed clock node name is used).

LXT is missing in old DTs, so we must create that clock and register it
for backward compatibility reasons. It should however be described and
pointed at in updated DTs.

Both HXT and LXT are exposed by this driver only in the backward
compatibility case. Otherwise, both clocks are expected to be retrieved
from the DT.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 44 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ba12d4068e83..4019df22a74e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -65,6 +65,14 @@ static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define MA35D1_MUX_MAX_PARENTS	10
 
+static const struct clk_parent_data hxtg_parent_data[] = {
+	{ .fw_name = "hxt", .name = "clk_hxt" },
+};
+
+static const struct clk_parent_data lxtg_parent_data[] = {
+	{ .fw_name = "lxt", .name = "lxt" },
+};
+
 /* Mux parent selection, by index into the controller's clock table */
 static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
 static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
@@ -191,6 +199,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
 				    reg, shift, 0, &ma35d1_lock);
 }
 
+static struct clk_hw *ma35d1_clk_gate_parent_data(struct device *dev, const char *name,
+						  const struct clk_parent_data *parent_data,
+						  void __iomem *reg, u8 shift)
+{
+	return devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
+						     CLK_SET_RATE_PARENT,
+						     reg, shift, 0, &ma35d1_lock);
+}
+
 static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
 {
 	const char *of_str;
@@ -219,7 +236,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	static struct clk_hw **hws;
 	static struct clk_hw_onecell_data *ma35d1_hw_data;
 	u32 pllmode[PLL_MAX_NUM];
-	int ret;
+	int ret, num_clks;
 
 	ma35d1_hw_data = devm_kzalloc_flex(dev, *ma35d1_hw_data, hws,
 					   MA35D1_CLK_COUNT);
@@ -239,12 +256,25 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
-					clk_base + REG_CLK_PWRCTL, 0);
-	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
-	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
-					clk_base + REG_CLK_PWRCTL, 1);
+	num_clks = of_clk_get_parent_count(clk_node);
+	if (num_clks < 1 || num_clks > 2)
+		return -EINVAL;
+
+	/*
+	 * Old DTs do not describe the low-speed crystal. They may also expect
+	 * an HXT output from this driver. In practice, nobody should use these
+	 * clocks directly, but they must be kept for backward compatility
+	 * purposes.
+	 */
+	if (num_clks == 1) {
+		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
+		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+	}
+
+	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
+						    clk_base + REG_CLK_PWRCTL, 0);
+	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
+						    clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);

-- 
2.56.0


