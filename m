Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3236606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrVOWxef;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dgp7TV0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=; b=xrVOWxeflNNxG8
	B7QOAjNIph7YUaUhoRuV0ZQUwae3TLcavqFQ3i2TEk+MsFAMY83NgjmD0VXlyOeoJMW3/IJJDE8ue
	Zrn5GYyaet1GkOC5Zxxh/VFQMv0hqk9onmivm1LeZpPaYq6AF1pp52LBHBopwVRL/fLZgY4GPR2jl
	OaVmQjCHSPtDwPVitZbdyNFxgZP6WrT1O9x+tvCCNyW4e7O2aJ8ZSSl361CPTOf6Bu3IX7EY6V+2m
	Drv+NIY+f0tR3sncJ7rVGgXZBDgbfC80INekgyS8S18lbpbeJFwjGo/ayWEumMmustxdy8MUorc6R
	o/qttVhh7J6E/tZCSUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrT-00000003wWW-3DnL;
	Mon, 23 Nov 2026 15:21:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrJ-00000003wQ6-1xzm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3075221f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447291; x=1796052091; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=Dgp7TV0tzkKc5hhjrkMKDk9ZBvM8V3ub1l30JH6SaYq+uV66k97DSu5lbpGSmcKLuA
         63sz+6cPD00E4gNOgD6SVD5VfHyHbTt5S2UL/AY6AGJBVbi1SAgsFzzfZVV8eUsMSMQB
         kp+M7g4zQUupFTo54+jz6jTA2yTbYyyhTRgcENpmFxWVwnjPTVwLeKBQFG/66PksZ1rd
         PsxUBAKIgDUyrJRje0UXATj7yXDY+KiYe+3mljOc0IiPbHxHIqFzU+4cqMmff957Qd2q
         sYg4XsN/629JEST7lK6/baz3CadU17sQgWdMVq3YPrM5HNBqcBu/oijA2upxbhFDESFn
         CkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447291; x=1796052091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=hCMlvbp7z0GyNkSNnhxIGL3rQ1weuk+AHcX2yv9q4WQzpbv/Dt52vTiMXF/gbhaIjT
         rMdEET+ZZDOxiRgPFzFASC0FvoMyKSZb8nTMBebO6OY//7Tq9QFHcwcfry8aueeb9HB3
         g45549e0z7NvsJWwJdCYRQFJI7pyHHHfZL4GHTKVY3L8NkCNWi4iVFJgPvS28PbBgbV7
         IQTfReUJTyMCaSCeoTU0ICw414Tfs3K6Ks/wAQaCfFv5JuwPTSOF0l6Nnd7B6JALot2M
         zP0pdyrB7W363+O2foSoE9GB9dg48B4ehcPBu4IIW6Ux5NZzy8iUYVJvt86CQzsemyco
         hEvg==
X-Forwarded-Encrypted: i=1; AL+hErEGNTTli27HiJvNqh2om/35Z46ITSJVZIzcuw9vZRQa+0K5xF7cT6R/KWuvhB5viaRImSfvPZTvJkePnoLUTWo5@lists.infradead.org
X-Gm-Message-State: APuU4Z9ooWLIYmits9bfXNQcVDJXRTvlyr3flzOmsus0U3wCQGfBPLGm
	ykjzUAqNzoyPlcQ6T6XsuY3ChxWI0eod19ylSW+dCpUiD0Nc8VVllYCfGsNV+4/2/ok=
X-Gm-Gg: AZFdTZeu+mBPKU+Ji7qWCXAnvYL9vMl692UVzoMFdnsKLbdWgvYdoZ8FZ9IzN6TbJC9
	ebKdR8FrHaaLWQvC9ZrMmU6M8pVjsS3pJWsx1lfuzPqtjxMIcQUv5Gz3Bh8SrCiKrKy1vvP6dPH
	PH2A0ES3SO8lKRxH387OJFoIU3NDRN6s9MgJcZEAn0ZWRV3bdHDXt/dymb8shPQtzoV+Qgk4Yiq
	uryQmoR+X204Ib1fRVUlXPCJUoETaRHQFAVTwcBDX2u/k/IgVL9N1GU0dCanhHsgkisF6K6zT1t
	gje3kXnpzywMUSt14kzewge5jMpyImwsgqYOQFZQambpEGnM7NTGFYq1Yw7UBlD2gCBXbUMKBqE
	6s18+OLZ3J3XAqyODUSNmIvVbejw14t5MGwdYuLl7FxgDnWhsYiOLJnOkWKUcjnX37udz4j49wy
	8f4VBEht1L+xbxJ6wyLKdGeyWy8dbzvlyRKPYZ2cL26vP0uLkM+2TVgKDDBe/xrFeTfzFeLJw/d
	3dKPLXCtTciENlId23SE1U7B+LnOG8Rw+2Y7/J2MXWP4cg++ZNMAK+wagsUhbnlY8qZuphKZRmJ
	m2Ro9nEN473jCVZ2QUWYTcHs7Nj0n9pQ6e1pIS7o8qZp9HwnrN4=
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr20347784f8f.44.1795447290982;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm23236628f8f.3.2026.11.23.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:23 +0100
Subject: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
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
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072133_523002_7E93066D 
X-CRM114-Status: GOOD (  13.22  )
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

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.
The input, output and schmitt enables keep their value: 0 means disabled
for them, and the pinctrl based GPIO driver reads the output enable to
tell the direction of a line.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 982c79bc77cc..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param, u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1


