Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95451606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v3hyWvtY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZgRN7ONk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=; b=v3hyWvtY5966c8
	uEVnpp/NeUWCAalI5/idiZsSzXtSuO5Au0orqwak5xmQcLeq+zRbe0mDQVbNn9TitW5tGabcTX0QQ
	3RPIFV5mD2h3g7i22oDED4QOhcAjLYfdmeCB+9AHo6Nqv0CVTtm+Fz9Ax9zB+vUywHyA/tjkkRA/C
	atKPBPdFOaKWl3kyIG7vbS1aZVLIRPfEnn788Q9Ai3BvofrNQhQjGowfYiU3oTaNYIV4f4S5zhlyz
	7afilAYXFTzwASjBGcqRXILQ9nh1ttyljmZNUrAxrmacXNtfxMvX+be7i0rCuYqlBOTbGmFSwhRXz
	+YPvCUjVbwztOVGVxg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhIS-0000000EapP-39zF;
	Thu, 26 Nov 2026 21:46:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGu-0000000EZzJ-1phn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso58416885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729491; x=1796334291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=ZgRN7ONkZngxAIFL568EPkPReclv+mHVGq9JCxc18UGWp8+sbKoUJu1gYOhRj/3fL8
         El3OKuTCj2CbgU91DCHgIbeUOIFhDekEYb2Ua52WOMX38R5TU6FVNgLTFpb63nkGxaGX
         S1iMxBpHsTfbvwHJNy5/hLhewsznycPOabCEHnDWAE3tiwk2jaaqjVN6Hz0dWroci8iF
         hqnPcSz3hssh6ogKbMbt+KzD7DupjsaMys9wkGhPnTWpDdncNzkQChl3Hd5ScvUbPZji
         6efTtLD1EmAlJ8OoM8cMvfzsXtjngoHr5LEy7klVnOt2wPZ6Dvqs5Nm3A2nR28pAlWUb
         /uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729491; x=1796334291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=LBofvl6L7LJl156IHdvvrDuHJ5eWdSVGbvjSGA640m65D2ER6cDiN1g657ac8+gMjw
         qarIq1BvQkWIwQzVHjNSD10o90tUU/ws2rCf5L/RCnzXVyoZnJyhBEaORqghgNrjwJYp
         vFfknS8/nUug2t3dFVMcw5P5Il5rUvfz/btaDotoRSCx4mWFuERNt8lXaqos15Ln2O0h
         XOQYlvdCtCvwVCBaR0Sp4lFGEapKtZpj1yALlIVVaucp6oJluBhMC3IgJQfKd798czvk
         8+2CJlXSm90l5Rf+8nXdlbbe6TqbfRk0vFwPxNFu3+z71SmPWlCHVthmkpoMBVKzuhZn
         +3uA==
X-Forwarded-Encrypted: i=1; AL+hErE8Oe2i9MWkC1mJnVI8tWxlNb3x8Npyn4IKqEOcjKCqNHyH3SmznBCgdUVPETBbU+HdioczwlcbDfSPSstZA+S6@lists.infradead.org
X-Gm-Message-State: APuU4Z+nL2aComqrTsh+7wjBExQrNimX43fDAupIZNtmWXa8mJ5ha1fj
	UEWL/QBM/UMCuSSst0L55aG6dPe0eL22Gb9QQrsKHTYQvnM06c/U5ILA
X-Gm-Gg: AZFdTZcdUar2krzq2q3xtzjOcJse4yBKsq9NcWtKSVCiXM39tRS90Bv8cGRJ16pUslM
	fAz02M8rmLMWRd0NlTgJcYE2sZ6SB+wA0g9DH+e2jctAs/GlUJG4zZDK9ZD5AIpX6sKILmxnIT9
	/x3Ks2J+o9hfVTcpMqYne8Xs5cJuQEd5eekZKwuLhSROhhbqLYVnhHkqbeqWYyq8oS3iNHmpqvQ
	AdcYfqFkvZZy/a57eieDIRJoJdHtBNHPdReusy2J49z+yT3pFtOMEqf+rQIZ6k8pWva0JFFuFW5
	hFbS1Kk4FjTOwhp/nCpyM+AaErLPq9gEhhggfiNyKldcGv0wM76+o9uMLavyRHJHtFXG5M2gdH5
	hIDNfNh3mqtOB2NX1A/X/QFJ+7DQPNS4udTF7luEtaUw3p1s8vdWCJTZYxKuEGiELPq1aXwtJQX
	NNfVPbzeXN0jq3yxCG86iyfHpPZzxArJqwvV58j/MDl2hBLo1IV2pUOq3vY1RlVD6lTp9KNCwW4
	OGRlSGaT7Z7Qrnun/hvZcXx1gZeVzhvsj3yCJYqPTJibZ9KajuWl3AlVVW/UKuwJ4409TAP4oIw
	z3iPv8Je/Oag14V2aeQbcuugT8ccRe81RxOvM2HkpH7XJVS3wJhDEA+SVZm9VJQwt9bK+mREK3o
	Hq0bSZjVXx4jCaSPXNwz7n8TPf2Gc4KfqLsOpvN14ZBlV5iIfBzee7+fzMm7uxQBZrEIHOFsWOs
	Pt+HIJ5JJLxipTLS70EbIWlKE5ZAybXU8k9R7FewXOnIhhy72dYzmPhBvQQGc+JeD1JON9woe2j
	mBvY8lmR2rTsreHRMpvoaB68mPNn9+WPFi6DZRc5Q==
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr445462945e9.17.1795729490644;
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
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
Subject: [PATCH 08/11] drm/sun4i: Add support for H616 HDMI PHY
Date: Thu, 26 Nov 2026 22:44:30 +0100
Message-ID: <20261126214433.3562326-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_134452_521053_BA4989CF 
X-CRM114-Status: GOOD (  14.14  )
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

H616 HDMI PHY is a standard Synopsys HDMI 2.0 TX PHY, like on H6, but it
needs its own configuration table. Values are taken from the BSP.

The BSP also sets undocumented bit 15 of MSM_CTRL at 594 MHz. 4K@60 works
fine without it, same as on H6, so it's left out.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 170 +++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 0d284804e11f..8bef4806c65b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -124,6 +124,165 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
+/*
+ * Values are from the BSP. Like on H6, PLL settings depend on the TMDS clock
+ * band. The BSP has its own values for CEA clocks, which also apply to
+ * their 1000/1001 variants. PLLGMPCTRL is always 3.
+ */
+static const struct dw_hdmi_mpll_config sun50i_h616_mpll_cfg[] = {
+	{
+		30666000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40f3, 0x0003 },
+		},
+	},
+	{
+		36800000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		46000000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		61333000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		73600000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		92000000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		122666000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		147200000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		184000000, {
+			{ 0x0051, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		226666000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		272000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		340000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		593400000, {
+			{ 0x1a40, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		594000000, {
+			{ 0x1a7c, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		~0UL, {
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+		},
+	}
+};
+
+static const struct dw_hdmi_curr_ctrl sun50i_h616_cur_ctr[] = {
+	/* pixelclk    bpp8    bpp10   bpp12 */
+	{ 26995000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 27032000,  { 0x0012, 0x0000, 0x0000 }, },
+	{ 30666000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 36800000,  { 0x0000, 0x0000, 0x0008 }, },
+	{ 46000000,  { 0x0000, 0x0008, 0x0008 }, },
+	{ 61333000,  { 0x0008, 0x0008, 0x0008 }, },
+	{ 73600000,  { 0x0008, 0x0008, 0x001b }, },
+	{ 74175000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 74250000,  { 0x0013, 0x0013, 0x0013 }, },
+	{ 92000000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 122666000, { 0x001b, 0x001a, 0x001b }, },
+	{ 147200000, { 0x001b, 0x001a, 0x0034 }, },
+	{ 148350000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 148500000, { 0x0019, 0x0019, 0x0019 }, },
+	{ 184000000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 226666000, { 0x0036, 0x0033, 0x0034 }, },
+	{ 272000000, { 0x0036, 0x0033, 0x001b }, },
+	{ 296700000, { 0x0036, 0x001b, 0x001b }, },
+	{ 297000000, { 0x0019, 0x001b, 0x0019 }, },
+	{ 340000000, { 0x0036, 0x001b, 0x001b }, },
+	{ 593400000, { 0x003f, 0x001b, 0x001b }, },
+	{ 594000000, { 0x0010, 0x001b, 0x001b }, },
+	{ ~0UL,       { 0x0000, 0x0000, 0x0000 }, }
+};
+
+static const struct dw_hdmi_phy_config sun50i_h616_phy_config[] = {
+	/*pixelclk   symbol   term   vlev*/
+	{ 26995000,  0x8009, 0x0004, 0x0232 },
+	{ 27032000,  0x8009, 0x0007, 0x02b0 },
+	{ 74175000,  0x8009, 0x0004, 0x0232 },
+	{ 74250000,  0x8019, 0x0004, 0x0290 },
+	{ 148250000, 0x8009, 0x0004, 0x0232 },
+	{ 148350000, 0x8009, 0x0004, 0x0230 },
+	{ 148500000, 0x8019, 0x0004, 0x0290 },
+	{ 218250000, 0x8009, 0x0004, 0x0230 },
+	{ 288000000, 0x8009, 0x0004, 0x0273 },
+	{ 296700000, 0x8029, 0x0004, 0x0273 },
+	{ 297000000, 0x8039, 0x0004, 0x022b },
+	{ 340000000, 0x8029, 0x0004, 0x0273 },
+	{ 593400000, 0x8039, 0x0004, 0x014a },
+	{ 594000000, 0x8029, 0x0000, 0x008a },
+	{ ~0UL,      0x0000, 0x0000, 0x0000 }
+};
+
 static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
 					const struct drm_display_mode *mode)
 {
@@ -626,6 +785,13 @@ static const struct sun8i_hdmi_phy_variant sun50i_h6_hdmi_phy = {
 	.phy_init = &sun50i_hdmi_phy_init_h6,
 };
 
+static const struct sun8i_hdmi_phy_variant sun50i_h616_hdmi_phy = {
+	.cur_ctr  = sun50i_h616_cur_ctr,
+	.mpll_cfg = sun50i_h616_mpll_cfg,
+	.phy_cfg  = sun50i_h616_phy_config,
+	.phy_init = &sun50i_hdmi_phy_init_h6,
+};
+
 static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-hdmi-phy",
@@ -647,6 +813,10 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-hdmi-phy",
 		.data = &sun50i_h6_hdmi_phy,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-hdmi-phy",
+		.data = &sun50i_h616_hdmi_phy,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.43.0


