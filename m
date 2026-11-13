Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C21606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mp7qbvr7;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jPfyXcv2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=; b=mp7qbvr7DLM/Dh
	vzdmLpJ//nM0xj4ZyA2sVKgugA9Fnq7a2wTFk1fqcK/1ek+Y3Qpgs+oFc4oYiFoQRKJxwH92U8Zju
	ZAiL+U67v1xh9EJPFTeFqnMjosonEmCRWKnhVpRWrTsm670Y3G7F/gkQ4VuWa+Qej4M4JcyQFsCe1
	kTpGUoKCJkHsFXJyzPEqQB+x3DFOBL+z0CMW9FN/x3mokz8dq8tTAe/4wATdFvkEx+JvCChI3fKtG
	qB2IX9GlbRlclZM/0FnWzHieD8mkOuZNfsCdmSL0TTR3IdGtVtXZcBlUXZL3GvtXJqjT2JgDrQ+fX
	XG7LG2KcOxgdToNVxEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp7A-0000000CTBi-3dd7;
	Fri, 13 Nov 2026 11:06:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6k-0000000CSzx-19NM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11529985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567972; x=1795172772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=jPfyXcv26bZ10qinvC66+FiGMS956Pa+KKW6BjSbVk3fTUlLsc5W43zkXlnXdq49C5
         X95xlvJqaPd86l0PNiOoWoRwl99g4xbN6pMHgrjQ36cvkItV+Vuv0LJDPUYx5XPLBTsi
         I1mD+pAp3Vx+ZOpPmCdqJqE48sjizWRuOrsMWgsMx+UQf/DDz1eRNxHM2Scc/1TkLm9i
         hF2RnRKo0RXLT2rar+rowdW3xuHUO7xAL3rDahTnvdYGVl1cvwFSBbiaG63CJs+pHktf
         UKVoupkuHY+gKakpVm/SVJ75VUTWd9MSJUPCjanndDbplBJsvYN+wHzG1I1D2UKD2nNu
         jwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567972; x=1795172772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=xqXwAkVPpWH1aPHIjIHaezRYyvMQIERU6GhqM2CsnW52cZQvw5KDOj+kd3qQe4Ui+B
         0VC3RiOkABN14/BJlxCDB8knbPm2T2U+D13+6m9TVBU50t4Z9T0TnPUTCoXWMHcHE7++
         9vZK31FwFKSo1uK+asALJPzjZjPihzdibWtsAWT0agScM4XCxsCcoET4sgCqqxUL+khw
         Rr5YdAoXu8XbmopeEtpDNzv2HHdIPNCKIKesp0UxlP3/vtaKdRXIPoexVLl9jTXYpElA
         qEnhr7iWwl+9gAkZ7OEpljxVsxZh5gDG/tKEXw5BXXLGE6PKH0xWZP9YvjMfb6PXYN3x
         DF0w==
X-Forwarded-Encrypted: i=1; AL+hErH/J8gND4Q6yXcyd8tg2A08qANNeFZz1gTCDxtuDjPkaIRdqsqRBTspNcl8i1i2NJLKXdsPKJgYIyLqMI7BGrz7@lists.infradead.org
X-Gm-Message-State: APuU4Z+C+MR1hmP/zUDDey7L+J3uFI5UljYPnFnMWy/uX4xclFV6ppo0
	8oVlaZe8Vogtacrae9/wk22c6hgJrk49h3XNtp+ibLl+UK6MdejUT4dXFfPkLDkDIOM=
X-Gm-Gg: AYBFou1O9ZLIj3eSFdK0S6QB+OkdzgonuW1GjNPSSlilBRwoiG1vtNYsmnH+7flqhXp
	9347wZ92MX/fkY3Hr3zgbjI3k0pPTgEIqRU8P8esu++BA8GSxUblEHxa3tWYUzRmYibYZpJzOkB
	QPZlfwlzIpBTKNLKod3dCkmK7FSK8C7C5XdfEWWtoiW4TkZIjwKeNcmmmxkoS12bUOnAk1WcoKi
	D6InLGFN9cQIoYskiOTxIMECVOAoFfz4rV2JTMRZTIG3HtLDtpO7lZH3SYllaLsi0op1VIujbGu
	Np9Q69scsO85Eyg6VOtho/JMlrD2edZu0cALyJtvlet8Dhh7jo0xKTC4D0F/o7oAibv3AkhxRT2
	2mhRI1qJBiBwYgEw6f6vG8PmSjCN2I6Fs7+JVHd7pxBgKPz/ARoQuoIsEWQDu4a/j3zGm/LOxuu
	qiH1A9g4JaetdCSdVTc2XNPWkKmmv1Od6sirKgZ4F9khJEszOL9TM/RQtF10UQAuViglHRSJc1c
	kW9cLGME2k7dxcsPfGb/z2YR/uLxtnfoj7qOO4Rcax/lDrWcu5F8XGz1t/5Nk8geUS7ou39PZDV
	vVaEv4Stb2uomxTArMZbz61KVrERTL/p4Ksg884mIJm2CWw29ns=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr46618725e9.2.1794567972226;
        Fri, 13 Nov 2026 03:06:12 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm144097485e9.15.2026.11.13.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:11 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:36 +0100
Subject: [PATCH v2 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-10-faccb4685d88@baylibre.com>
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
X-CRM114-CacheID: sfid-20261113_030614_334846_7C694B90 
X-CRM114-Status: GOOD (  12.35  )
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1


