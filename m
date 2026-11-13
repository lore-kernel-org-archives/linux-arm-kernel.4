Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80960606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqzLrbbm;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o3cnSfSN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=; b=hqzLrbbmErn7yc
	3S1PdFpX+eDhgXu4RBKjBKxwQ9cV9SceZp0bi9/kS5yIf0SoHF0cIMf1FncIzQFEsqbtyhrXxaMPW
	VbdEyEjxOGBUa7sMxOaZ2kJKyHCn4DX0PZmy17AH7RklFB3EEmPtMy/0FdZWFTQ+BFCKLKjkFvUdC
	cEIq7ePVEauFPXq4v2C/9RNwiHLVXZaqmMaC6cSjd916Gh0FNNQYqlm4SyAsXrQSq9kka3tSOaCRF
	X6Ow2YE6nbLAFkybsN4hLh1Q3AJPblgpTtueXcm3I6u4/rHldB1+YlbNK3ycMGUmEDV41AhIxas2c
	Xi3NK/FVrUub+yzrHwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6g-0000000CSvb-1b8t;
	Fri, 13 Nov 2026 11:06:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6Y-0000000CSq1-2rCW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e10a70540so324081f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567961; x=1795172761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=o3cnSfSNqJv6mhoBkmIEeS9yoW1WQBxNy/0j7gFOQPrJlkfo7yjqvHA9E0mT1mccQ9
         sj8/LSNUjQH5UvrazQB+j6fY+XjXYML0OZskY3ffF3c/almOxSNq88Kgl5hFieFudLmf
         Je9Y7z+k55e1LjakgyNE3u5L/P8k5TvaxcYkClPA3WP9OLE7bEANUHCppNOBPqAwjaWJ
         tRtBBa5WfHSY2xaVXEWknoAR990hBdrJpmPco1Y9zHF+mMZzVPG4YE0CoRttmaeKCA7k
         t47Du+/1AX8/WkrKjOyF97X+ZLp8czQJW/N8SVk1oLcI5bwmeJp54DuMd5NCu6/6ZWRr
         /yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567961; x=1795172761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=F0L2yqt390qp9h1r+l3eOOabYjhKovsNdFiBGOpL5svszejGi6hhUicWDVi1AISkvv
         08kfYMex4ZzkVCnOnyjUJCF4y7UPlLRVIcVGEer7PLGO2bTF0Ok5uFpPyDf/1EZHpljm
         xt5QaFTWYPtowOlo7HX9xLgTKtBJTl5A7darpfqat0R2SbIi3AdTpm11ao/dyylW7K1n
         F9NoZpXIS9v0C27cBCEnzQ/1Ox6hgfzz+z9+n83PzhKe7qFkJxjinzj903Xs8/+7Grvs
         6WGoYlFeiEGTIHmKzXuD8eYcevMflvQD+TYzvpxyn0MMqo0qR+d9m2tsaj2Y85vOHdrq
         dgTA==
X-Forwarded-Encrypted: i=1; AL+hErFVsfb1Kfe4P2X64P8Ls46Q46pyDLFQJWt2qUhswQn5vHmeYF2qLAFNEJx99wLXSlnV8SihwtKtFDFUig17ur4B@lists.infradead.org
X-Gm-Message-State: APuU4Z8PZLETBj3ZIkff0l1GYGPRfcRGMX5tYmoCFfhS8SgyWGqSxev3
	ZasCBmP44Z/wml92ILy3HIkyakZRXorGf+neZ3XDszHZorNNx2t9DDmSsmfHvAJidzo=
X-Gm-Gg: AYBFou1RBNgdxYmpaOfMshXW3GfKbupOpm74P4jO8GEfJfbdmitFqx8Rfs10sjTQTst
	7S6zfzZkuFjGG4JWipB7VJDrH4RFyGtmhmZRoyWa3Q0gJm9owt5DGO25Igv4QYy+iCw39Xzo8Jl
	KjncCauRoXsQX0wvhYWfQgT+TcNxpGdFwNBLg+4LkwktTdYg6azLmjNuFLNmOwZq/K1G4cAYIxs
	07GdIhUXcpHPzdattpFXm5zyrueDTFFixx6gZl+ygGJ5NuvUBLgszUmuxqK0wy8VsX4CFtGYcmo
	rqnouk+ARZNDq3JGhoyDE6R5TybX1WHhwdBa29JPYuYFSe2T0tKtRy45qBifvUdSh6cC1N07jZC
	De2qQS0Y7s2A4qkGYHSXjwE0O7I36ZvSVJc78VN1RbFyEhTfiYQIlU6a5GYPWDliRZiljhERodc
	p07TZCkoAnJ9W7xw2L7mVjpkxg+SdbqYnaUHu5VLrdXGb8jAnHg3nmCANdvLxVraQKwQFnjsPWQ
	mMILXSJwj3+JaJ6q0Qyo0sy3GCnu55pHF+OS5lzRqAHCH9dTAfPHjgPMuV/t5+mzI6lIGSqWHMH
	1jv8lpbQ1n/vqKu8LgfbAaohdseYSeu68k0e+ULGNPVWjr8wZCk=
X-Received: by 2002:a05:6000:2909:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49c7316486bmr5048910f8f.15.1794567960637;
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4813292f8f.3.2026.11.13.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:27 +0100
Subject: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
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
X-CRM114-CacheID: sfid-20261113_030602_751227_975FE0CF 
X-CRM114-Status: GOOD (  13.84  )
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43d5f3d54a8a..af33ddd4056b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
+{
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		return value / MILLI;
+
+	return value;
+}
+
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type)
 {
@@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 }
 
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
-					     enum scmi_pinctrl_conf_type *type)
+					     enum scmi_pinctrl_conf_type *type,
+					     u32 *arg)
 {
 	if (param == PIN_CONFIG_LEVEL) {
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		return 0;
 	}
 
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*arg *= MILLI;
+
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
@@ -203,6 +216,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +281,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		if (param == PIN_CONFIG_PERSIST_STATE)
 			continue;
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt],
+							&p_config_value[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
 		cnt++;
 	}
 
@@ -310,13 +325,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i],
+							&p_config_value[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
 	}
 
 	ret = pinctrl_ops->settings_conf(pmx->ph, group, GROUP_TYPE,
@@ -359,6 +374,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1


