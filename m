Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F8606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PQ5zlQZ;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Nm9d/kyf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=; b=4PQ5zlQZv2YNjU
	KvJVVn8kxbKMjYb6m4fWIqvn/zYwhX78vpWLJNubiqNPohXh22UyFJgaz+j40nVqgv9dCGifxNFM6
	j3Bn36mUxyl65e+Acf3sWpW3Nmz4LigicacHo6U350WUByeqXo+IOh+3AMfl4CKzVGVnm0Tm1nIXN
	VYf2pT3xiu2Umr3Mbwpy96Dd/waz+4RSWcNyf3o5nFrTBxN6lMOFRq4IXzNPdmSKn36p7edV/TLO6
	J6J1JvJndydWpbxY46LBTs9HZf2RwGxyZW5wHL7n4A4/qx/+T3R3sv5/dHGzOQCMdq/y1doQfivr9
	rEPObKz4bVdPVMC6eJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp7A-0000000CTAp-091v;
	Fri, 13 Nov 2026 11:06:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6e-0000000CSth-3nQO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4b467581b98so6014185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567967; x=1795172767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=;
        b=Nm9d/kyfKjajgLN2ikUbl1HVUxjXsrxtHCxWiQI3RHlfeiCjuPlXU/Q0j/s7rm9Eqj
         Z0cwCIz7taAXinsobzJmIb+VpLmfbHooEtsP6b2wJ7CPLIuTvlXvAFYMLmuu1Of3l6Lf
         Lx5K9EFPy1g40MO2j8Oy3IFe/H3qJ5kalBet8Ou87kiaIW1MiIAEgv2wkGmkgwU0UaG6
         RuliGWGZDuSuPQXkZKnJ9cHSOF0z4TXfQhvGj54WRRPZxi6HmpGi9e48UBlPku8Do0XD
         jpXxsF1qetEWwBiQbfb6jnt6S2kNIOpPYx9pWWvxjCa02fWp5BXwLRmoJp0U7OTBwsvn
         x+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567967; x=1795172767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=;
        b=Y3QdVNqb8XjlUj5J1/zRn+6Flx2G2ixZ6CBW0G2d0wLof/kdEL2C5bJG0qvt8R01CX
         BTYg5qcw9zhjLp0fO0pT7OpXyKuNUmP8p8UjpbKMRmeGU4hTEq73D0Om3RQ1tyTGw2eT
         lGV5mTe1mFoQwboa8H7/NnX0a+uMFyElDrYzjpofbF4O79Oq8Vh4Yydd7Ya8GaOLWYOE
         PN+sK9uDSpsfSm56tcJgag50G5/tTvEeb+E6Z7antFUyBJy/j+3r8PuZjgVh1/I7KVt9
         +JxFDgHlafX1P9o3QyPw5KzmvzT4Ida89bVMTmOM3Vlljmk4QZewMZP59MbWy8FY5YAt
         CeOQ==
X-Forwarded-Encrypted: i=1; AL+hErH2z27Y90SHXPfMTVT+MLrRdg5DhcdfasCaL65vgKYOGYTzUc0lYCmdG5yjkxt9qLfMos/5msDEwyh/FbE+LEpx@lists.infradead.org
X-Gm-Message-State: APuU4Z+lH4YSzweDCnUHerQJLmZxwX5iLl4ma43RXNVF9GMHT7rhAuOw
	lQK0Cg7LbX+G/D/A48SsM9TwX8GL29f7oxgZeioEoHEISredMSBohrcHrn774wq2808=
X-Gm-Gg: AYBFou3GT3A9nfDwgLNLwWxqg9kTBh+zLifkyilosS8UIVzExqUJyamiGEXy7javSJD
	Uiy+yeY11/uXmEFkKhjdhlklezKZieMnjl3wiJd9RuksKNZ5hhprq+3gj4m3ZJNeCDMEk6HhzC7
	ntIgDjqrHXRlofWt0xT7YPVhEz4qDeUMn2BmcNx+ni+H8oSwTv2bImkSfmo13y4rYbDw2JevEDX
	moWLxfHApdEEkV4idaDrhZyFGj5tEkfvO/Iek5wXA0icmi+NBUzmTE80+K0oshpzXU3m8aIe73P
	/u+iUodxaAwlISUfNPNEommgwSitFVWZy+vkD5Ftnkz1+fliabSFfDPnUrrrboRzhnlZDJ+3CbT
	9jtfpLCGifADSHTijACNgUFienWVRb0xIPvaiMMeW4vN+hhFL/nRdOXNLELl4zXiJDIt1E8rR9k
	f4Aq8IDbyPHu0MjJa7bXaO+zWPsf7dISB7WDduwjNCNnEe8vbEIViOj1WEFo0gWOibhyRVf/jfi
	xD/E+1uga9UEUfKrRluhJNFf15MR8fYZ8c4PKr4BgXEEASUZnoLNQg6XngXgivmqwXsbcWpRZo9
	VGxwtgaD4DZd3d7ePQGbvFJ5HMSaBnu9eJjVD5wkED4q9x4/JM9niP8KOmXCE5kt4RtlP1Ym
X-Received: by 2002:a05:600c:1c17:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4bb55abc204mr50450745e9.26.1794567966971;
        Fri, 13 Nov 2026 03:06:06 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm51822975e9.13.2026.11.13.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:06 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:32 +0100
Subject: [PATCH v2 06/11] firmware: arm_scmi: report the pin-only and GPIO
 flags of functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-6-faccb4685d88@baylibre.com>
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
X-CRM114-CacheID: sfid-20261113_030608_982238_4CBC1CF1 
X-CRM114-Status: GOOD (  17.43  )
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

Keep the pin-only and GPIO flags that PINCTRL_ATTRIBUTES returns for a
function, and add a function_flags_get operation to read them.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 42 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index b071d31b5c33..1bc4bca4c48f 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
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


