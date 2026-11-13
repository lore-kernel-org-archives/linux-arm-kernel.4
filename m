Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B1606A887
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtAC+aCz;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=j06igk1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=; b=FtAC+aCz1OB5jQ
	HzVX99NTwNdJStCz6BNIvb47+JaA2tb6x5yked1WL1COu/VHNeagWPwwx+U594QHbP6CkmOF9fHnR
	VvhESFPI2pf+PBML+QYRLXGKhb3vyhlGfZa0F2Z1+Zw/zbfXxVeRplLA233bydndkBNghASmUTcmH
	5Rjwv+sCUtnSf1naj+GMptYZlZbrN62kc4j1GN3jaiu74BiH7jso4GJYsqjKOFn4ckPqZJ/EoNMsY
	jC8yfWy95PcElqqFBgIA6bgYr3nrxqCNdzDny+59zMa98PBNUY4ZaxSHKxY8olbylznUo0CvXWjx3
	PnRPDOBjPb3tj7PI86aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6i-0000000CSxd-0Qwy;
	Fri, 13 Nov 2026 11:06:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6c-0000000CSri-2Ito
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4922dbcee23so356696f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567964; x=1795172764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=j06igk1TAcW2I8QWYJEYTSJxB87+1yoDJt2EkNPjZDwxargr/pPayYXKM/1R5Pjxzg
         dXadfNxpUzSkAaCPeXv8IM5K11/xa643C5QfOUy5cLFV5F1ALnUOfNRFpAm3p6oIjDWy
         2BXdi2KqavgnB0h8dUCmp9SEthm1gAj21fU3v8sswNMu77yuiOJIQ3GDxgQfTmsrvxbK
         /IwrbiO+5lZmHVQmak2c3HN0RTgzNWi37VWnygeZ5CZk9jpJ3H4IhL8BDkLDv/3sjXI0
         vw5rzhC80G9vfPatCgvM1QvzFaZzFpbLSV5fW2yulF3kl70GcLl4WYaWiqxMU0AOg8eq
         nurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567964; x=1795172764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=SOJ44gIdrnRFdCukP64N3H/nO6bgX0JfD+aYmkYUjLz/UjEPDNYopJJ5HJD3m88lxw
         PnljW+UX8qFvcBOZA4KkrF76g3+HQOgHsd5DngFSwGVOIsnhhXUVQ3c5Z12mynQZP8Mq
         j9RXUVDtEwiR5Bw5i5n8hXA1bEWmAIs0csTqDS6ZFrsDH5RWLnbkzVYNLkaN//+ZrxKW
         JGaxC75TAVEDSSlXEoXpen+vQb7wgOTooB2GPZiVVOSGFG22WYuFMZIYgpIhULsyg6tw
         sVsmo9UvLiIqf0hCxQXEa4JDMkP/hKKjtwFyy3o0d5lJby4vSd24s7JBWteT+j4tbn8n
         fA9g==
X-Forwarded-Encrypted: i=1; AL+hErH8O1HFn/YGskvYlQ1Wkgst4I1DpTzwFZH5XDtNaykHEVL63xOWbxLWmBsE+UL+S8MB5F1HufJXiLjm57UCkiBn@lists.infradead.org
X-Gm-Message-State: APuU4Z8uojcG34RvxXI93XvbsQcrBd3JQnGPZA1lHKW/Xn3rQKdDBrLA
	I6l0UYm9idHGX5zXLjapv8Adu/2m6jTQGwE82KRsNIRcqoO1YBXerZv8fhht69MjRw0=
X-Gm-Gg: AYBFou1vdNnPhM4383h+n7Om3Tmpoe/mCklvdDW68iitq4nPcNsi6XtJefV/9T9AXVS
	oTheUlNCfNmNxaBruZoPtgm471fXdrhYP7lPwaN9/axhLiTnVSqyYrhsM1H85LGqWmZQfyehVtW
	y2MLA72iE5/aNbxC5pNXpHR5OLJ6wNNw7s5wRhxhwoNfH1BvGTLIvaGyhKrYsOvZWJ+gaVnP+Su
	fX9MOSjj0h0eLm1yC3lIbnlU7Q7O2ftE+6m7GjgSQZ4M6H3EnvqSczGpsWNGP9xBvUoRPqBy/DJ
	8GckqjynjAEtX6/2of7lGhWWhkZ4IOPYPhfT6ginAbTNC5XWXogRh3C2EQneuKD8qVSSd2llFIm
	LzwReoxaP3Kav3zmE57KAGjP8pl5+TeR844r2TTdbVbsO4gF3fOY9ycEVg1Us88+vKctC+//hpx
	WKrITa2LxxQE7p4qWUpk3B/4lfUaByHAM/i/uktzAL4A4YE3ZWyVXtgNUdXn7/ZrrMJj0gZy10N
	OPzt83s32jkw1IO4vrr5TI89fB2k4oORtE2TiZV00xW9TffyGo+2C8+uCHU9R4jtPDfe7f+w+kM
	Z1/5mCzg4G9ZmWKcEFIemk/bxcJVcj3PGa8P
X-Received: by 2002:a05:6000:2c03:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-49c73ecf935mr5406877f8f.54.1794567964456;
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm4600274f8f.15.2026.11.13.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:30 +0100
Subject: [PATCH v2 04/11] pinctrl: scmi: report an off setting as not set
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-4-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030606_637284_44D160BA 
X-CRM114-Status: GOOD (  13.68  )
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
 drivers/pinctrl/pinctrl-scmi.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 221dd8d30009..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,12 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
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
@@ -231,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -389,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
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


