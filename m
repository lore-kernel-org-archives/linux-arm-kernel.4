Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zh3RYaaE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJ8nD1EG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=; b=zh3RYaaEma7jDv
	DWkaeZKBxyai5EZeQLdNiTznntBFN6FDlI0NWZLykdCdRIR/c0zUmjAf3gA6TDhoLsixysid6h8wI
	Ae5FkyDg/8/YPWa8xBAslJTnUyQQ01DgCqIPvHL151l0iTtqCfUxo/7pQ2+QbcySmSy5LlIOHhwBf
	r+/1e5v0bD7FEIgE0h0CO9eHtgeknOFYb808l9JxUgtM2W6pn3Vxn7KmJyhPCAfzcWqfcvrsnuCqc
	EuHQXiak2zUWhloYMzkSjrWgNFowwlf5b4yi97D9B2U86NQx+8pp3vsPTt33nn/ihSIFgBO6ePhBh
	zYuaZm7w+2cxwdzkeMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvZ3-00000002JOn-3xxF;
	Mon, 16 Nov 2026 12:12:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvYx-00000002JLy-0Bk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:11:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso38018715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831113; x=1795435913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=kJ8nD1EGNUh8AJCeNyvcADH4M2iIYTG/EFPynbRBeLIwT9GmrpYjmOPL0NOcoZVU6J
         6CWoDJ2SGE2OmJbH3IbBlwfBiMQhD8OyU5uwjE8VDWlE/UldR/pveERPhDde+uxzdMPF
         2aD/rNvbgdCuKdkZcCb+8P4Au6miDZh04CY+ICOJvJKeO3GvppMQP+kqX1r27UST/9CW
         I0a3tWIPpHGvvb+Gzpi7LwOdX2lZuU6xxCcW3Gd+ElRIxrssnzpPH3tKtiXJs2a52AFD
         Z53O2P/+FTj/SrQWXVS2JNFxvh1HwTKGcvq1e9Ori47j1+5P7v7ioW9Dz+Cp1Z1nIY3h
         f6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831113; x=1795435913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=dFuVMwyhRvemroHEG4wIEYRGNRTu4MIzvOkahZL+7DajWC5oYjLUWxpBi5jpUlFtAJ
         JlJL6UHX1AFLKbndvkVK0waWqEKj8ea1jMl5QpjpBZR6qS1vxwgdEBXQcuzhq3rITd3F
         sgvp/jKwXfT+8cAt8iNAJxvRKnFh7IO/Bpo4aIXSmIlCh3M2tJvLdzuXbPSlS0YhRLxG
         rPkqQkwTWYPWAm4yIGNB0Rn89qic4hCk9EfQoaErAGhroi6qOqGAJfFH3F84l9HXaHHk
         E0IZnV1Zr/BtjMQhYAJPzneptPYs7TN6pt/bR6YriUCGkbg2X4uvMOwtADX6STqV5187
         I68g==
X-Forwarded-Encrypted: i=1; AL+hErHqJNIqkonWhXbJJWYJEX0LpGWELln9R2R7fe+pQ3k9zyhxleZBvtL0x/spEKVum2DujuJzsIBpb1ZOJkoKqBPN@lists.infradead.org
X-Gm-Message-State: APuU4Z8Bk7QZe15+QnfSLLPqd51RynRPjN79Om+HiCJ8zgRZ2JIfR/Qc
	bBYFQ2QEYasY3hQ9IZFocgnep33YwJa+1kbZhh9FsgzBgMYIZQ3Bx0rU
X-Gm-Gg: AYBFou1YrgdWh9FKbYqemQkjSuANIylDLRaiJKUIjV/vdWvRBsgnFrai67f4O7epyM1
	m2fs5kcPWtiwGrrHTTd3WVsrzGbZp+p8B/2yuMZlPtPkXYDQ9BqldFNPE/2c47HOfGz4JKpxsbC
	wPPF35p3VDdkLiHkuPzxwNsSFRyQ2BlzTCqIC4DDBSTUOunSnJ2k64Ue77s4KFUa9U2ZjxFBgwJ
	ludXywaqfmGQGCQGeQaai5ZvqgOujwjt4/LyAbFDa688J8/xFcap0CBR9Fxi5ToQEQ0oOnSRSA5
	LbSswPfUaWJxIWBRpUj3s4w+UVInPLb4xwzdymUiuIVayeJ2qLBm0PtcmnTvY63w8buR6fNDyDC
	Pt0WsrGU6pP856HfLobckjMvQxqtF0C52APP6QwdE9ZWmeqlZ8DSpsXNiwfvb4n36IVIT9YYzxb
	uYTxCtLEx5zfOJ2DknsV5wRkDaMLjuanhFgZd6rW1eXlcxVS44uWplUWZC6jLB6rEU62++Yi44X
	56xniqTS66MywQ3xrbr+l2m1H1NDMUEQLk1klFY86u69nxJiq2XdoCgIuqH7BxYxpndy5cQKCQV
	05ikoG1XWQJNknmcQs38hy5aPd+JomklYRbfXXwWOP5SU1LzYH6qupaiY0k2Pdy8TuTpCrGzyr3
	F0J091neO1h+uXTPXZBPtZMnLif8ha/Rsy12/kiC5L1ZXIIz633lhhXm8L2Z7XqCGsZAuXT2S
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr91695095e9.25.1794831112818;
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:48 +0100
Subject: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_041155_105501_EA1AA907 
X-CRM114-Status: GOOD (  12.04  )
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

From: Christian Gmeiner <cgmeiner@igalia.com>

The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
panel only has 60 Hz and 40 Hz. Output of edid-decode:

  DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N
  DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N

On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
60 Hz timing from the EDID.

Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7add22ccf69..0ebd756d14d0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1364,15 +1364,16 @@ static const struct panel_desc innolux_n116bge = {
 };
 
 static const struct drm_display_mode innolux_n125hce_gn1_mode = {
-	.clock = 162000,
+	.clock = 138780,
 	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40 + 80,
+	.hsync_start = 1920 + 46,
+	.hsync_end = 1920 + 46 + 30,
+	.htotal = 1920 + 46 + 30 + 84,
 	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 4,
-	.vtotal = 1080 + 4 + 4 + 24,
+	.vsync_start = 1080 + 2,
+	.vsync_end = 1080 + 2 + 4,
+	.vtotal = 1080 + 2 + 4 + 26,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 static const struct panel_desc innolux_n125hce_gn1 = {

-- 
2.56.0


