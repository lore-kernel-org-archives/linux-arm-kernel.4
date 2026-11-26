Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cuxZNlwM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iJzVD90k;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtZpUJFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=; b=cuxZNlwMddXXGv
	PcFwx5sue3AmYVduHuZPh7VXP7UssX47qh/6lJFT0IqYr7iT5JvbGs5y8gq0SoX4L/gx/cBj+AwfR
	5OzbL0tH2fkbWcHZfNwAVbt9vsTaZfzpHOceWHNYBedu5Bu3kggcmaBphQ44I/Ycvrf3llweNcWK0
	fZjXmdRp9JW8JidOen1Xr6OdHPea+yhtBhZq4JnOHNjj8eMG6i8ihsle4d1B9FB80dpk+EtHgCbnG
	gCfAzbkhdwEYMPej7FE65hykGOTKdgavh9LoUf3w+LOurfNJm4R/FGywWVPJbh3q15LwFjuqXcwqw
	fUIwWVvDz2HE8maiexRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHG-0000000Ea6y-2Sl6;
	Thu, 26 Nov 2026 21:45:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhH7-0000000Ea2n-067G
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=; b=iJzVD90k+AjR585GhH9+xtBZ7F
	N/L7Cupx6T69nLAfdp1aWS92hQhpMR+kFS8Cb9GgJlLGbZj+wXveCc+OODAEwjJn7Fp3IQ44mHLY4
	Z0WDkqtopD5YHEWbhcdGqWwhgBLM+zZooWfWE87Yfvf+KX/rwBfL8Y3YLab6168l4fsED9v7pRVvD
	7mRuQhJWPhdACN5y+9iuZDErcKthDJ8kpala39Q7xqECEBFM2+y2xDlwQLX4siJy71uABHnH+gxYB
	ulvy05ZRB+/TwkcfDJ1cEnjno4bRUJ9GhUR0MOYwbR1u9IILGRbbnifH7UQJ2QyURb+tHf8d4JeGI
	ipl0M67g==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGp-0000000CvKj-2OiV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4677415f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729483; x=1796334283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=MtZpUJFMYM3dFaT/oDftJVTxRmnQymN2K9Sc2R4LXsbxIFDrnYS7Y/+o6qzgAt2f0J
         //brBv4E4CUH2DArGmXjDK8dvgHItrFLgYhb4Gh/XKCpxhLM9JDQiF6Zg+6oVL9KqOX9
         1hwx09YX8KbMfV2zYumR0aVUac6LubKAemFFfeWxBXr/H4W0pRIU1vk33jPFG1KtSYvK
         97RYMcjViOwHFGdg1OiterGzx4UfJ+peeAkGfbJZqe9YLB0p5wATV+ztSn3Y9bgNrpnl
         CGcTQ8rO0dZZZ7K3nfToU6P+0GxZzLZ2D/6pEoeIS+uSX2lTNsUEz+ck+z6Mw+OUwRon
         bJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729483; x=1796334283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=dhc4Mat8XgFmyDcsT1kpccTSt9yDmc8N/eH0JB+5SNzRyf5nCVcSLPLawnf3vQaATk
         M6gqJkxIVQpctVUeYXuMb0Zll/llxZgcgVuT3UHEZRFWdp/F7cNHX5hP6UNQwlEpnKfk
         9nWf5aRFQhMwqPawqDe7XtNH5QSqD2C6FmaRizc3dbGTaCPHI7usyvsiukxbzL5VJT7R
         4yIX1JcONq4zluWZZHtqbcv2Z5bTN9wFUcj0hYYqvp3+KxrIYBzXIRBWRIxDw9kLRbK6
         Kkl2B0uNSnXmY9bArB+o+RQTsoR/2OZTeA3r3NOAouYQHA5Xl0Lu6e2wFKVKXNPMZNtd
         Q5Zg==
X-Forwarded-Encrypted: i=1; AL+hErEpHpWrVkbkmI/mPaoyExYcyz5Hw2uin1YXRKZff9eyypOf3wfQx16GR8qNe1rR8aDncXkEvg6x0excjKS5nVsE@lists.infradead.org
X-Gm-Message-State: APuU4Z9i3DMtwYSY/Z3120ikjGqTkItPeF12jNVfm+macHo/ejPK1Djk
	JgGcjZhF47Vx/+nZckyBpnLNcm3hlrjGadPpw/BbuYsdpYkoBxw8/o3N
X-Gm-Gg: AZFdTZdDYVJ5BDcBQDYdZp5Xh+VeDIi8Drpd4eYDejZEC+qMtVXHBwzek2MI8CfetNa
	WCKWigjeruklcBrudz4TcnaDaxtSitNj2nOi9CBtEIkepeUwBidnQ1oTjOt7tOKoYmSwTuPMBXV
	4q0W8AoBElRidul9TaNao8F58RgHgCw2ouw5hDQixZR66vbEkie6acz0gYoTHZ+3yiN3CO00oP4
	di9tycB1vDbF3UWVr9wh8g45KRSXdgE3mD4wmyUfKqm7Vhb25qQHH1D5RiuGR8RCI2xxEXtqtBt
	bP8g/aqro7ODCKD7BXlLdQpGhiFzlC8IuhXt4AJag4EIzr34EFTBY0yF52JcLZIwAHZIzyCXKpy
	2EZvhxPJ1p7coph9KXYX2ZRMAz7eornRifa/TQsaQ2JvCE8WKGQ1dbcLLARZE6vGMr5i2khtkB/
	RvDaq5W/plv33D+7V9UfpMO66es1KcmS+adNTmsvmdautCqZEF7BlGfEi2gmUdzPRqJNste5y01
	819/Eewf6YsDIwqrIbKfjEBOJx5EKw9xiwLaoudMzsXCOnnEl/l9Fd2WyxN3OPgYciEGr9smFR/
	r5ucZUQVzYwWKtZaGhu6Bp/cRramphDFefxpYifiCIFAT5MFV+SOS4xutEO/8yTR8FAaAAWD5b5
	G4dg0JQX7acnNA09raLbT8ghiCc2e4jI9tHTpvH1siqtoPi7JDwDRkoOXsHCz2hnA09GZdWvEwC
	mz4J/72qedffxXAKmyFPVKH037OQdG3/NZ78jsouUV8ITjqpc5KJoWp+w+rTuNrIQ42HnxbFIPi
	q6Yc5DOl0krqa2fklptzovAL1jlbOf/KUfyAkpjmg==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr434400835e9.0.1795729483289;
        Thu, 26 Nov 2026 13:44:43 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] drm/sun4i: Add support for H616 TCON TOP
Date: Thu, 26 Nov 2026 22:44:25 +0100
Message-ID: <20261126214433.3562326-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214452_298622_973A7D80 
X-CRM114-Status: GOOD (  17.51  )
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

TCON TOP in H616 is similar to R40, with the exception of missing DSI
and a different position of the TCON TV1 clock gate, which sits right
after the TCON TV0 gate (bit 21 instead of bit 24).

Make the TCON TV1 gate position a quirk and add support for H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  3 ++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 86e1e8fed03a..5ea55a2844a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -18,6 +18,7 @@
 struct sun8i_tcon_top_quirks {
 	bool has_tcon_tv1;
 	bool has_dsi;
+	u8 tcon_tv1_gate;
 };
 
 static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
@@ -246,7 +247,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		clk_data->hws[CLK_TCON_TOP_TV1] =
 			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_TV1_GATE, i++);
+						     quirks->tcon_tv1_gate, i++);
 
 	if (quirks->has_dsi)
 		clk_data->hws[CLK_TCON_TOP_DSI] =
@@ -314,6 +315,7 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
+	.tcon_tv1_gate	= TCON_TOP_R40_TCON_TV1_GATE,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
@@ -324,6 +326,11 @@ static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	/* Nothing special */
 };
 
+static const struct sun8i_tcon_top_quirks sun50i_h616_tcon_top_quirks = {
+	.has_tcon_tv1	= true,
+	.tcon_tv1_gate	= TCON_TOP_H616_TCON_TV1_GATE,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */
 const struct of_device_id sun8i_tcon_top_of_table[] = {
 	{
@@ -338,6 +345,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-tcon-top",
+		.data = &sun50i_h616_tcon_top_quirks
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_tcon_top_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 2b887470a49f..e775737e69ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -21,7 +21,8 @@
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
-#define TCON_TOP_TCON_TV1_GATE			24
+#define TCON_TOP_R40_TCON_TV1_GATE		24
+#define TCON_TOP_H616_TCON_TV1_GATE		21
 #define TCON_TOP_TCON_TV0_GATE			20
 #define TCON_TOP_TCON_DSI_GATE			16
 
-- 
2.43.0


