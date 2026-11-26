Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dgSPbuBs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OSlhWkpy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYeBDAtU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=; b=dgSPbuBsWaryAx
	uZ5jlsTRQBAn+g6YS1WdbIfwTCCOdlMrGMFqjmrThp9LXQI66JLRF2HsZTV6W9BWPTZlWOItcPIoC
	grcpZ8rF8BoPNBwf7L4gtFyRqRdK1g2Ari+RWTEHRWfspOv2nh9+K8ZdXMn4dNTag/jvP3rn17dsj
	kUi+oR5A1OEnNJn9n7CcfthuWEbnB+M+yssktrbiLYvossEC46h2H0JOhTa+oU5/qUHo3bapNrucm
	eu95i5Gc1F4Hrify1MXFHwVE9+caqpzHO/pwAV0W1uYm6mzIoJa0Aod6e9ygp+4v9cGCTONILrE0O
	PHszCMDSdND3KPeUUZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHH-0000000Ea8u-2CPc;
	Thu, 26 Nov 2026 21:45:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHF-0000000Ea5t-3oC6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=; b=OSlhWkpyEWZsKXxCdvRFYacAM4
	Hss64FX3Ht7UWYaKqMoOKZSlERiMJs/NupIUwMAceXL/ZpQXhvVBxKZPVyqhJDE9q3J2Usw9UXbUq
	4oLgWV3R9r8kaT/JpjI/UvfeTuskbDoK25VE2DaQMztxreweQboZPl+RSQjsBKDlPiWRqoExs7MfO
	DHyuv6qy8YryC+mHqlqQb/hggoV9vH44QSWh8bI499eOI/utbs6LMmhQe2TRaFDLZev3H4lRpZbT7
	4+VuicwOiziAclRkBf4jSGuDrklOUxu4V/6i36YmMkPVrb61/Y4cUDSo1wuXPk2UVVonLdUXDSPC7
	sVsxGrJw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGt-0000000CvPA-0yMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a9be758734so4741000f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729489; x=1796334289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=hYeBDAtUYWwBz1c6zDXv5lbbI//ApWVx/76WB2hZ8oII1k+BRCPb8IQi56o0RXf9tO
         0KR2JRQB9Bg7o/3azeRlK+WgfdQf+nu4iOfQrj38AjCfwnfJUp5qSZIV7zHBum7aOcq/
         qtiWMIBZOQ2Jvf0rWePbJZUcCCRD2f902aYFlomQdzvcpC0eZEXFfj56YS5+O+wTHncX
         2SvCnmiXKEPnSVntoQfgGnyysMvUGK19fbcHUdxSR9mnX7QMJEyzJ/0I3A6QYTSZtTa6
         yrDzEEHM7PdCT7bLPQ7Pc/Lu1VgIfKi1GzQc2ahsuQVjDlQ/5iyX4/K9LBaEqetXQXtX
         OXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729489; x=1796334289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=d/red9j0f182yCnv54WIacBWKye9xJKm7t7B/Hav3yb4X5tVTPQOctRP0AaROppMJv
         ryJwHhxL5GYsb943HakzMDxxqI+kiocZybpWDDjbcV589p6wchNVbcY/m4vfzx30rJkW
         iu4DieKXtUfhirlFNacI8CHUDG1iqkxpGDIlvZjYemXgVJp3kLltUglL0JSJMOI0RPFP
         uTT8n/X42m/cSAV8uEdWKQBmoaHeyDg/wqNPARCync+D/8jvuoy0jvxdg8FDraiwRqfQ
         f1yaeeczn3TtNoWB/AUu5EMzRi1HWOMRbaORIWCTKmf0OdPHluj5G1iynHJ6J754F7P3
         5JQg==
X-Forwarded-Encrypted: i=1; AL+hErGWlOCOUmcFLqymWWQ7Dgw4eMvMlAIRcMTULrKpy1Vv2v+HwV6im+8AOAtUJBA+AUTHNXosRsqPPZsTOqYvrRbb@lists.infradead.org
X-Gm-Message-State: APuU4Z/KCfRdfnrkWhEvolk0eWZEYd4h8CTvDwquCin9PIaCIJJDonwi
	6ObZ21P0neFn42CS51UjEvN7SSZh4OQe/mIybkGslkTNZi08qyfL0krq
X-Gm-Gg: AZFdTZeJgH0v7J34fjuFv6vQkAY+ct6BSG9/oQkxaAOOa3ZMat3qVej+vXIuyp9vTRL
	D/+kwwowmQcGPwD7Hv8ZEnxOjHVPskNCfAbJQSqAdhoXTU/6a2Tc6+poSzWVqH/kFasL7Nb39f7
	CuGIXgS8LWZqcJ48//ynU6s6nqHs5oyYQd/MNYSWXSVW37kT+DfEIWBr9zyvMOj6MeF0n6phkyK
	WSpTLXUb9UCQzy2gMYBYOc83bQuV/j6XKUyISTEbAlxsJ5+ZbveqVVcJhNOTpE7FpDbd1pOaghS
	EvnxXmsLaLAId1BWrzPVA4LLJ+jS1sCINKbFf0kCmi1wGgEjzjRkXTdxLG+ud5LoQZL+5BjZXZb
	Sz7i5hVbVawYDwL9R5bcDH7JN+cP4Fjk/aj/QyOvDXwnM1GznWjRi1OdN47bLmwvWkZvoVjqpGY
	pfPPdkj+ItS6qK+KxDewE6rJkHkxCXfmYpJscC2sox/6dX9PbNWeWtHm8Wxz8FkzoDCDcySowyc
	mm2akUm14MOnsPOiuCAql1vqNL56JycGmniQD1UCmlqnpaPH/Ok1atJyINfr3kG7gOEPeTL7SjK
	bMrI26F6Xe7gOb/6Fy1CuNrkbarq1HgleRk+RsHrqZwvhb0i2nSatx6UVrh7VD3/B4kfPQJ/5Hz
	PRcPwpz5jGZ1wCz3TkGcMfHOYZebiJ7QH2qG9lQlscJdtpfBABZDA7yRfAwWGSL/J1aqg0/MowH
	ctboG7cLfm6RqcZqMHPFwWW6pF200y+jbZutVRgrXF7QCLugpJCrXDEN5LkI8Dx+RcHs2swn9d2
	Ppu2ToZxGcjTFsUdRfmkCpiAEZaGMINH5Jq90bE9Wg=
X-Received: by 2002:a05:6000:2406:b0:4af:e519:ccd1 with SMTP id ffacd0b85a97d-4afe519ced4mr37199366f8f.49.1795729489344;
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
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
Subject: [PATCH 07/11] drm/sun4i: Add H616 TCON TV support
Date: Thu, 26 Nov 2026 22:44:29 +0100
Message-ID: <20261126214433.3562326-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214459_199040_87156D23 
X-CRM114-Status: GOOD (  16.20  )
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

It needs additional quirk to enable HDMI pads.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0cbd6ae66c4e..3596537c500b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1297,6 +1297,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 				   tcon->id);
 	}
 
+	if (tcon->quirks->hdmi_pad)
+		regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
+				   SUN4I_TCON_GCTL_PAD_SEL,
+				   SUN4I_TCON_GCTL_PAD_SEL);
+
 	list_add_tail(&tcon->list, &drv->tcon_list);
 
 	return 0;
@@ -1585,6 +1590,13 @@ static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
 };
 
+static const struct sun4i_tcon_quirks sun50i_h616_tv_quirks = {
+	.has_channel_1		= true,
+	.polarity_in_ch0	= true,
+	.hdmi_pad		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1605,6 +1617,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-h616-tcon-tv", .data = &sun50i_h616_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..98bee2bd96d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -19,6 +19,7 @@
 
 #define SUN4I_TCON_GCTL_REG			0x0
 #define SUN4I_TCON_GCTL_TCON_ENABLE			BIT(31)
+#define SUN4I_TCON_GCTL_PAD_SEL				BIT(1)
 #define SUN4I_TCON_GCTL_IOMAP_MASK			BIT(0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON1			(1 << 0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON0			(0 << 0)
@@ -243,6 +244,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	hdmi_pad;	/* h616 has to enable pad for HDMI */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.43.0


