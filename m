Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E8606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRxeJPcv;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AwIcOZfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=; b=BRxeJPcvFLY8LQ
	UCNMqYxhF7IwDmV2e/HemPE8vclznqVuGl1XPuY/dBr96ucWA9GC2CUqsnfRDTtw28Sg+uvS7Gfrh
	LfF34q9GD85zT/s+KWjh82ExEk1wcbRlL1Dydb2i+pfm3UcALvdjPjTAbJK6TPKqUA2vtwQ70lfLT
	AXg4Fqr0nD13fAg1iN4tAanwUn2A3qn12C9PMCJlxsxsJI5HXXo/tQpgxBpHSf0MCieGJio0p6Ykf
	A8ficW7S3jaR5Z9n7H61yepIFQgCI54RYQHZfBFOLbBToCXUy8FEIejpxyi1i148oGLKyWqAwBOq8
	aQdVFqWralNA32utQzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrU-00000003wXD-0Dar;
	Mon, 23 Nov 2026 15:21:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrM-00000003wRP-2ikO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so28803885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447294; x=1796052094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=AwIcOZfF5EHbjpJSY9Rw6JcnK9LAEkEBxRO+ph1uHbkWKvs6V3scNwPDyMG+LEsEhQ
         K9nS6i5em+xzfFAtAh8EOPxFJ0r7XDd6hQguyIf9jEal4JRC3nHEY+DZLyQ/MTpS+Jdw
         PwaduWUB34D8xDLg8dVGUujv22EJgi4fkfitAvx202xlpHni0SSStI6NjmW3UduDThM+
         /tbwe0LbiWX/IN8yazsr1TIcJYchd1eIuDmFHLR3eLDmqX2IRf/tQWf3v3oVlhPez+Rg
         9g/sbFQBU8abqjztzNPEhLIHGBlyHDnMdBnnVj8EJ2vf3zd+487DBZr/dttX0gXk4IYz
         mUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447294; x=1796052094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=PSWIvb5tBNVWGw0b1+Y3n/FZ1ukXJL2VE9jc/7s5mutoc+18w6ppfXCIH3kmHfJA+J
         4u9XzerFHOIIHDUzjxU2fnAJJu8lcjjiwX1+kG6b1fu9m9sU9sP7qua6Cfd/wpMDQ+DM
         FpCvKS/sSak1D/iViIuTzZgc09rmjh4HsO09rjejHk2XuOjZZJBzE300gthdRFt+7P6M
         CQfLv2MFdHXvgb2+Y4m3vm6H2P/08InJ7KxchffBdWWd/2IFzbs5hX+k8GBxYqE9junU
         7pLbZkLx9AgbrFi4hgqhy15xSElRHoQhT1zjX8K+dw6aQa0B9vW+UNpNou/qdb8lve6U
         3k8g==
X-Forwarded-Encrypted: i=1; AL+hErG5WXt9MuZhGfz/RICXSr1frpeXZnR/ba/o2aY9z+0YTkprNxalOssKBch2b/ZF+uFWYxwn50xeNTpNG+yv7SPs@lists.infradead.org
X-Gm-Message-State: APuU4Z/kP1pGz+2Nz2ApxKE1k/UO9eInxealcbFSi2lNupDkBMYH4BPW
	E4uwHXNh37PgSRXsjehfPoW3CvHtVc+YGH3XJPDHYbiEniCfvYPH2SGbSmuc6Tp5p9Y=
X-Gm-Gg: AZFdTZc/zcjRN7UWwTWYQeTDbtNIgZWjd32LVjxJTjJBChJBq9AkwLp30/2mnJbc/a9
	213TtCKlUgAHeJYwR94qxkKXmRF7XZd9vrYvximGFOT0B574R08F5+a46KImzckjQcTqBTF32D9
	RW79Oy7Jwc4+foHJ7gpCX8r5k8Qa4JBtL+mh/d/nyTEd3TiXR1dQgO+0uC3Wbm++6yBTJysdCIY
	6c4IqbQ3tysfV+zbJSEiuFstdtfQ8DihjBW0m0bifyrES7eYMkCkdz/Ho23xd2MRIJSqIrVT8AT
	qJ9ryxk7f8vCBm9qRUXuTzpPFG/HDZZi5HZNvXeLptXPob483y5ej1IrfeAG0fdq96+MOP8sNzk
	zdp6q9odvyHf1IezzGL3oKQi98H7G2+5IuLyqnHddMJJbaxyo3M9hTbMH2S/q8l3ewAG4FXyAQD
	uLuNDG8daosY7NGeMwkKRub3v2CHzdH1GoWC5ViWqVnw6IDDv1a6mDtAVEM3S2n4cW2RmZzW8hw
	0xSX/srZ7sDSIo2K1y+E2H2JIyF3A0oiJlYu1j2bTy+rxrH/mj0+KYWJhHM5DzemwIbkhoHgYK3
	7U0LjGYRnvKzL9IXhFE64BOklwICIAS9BkxoyxdvSc0zJs4VE1E=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr217009255e9.9.1795447294554;
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133041265e9.3.2026.11.23.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:26 +0100
Subject: [PATCH v3 04/10] firmware: arm_scmi: report the pin-only and GPIO
 flags of functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-4-d61f039be008@baylibre.com>
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
X-CRM114-CacheID: sfid-20261123_072136_763456_C29A84AE 
X-CRM114-Status: GOOD (  18.05  )
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

PINCTRL_ATTRIBUTES flags a function as pin-only when its associations are
pins, but the flag was dropped and callers took them for groups. Keep the
pin-only and GPIO flags of functions, and add a function_flags_get
operation to read them.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 42 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index b071d31b5c33..1bc4bca4c48f 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -27,6 +27,8 @@
 #define GET_FUNCTIONS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
+#define PIN_ONLY_FUNC(x)	le32_get_bits((x), BIT(16))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
@@ -107,6 +109,8 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool pin_only;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -188,8 +192,8 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
-				   u32 *n_elems)
+				   u32 selector, char *name, u32 *n_elems,
+				   bool *pin_only, bool *gpio)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -219,6 +223,12 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
+		if (pin_only)
+			*pin_only = PIN_ONLY_FUNC(rx->attributes);
+
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
+
 		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
 
 		ext_name_flag = !!EXT_NAME_FLAG(rx->attributes);
@@ -614,7 +624,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      &group->nr_pins, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -691,7 +701,8 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->nr_groups, &func->pin_only,
+				      &func->gpio);
 	if (ret)
 		return ret;
 
@@ -753,6 +764,26 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int
+scmi_pinctrl_function_flags_get(const struct scmi_protocol_handle *ph,
+				u32 selector, bool *pin_only, bool *gpio)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	if (!pin_only || !gpio)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
+
+	*pin_only = pi->functions[selector].pin_only;
+	*gpio = pi->functions[selector].gpio;
+
+	return 0;
+}
+
 static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 				u32 selector, u32 group)
 {
@@ -773,7 +804,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -821,6 +852,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.name_get = scmi_pinctrl_name_get,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
+	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3f7cc35eb861..072190e89064 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -785,7 +785,9 @@ enum scmi_pinctrl_conf_type {
  * @name_get: returns name by index of given type
  * @group_pins_get: returns the set of pins, assigned to the specified group
  * @function_groups_get: returns the set of groups, assigned to the specified
- *	function
+ *	function, or the set of pins for a pin-only function
+ * @function_flags_get: tells whether the specified function is pin-only and
+ *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
@@ -806,6 +808,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*function_groups_get)(const struct scmi_protocol_handle *ph,
 				   u32 selector, unsigned int *nr_groups,
 				   const unsigned int **groups);
+	int (*function_flags_get)(const struct scmi_protocol_handle *ph,
+				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,

-- 
2.56.1


