Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7876606D836
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QqTTqmoO;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M092Z/1m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=; b=QqTTqmoO9csBDK
	TDy4fDpU4o3cCK3epPIU1e4HAHbPRjDCRt0m8eI54MXp0raZuta/d0Xp5EjNjffz1gdymhaoFIGrh
	GL6HlbR4ikXmhAXpiJw3GgW3F/wkDjPJjRrj13B232bG7PXtGezR6CscEz5w9h8K9P+BwURlSr82c
	DvYnD5gG8m0UyvRi50/YAwu4BfOzeqSVJeDBFCKZHYMO9DUtf31rMcV78HRhf6UZ0tQ+XFHygDnUq
	8D2RCdLLIRow/hSC+rrGHg1C6pBNBn6fWyGbe+keMgd8wq0qCew4ySHv1revaeRmaf+SfSAkKN4C2
	Nkwfh+fdqxPLalVCuLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPv-00000000f0U-1d55;
	Mon, 09 Nov 2026 12:24:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPs-00000000ewL-1UGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:24:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5261175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227042; x=1794831842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=;
        b=M092Z/1mCbts5ZTzuqYMF9xgGRKY82Du3LvsSqsM9l5T5Wm7b1NQul8NIk9F1/VzA/
         O2jMqEhMRKnB4N12d6ruC0vsnrc5/F3cXAAZhTOs8jS4/usyP7l7zvZgTI+qF5DYDBUc
         4/yXn9b0qWeda9SBmgoBFN/F+TNpKbJrn3Bhl2kgm9YH3fVf8fPQn/lajzxGA3YkeBms
         ITgP5FH1M/kshXBot1lDCQudT0suUNu6R+GK0TF69lRfmzj8lVy5IrTw5I9ttCHqtsI1
         2i5CFnAeivGzrJFEvbcW5Fubo5rmd76VPnjkw5wUtj78BAnxGGLAJjgLE/DRkKVT9Tob
         BKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227042; x=1794831842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=;
        b=f+O3vRG4iyVYplXpJYUngdVUpY5IVxNKLJWko/bMPNJmHzRmR8TRpbCsf8uC3SBvR2
         RYnd/sYeIiUgNxrMyzUcMa4VbNAaeiZ02j+rfioG3Hnz9NG3cjispsV3fx9SKjGlCary
         aeI3xQNHNiOP2JmaEI+t1+LMI2G2B2ep6gljgROi8lzEAhyLnrGJv+NI2egtP3TyDne7
         +FHicfwjjysHwphKRlY0ka1tRktCJ7lIrsQgN7h9HhsR4d7NzvaKJO9hDY2Y7NY7I4BJ
         045daebL9COVmoLoLwGj6Ssp0b+eaKGo2snoOZ0BOYukJyWTZRIYwH9AUX9MXu83CyY9
         OE+g==
X-Forwarded-Encrypted: i=1; AL+hErE1QTbr0jSGVpBzE3K3VLzQk64DyY16LaVjWPbOlcXjkX4R5E0CawESUwvaxoB5x8J32UHeUcWh3ql9tTpOvrqn@lists.infradead.org
X-Gm-Message-State: APuU4Z8zT71iwB75Gq91P7gzw7uIKBmNAEIOnbL2Wy8OdFejonszLGI/
	thgxelufgQDNIC/g+mfjaB7bqJh71YS1+DfdqP+LJ9AJ7/NxUrmETpWqwAC+voadIHQ=
X-Gm-Gg: AYBFou2Ffq2KW8ZY9j4jVT6d6KoA3LXT968JTrHbcqyM8S59Kemm29Ejm9viHQlidNv
	bAkMM6ftFuzWH0GCPIZ1QNWultN3jtfScR6uZB7YQ0p3UBHnPyj2f0fJ1Qgc7rSseNK6tD/+x2T
	62nOoh5ujdHmFN55FKwv8NBJvqmqUHiw8YcFDNw5F0uJ3DV+FZRAvgcN0h8bP7PKH+Pwi0n0KSk
	ywYQ7XyzHyH+uzwfvQueiMc6jQvdtB0QVHx3pnQ6SyXWxNu8HFFlzdSOq0j9w9qhHuY0Y65YTjd
	QMnVImf6dTfXLQibVEoQxSKgCr62C/E8DSkv1YTXJ2+3bNYpWehNezBojjRJmM7yExcaO/QXlEE
	90LdUG+TlNcQw28Y3EZgJLB1WPPwR1ddO7UGylX+gpX8RndpKH7Vt0l6MUTfmuMBLPgfF5M0T+/
	rWkVCPeZpJ0eUjb7Xa0sUZRv7+aX5ZcFIHa+zjsJ3aFv5C9dbWqWaHXpt1epolmqb1vfi6R1yo8
	jcWgdnDYUe8daUg7QCqX5Z0K80c5wOf3QeMhfJG3gdWtZEwi1jEBnlCJjyZpPS9MVyGWD5HToWK
	/c8uYZERbQt23rr3SBYKlFBep3vdtA8Fkgwjf7rbdAV1AeZbf7URcjk79I0/mhOiWq1J//IhwpM
	ZcyfzKY8qpg==
X-Received: by 2002:a05:600c:c174:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4b963c675c1mr76221585e9.12.1794227042108;
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:01 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 2/5] drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
Date: Mon,  9 Nov 2026 13:22:47 +0100
Message-ID: <20261109122250.720757-3-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042404_461852_39F0A978 
X-CRM114-Status: GOOD (  14.70  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the MIPI-DSI driver for the Youritech panel with the ILI9806E
controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../drm/panel/panel-ilitek-ili9806e-core.c    |   4 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-dsi.c | 158 ++++++++++++++++++
 2 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
index 81d48c402aec..4447a65c9007 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -91,7 +91,9 @@ int ili9806e_probe(struct device *dev, void *transport,
 	if (of_device_is_compatible(dev->of_node,
 				    "densitron,dmt028vghmcmi-1d") ||
 	    of_device_is_compatible(dev->of_node,
-				    "ortustech,com35h3p70ulc")) {
+				    "ortustech,com35h3p70ulc") ||
+	    of_device_is_compatible(dev->of_node,
+				    "youritech,ili9806e")) {
 		ctx->supplies[ctx->num_supplies++].supply = "vccio";
 		set_prepare_prev_first = true;
 	}
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 89915d58f69d..e83d643363b3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -464,9 +464,167 @@ static const struct ili9806e_dsi_panel_desc dmt028vghmcmi_1d_desc = {
 	.lanes = 2,
 };
 
+static void youritech_ili9806e_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Switch to page 1 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x10); /* Output SDA */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x00); /* set DE/VSYNC mode */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01); /* DE = 1 Active */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x01); /* Resolution 480 X 854 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x00); /* Inversion setting 2-dot */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x16); /* BT AVDD, AVDD */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x41, 0x33);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x42, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x43, 0x09); /* SET VGH clamp level */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x44, 0x06); /* SET VGL clamp level */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x50, 0x88); /* VREG1 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x51, 0x88); /* VREG2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x52, 0x00); /* Flicker MSB */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x49); /* Flicker LSB */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x55, 0x49);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x60, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x61, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x62, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x63, 0x00);
+
+	/* Positive Gamma */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa1, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa2, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa3, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa6, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa7, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa8, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa9, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaa, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xab, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xac, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xad, 0x12);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xae, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaf, 0x00);
+
+	/* Negative Gamma */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc1, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc2, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc3, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc6, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc7, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc8, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc9, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xca, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcb, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcc, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcd, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xce, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x00);
+
+	/* Switch to page 6 (GIP settings) */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x05, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x98);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x09, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x10, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x12, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x22, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x23, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x24, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x25, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x27, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x32, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x33, 0xee);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0xff);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x37, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x38, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x39, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x77);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3b, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3c, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3d, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3e, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3f, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x22);
+
+	/* Switch to page 7 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x77);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0xb2);
+
+	/* Switch to page 0 & set Pixel Format (RGB888 = 0x77) */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x77);
+}
+
+static const struct drm_display_mode youritech_ili9806e_default_mode = {
+	.clock		= 30000,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 25,
+	.hsync_end	= 480 + 25 + 10,
+	.htotal		= 480 + 25 + 10 + 125,
+
+	.vdisplay	= 854,
+	.vsync_start	= 854 + 20,
+	.vsync_end	= 854 + 20 + 4,
+	.vtotal		= 854 + 20 + 4 + 16,
+
+	.width_mm	= 68,
+	.height_mm	= 121,
+
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct ili9806e_dsi_panel_desc youritech_ili9806e_desc = {
+	.init_sequence = youritech_ili9806e_init,
+	.display_mode = &youritech_ili9806e_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9806e_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
+	{ .compatible = "youritech,ili9806e", .data = &youritech_ili9806e_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9806e_dsi_of_match);
-- 
2.47.3


