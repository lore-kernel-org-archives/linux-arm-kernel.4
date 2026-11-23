Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CE606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b0m7DEvK;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ljvXLY3j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=; b=b0m7DEvKkvbsKZ
	AOdfWDkIJBMpXEnpc8UCUi5ri4Lrtmhgb73Mi06bJS+rBpuH7zkIiGAmhtschQue8vMZqZr3kjbOV
	xyekHGOuw6KWg33aVP+Wx+sJs+aV3EfyL4zMxHMbCyBYh0hX1NWG5vlPf7nkkZFhGGrmsgs2jvyj7
	IuoFXVUCaZzsrEP5TmlRxcF7OAm07OeoZcAIIvQjEEAFsZn1j3ywomPoo5O2YLZpkMERjuSx+7jJ5
	fLSeZLFbXHEHv1vv1/645MCUv1tta5URoPt5gP0LFF/37OcF3mlIry1d70iDitRmeuIPC0EyA/f6r
	2lOGY25pd88oArV2Xyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrT-00000003wWx-3xtE;
	Mon, 23 Nov 2026 15:21:43 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrJ-00000003wQD-3192
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so896491566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=ljvXLY3jFO4RXGQ94OZb3MudzhMpXmK0HBcmkmetpc+I5rvw3ALUD97UHZ8/xFOzKC
         uUx7Ux6sGCer3obLL3WSQ4rRLpN/PiE6qCA2zoIMBVPIpzdYOoZguz4Ym9FwLOy8n9cA
         QBjELk+mflTzcdBWzT8BT8js0SuR2QbW6sS1XWp845JZk5Sez9RYjRgHygooOdnZ02+k
         9NX3RazgIqI0UnAb5LafAL6BUP5/9afCyrzG9/zeHLx6qsvYauDnDegPJCFMHgqUBhUK
         Ao7WbMa4SNQkULlZiAw7gEAM61tagkCrB1J6j2K9NLaL4cBhJ6CNx8tb3R6Il5nNWVlv
         +nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=hseTHToWmtE22eGN0QfvD2COh39dW+P0cy3I4rVOX656/eFRFcOGtBAmPBKNDum/Ue
         jOR1uEbswuyZmIT4K0X21rgipgnXaariPNITj9/ig2gQkxJ9O/0BCIsF0SU+GlAdw6he
         DzS5+YFn45TFkCwVWdnqh94YPQhhviR7JL0K7uo4D3pHNdUpNGQz8msJp4chSVSwKC4w
         /7LHg9+H7TwJyJye/4FfCyjC4ews4ZKaJSwVfKL3Tbt6XfUO11gGFP70cG7Yf2OETpep
         IR4PrdHZfNzMUchq7n0LfjS9XH/xoDrFzRW3M9Qw2BhAXsgqDWdKnTLoSsyp1ijlCwpy
         8xGg==
X-Forwarded-Encrypted: i=1; AL+hErGCD5l5uvHRfPBiHRN73ht8FnHVnO5aj8xG1VFlmc6DWJz2Tdw3MYrDPBj/dWhsqg1NIGyTLGHdQVcuesrf2f1n@lists.infradead.org
X-Gm-Message-State: APuU4Z/tniqm7DdtImKH1d8M2Aj9IixNi9Nc+7zjjh4h6cJCmhdWm1JP
	Lk4+Ifasxu7+cSsajfluC0cCUTqIJtIswYE/F32MavXtX5Yl7cHNJBQwKCcUTBf1d44jlVR000A
	7+7qQXPs=
X-Gm-Gg: AZFdTZf2f3fCa2AKT8tBhFqOhBX/paXhntkrPKOJ9djrysBPe46cRPGvzLH5/LVaIoe
	Cgr/P6fqZh8SGxTTbT3rDr8XsiIatsU0KMVv6RYpc9FENkD4RYiixVF4CeZI6/ipRhzNF06bmOq
	8i83JR81xotZCrUhvANGrlrjVONIKC/5dZGdN4s14MYJhAkbGWn18Bmp0RTnLdbKbkiSJre8SNf
	kZJqwFI+etQhUQ5niWfLXIU/JnDxOYrQOqFapC21/Y6mBgT/xERztXAXb8vTEv+8rHTLfYgMLOp
	5YXzbxLoBIocMkoC5wbrI8+ExL82z5cyd8aQlTv79o0ueOH+lpJbu0KTTAOlxKwsuCl13i1F679
	sZIjpnqpWiVg0/y3xHW/+bcVS/oI3676+J5uni2c4aLPOpDajdcTWUTortUwZbrSqW6Dm8iy0u/
	z2A4uWuXSNRGKohA9vIkgKldzl7uCf18NMXsndMwBKm7TFgZHdEOfDlxcRUOfY2Yr7sidq2GAAJ
	fNtW2Or7v6VeqeDx5GRrOs+Bp+LIRUKME4bSzQ2YUkeeR2pYxocpU/IAGuwuKQKz5wJNF26Z9jS
	LY8N2PHoBk9W/WgJd3uzdh04isoJkz5fuVjIyQWoog94mjB4cyQ=
X-Received: by 2002:a17:907:3d4e:b0:c4c:e91f:e1db with SMTP id a640c23a62f3a-c51319a7850mr1124091666b.25.1795447291740;
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm22628600f8f.42.2026.11.23.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:24 +0100
Subject: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072133_771932_61EFCC4A 
X-CRM114-Status: GOOD (  12.06  )
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

A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
milliampere, and a set did not check the conversion to microamperes for
an overflow.
Return -EINVAL in both cases instead of truncating or wrapping.
PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.

Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microamperes")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com/
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..23287c3add35 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -179,8 +180,11 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
 		return -EINVAL;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (*value % MILLI)
+			return -EINVAL;
 		*value /= MILLI;
+	}
 
 	return 0;
 }
@@ -223,8 +227,10 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 	if (pinctrl_scmi_pinconf_arg_ignored(param))
 		*arg = 1;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		*arg *= MILLI;
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (check_mul_overflow(*arg, MILLI, arg))
+			return -EINVAL;
+	}
 
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }

-- 
2.56.1


