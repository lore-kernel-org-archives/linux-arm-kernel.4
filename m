Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25750606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPvYLh4z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8vzTWeb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=; b=tPvYLh4zzEl+C0
	+hojxTXqlMKAVisDaVFDxc1qPzRvZPYOuIWWKfps15RjadKeBk9ucJ9t5/eVsdnvHAYhsgh6Y4ex5
	LJbtKiWXLJE8kmshQKzUolj1FPQyJqrasU/LQoNvUTeLzBARZnw0IqdHK8PTyGWUF68k/6IhTI/N7
	q5Qi7EbOYAj9qTD1XluyI+5WWJaIfn9JOr3FXfq1xM2KbjH0jrCbLC5TR3xTD9nc2zWti+i39F/Lj
	ZQ8O+wFVgrb/sshBPGA0UCOUy1KrPOnY9W/fEEzDUhe4loKckkNjrF6m5yXrfeCqEcsmAqW8be6Ce
	8l+yqLUn3bsq7DNbe0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSe-0000000H6dq-3Cvi;
	Sun, 15 Nov 2026 06:11:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSV-0000000H6as-477v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18552705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723082; x=1795327882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=A8vzTWebNzlzHMJZ4OTIEIjb9ewUI5m0oIKnVFxR4F+Fal9CN77TunkC9GYhFuHiOw
         5J4fhlHMDYGGh993NauYOk/VNfqGgj9fYkxaAET+sF2GulxS88unjUy93TBDAzw+LJmn
         TseNSyOePhr5tYa6wupPcTOkNwCGbMtXH4Tsc2JqxJVLuiaJo2AJv/vWm2z/sr0mhakb
         fbCvioIHwHGoZLmN+Vlcmoh/H6S0dXkPgGfGirlhfWu1iE8LVYBUqW68r0moxAS94MON
         zfolmdC9YOKj9slcsvGgrYZEa4iuwROlS+yhQ0/QZ3SK8MidXSt77gLyiGvzkVyMiqBc
         X+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723082; x=1795327882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=rvmv4C+O5RkrANEunWHJ+gT6/aVlKJ2Anfl2CSDKY87EM0qVuKMWFSy56xEiP8Ln/9
         wp7eh3XFnB6rbJJr8Q1BTVOXqIC9TLil4ZhnFudQzcgZ7rSj8/CVpchL6iFPNGL4cRDe
         CI8rVDKRaGxYbuKOhYIkJ69dL73C8qYuqzXdVwhBX/3RImP7GVWBIN16fNqVIe6cz+zF
         +vHyV8CLlAJ5Qv4ongS570MduQ/mcWqx65acfXei7qi6gSfHP5wqeejF5pPOtEFsXwFK
         jtePRIY7jS/2jyr7ND3tIfyPHSgjJtFgbRHosUGy57hWvaQseuGhjAmXR1va17T49D+m
         J/6g==
X-Forwarded-Encrypted: i=1; AL+hErH3C4C28tOFHN5z/ZMG0JxY6YYseLZNlsgRzs3WweBlFP/bOJrTpFi1OBhZO2hK+SZlCIIEIUbPZVE2J+qf9Euo@lists.infradead.org
X-Gm-Message-State: APuU4Z8peumwiwkna3E1KUaAVx3j8YcZvEqlbuP7LJDGKnF88uTlebl9
	Gn/oZHiuI7aid/66+X9xLyjjyUbabjgr5LtyYZa4lJVgj6mdp9Rl5Kyo
X-Gm-Gg: AYBFou2TEuaPMEgyqqhoTjPni6IqXxvFw+iEbcMw9uBLbnE8Q8AmmKb7+ocMDQ4hSHK
	8E7+VxAKy7pnm1I2wPkLuSAglNvodRczamS5aVHSM+AxjmLlB0Dc21qgXjQ9VXyxhCETPB3ocib
	ixUmdH++ylot0mRSByKXDTTVOne1KV06l+z1Fn9LjabnTxfEuVRdcw0pa0NT0n2i4maolE5bb+L
	6y+fZ2M/owBbi39hTejb5FVbZ9s11us+xH5ThBNYoq5bJy9p856MfTjPOt9Vk5zlHBB28ahLHzo
	iu0XKtNUOc18T99jD3yAw4UgtVsjggujH1+CHKCu2+sIu0A24CUU01laBgS8q5qKUciNouznLfq
	hr5zTiEs1UiQgS/nnI0KGYok3B1SeCCe893Bf/C5DCGxupID+hgkcOI7d+7Dh3FQ6F8/QMqEsu7
	V2JW+4sU467VvZ8IQlwXfFVIXBX6YD1yvB116F8xzwOdT1QADT9FLXAq+VVJiGBvD3zdSS9ON9m
	9gy2a1W8YwlWPItRdAEUk0S3LFYPKMq6G1rUhHcgP8Dx7fuhIYG7USGj/rCAKSuB5ocQ4Mk29gS
	LqP4XtOFp5MDCQ2oSWsGFHiuw1zEGv+K9YBuq8sDksDOYX/hf9j1+w3MjYWrP5WB2xD2Mwt6Bw4
	TIPMcbySJOAwdX0bGdXg9aEO9RhuMascTU23V2iD7NuN6+e4WyBkUBxduYqjrZKhiN/da5jFQMt
	+u1/MJrjbgu9oIN3v+vZmL64MDbQ0PExNp5tv68QC4aAJzO6QNiPKW740q9wZgSnoqCYGg16Ggd
	rTipUzzH9yCbfeDShndzn9S/LjvXIELkhw=
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr152010325e9.22.1794723081993;
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 15 Nov 2026 07:10:55 +0100
Message-ID: <20261115061102.229680-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221124_047240_882D008E 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Note that DE 3.3 actually has only one bus clock, which is shared among
all cores, even though it is named BUS_MIXER0.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.43.0


