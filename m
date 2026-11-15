Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S25i2p+G;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kz6jakI1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=; b=S25i2p+GD8De0F
	UFJGZ3xiymYrpYc+zsoGoT6XpedeVEH1719U4N2871t/eUP1+okRHDG8LJUsBWTJxoGi72SlXaFE0
	JL24u+Ok39vYvG++7N6W/V4XwRabVx2ApHgBtfOCNUl67XMrORnvVj14auQ9hlHM0wjcvKErHKVoV
	A1THB/MfurMrYHn38vt44JFbw7Nfh6/VA5qQAcVdxdXLjsIICtlS9aEXSHL9Kva5PedPEZc2wKOWC
	Lsn6tGwG1idRiIveEBH/g24Rt4u+l8bRn5iPzE+kA68/fKH2cu+DxrGNYBE9y8OTtadVokuD6RRyv
	1r7jMD/g5CaA8XUapCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSf-0000000H6et-0q76;
	Sun, 15 Nov 2026 06:11:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSY-0000000H6bc-3a6k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso3197555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723085; x=1795327885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=Kz6jakI1HN2nPSbCe+8pkBZChYAXTfyYBZ0vHaRqFL4vYHQvZHb9AmbkrlgeLr3FL7
         ud+BWtLdocTiryyW0dhrYpsZvNmt6giW7qJ1E39UuGyjf9BFEGFyMTevQ5VPFHanGC9S
         TXlCf8V5dmr+fQAaOy5nEck+Nv6TDuGKS2IHunRjT2hFxrkB/TUJz+D+E+rHNQRH1Gxd
         hz/EG6q7L6rMd9YaaYWo34fJX9pLmcv3IVPbYg4/1N3wI70yG03PRsuP0OtQ5aY7Drlf
         uWOTR9qqjIY3sMJaL01dK3sksW1g/GqTWZIYl/htIb9RP3YjBWSzNr6AwufPG4ndPUK/
         JVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723085; x=1795327885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=DnyLHQxtgMWsbh3Ntcyz7YO2JpGdeu/EIEk8RteXaXlzzYS/UY+UZ/zOKyGAAnMCo/
         iXD0Axv9lH4wJ0oQ8+GOMlLQE0gVGgmMqCyHpujJJkEvobCg+kzs1B9BNgx6F9PfKH97
         xYEdLaQMc2b15vZV1gdw1M3xSxN8HbPFsO8/f4lUi9d7SwQXCjpotp9AJl8boK+tUtjo
         npe8ZcULnUeHz2ycTi/t5wcGoYQW/wuPINyO1bEslfZogq4AbY1+9I/7g0bV8GrCN3YV
         ugYG05Fvv5d98s/IZ+Cz/LCK9bevpM6IGmtHup9SesMzZXceZZQXDfzf2QQsDabBK5p3
         0F8g==
X-Forwarded-Encrypted: i=1; AL+hErF1eBA3+mkuOzYC3zM622ogzIRMeaXcHi8PcW2XHqvG4nVPQsgs8FAPn9y7Xyl53ujkAPvxXFBLtCxeSFxV0+zG@lists.infradead.org
X-Gm-Message-State: APuU4Z89VMhu2yps9vv+jqWXV7XXr7+pmubjDg5I8VdTQe0nmVgITVeu
	9J+PfXgd/+Ky+Qz6felGve7fnD9GVTOjaY8oOR7hpGo9zy62eOMbw4F4
X-Gm-Gg: AYBFou317fWzNoIEFO5PB5iiUzxZaooQFOJn5CQdeUWGiA48Yg/2xzZ1zkU4vm9J3Fo
	YD18Vbk6wxJ2olUI8WXQGiafqTJDNef3nr1LF4gsoWaYbAeLfjvZBEFGLacFlFHhUoivdvqQKyF
	EFt6C5UnumqPkxnRRjoVRsTM4UdyEM78tVE5kj2qgwFWYVmz8g0Y/9QiFFf9aL46th2YAB3ihrI
	CSEIIoLI1rvcTI+6RfNi2O8TMs9rZ14pyq6haIH6Y/bFFPnyFWJLLmBxCxPDSjZFkaXNW4BLrga
	AunMIUcRULnxQHCOKRg6E+ncf0WfmRYlM60d6avo+3fq6JGKUSvxglMfh+eDW1NZoiNCSr2iO5w
	gNo0kcDl8ijf3o9goJTobV5OWFxJVuvnOQ7He9DTH303YIcwxvo27wfld2A2fQUCpzgNYcKirsv
	Ka24IPqZ6vAzZ6S62nb9CCI2zW4oBeWg+jfSbmONx4e1xl2IbFYqOMy7TprHaDLfO4DeWx9cewr
	ZPcOE1mhzMIOx1dOfhKC5S/307B+H7CheuqD/8TZ+Qoj9CII5JNAdo/8sM/h4OY4IC55i0Mo008
	6uEEwNFy0qrXTsJHkhUuH939cAkDo1IgziT6PP7nPWy6A4DhGb+wi1m9aePkpDmmnr9I643WA0R
	SHxOzjlF+hz17zW6atDNDEHrFed4069RQZFNXro6pMQ3AZtUFZIXY4HREcfLmbNEIg6D7Fx+pmH
	gSYmDse2xEwhUYfTTuLCunPWUNT9X8fMD0OElpFgCVn4LqC4zBdEPGjy/jJOrkVTomGOaCCwE9b
	E+APfO1o8kWcw==
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr151718065e9.25.1794723084885;
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
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
Subject: [PATCH v3 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sun, 15 Nov 2026 07:10:57 +0100
Message-ID: <20261115061102.229680-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221128_331792_570EB167 
X-CRM114-Status: GOOD (  16.21  )
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.43.0


