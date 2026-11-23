Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B19606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4HrzwimK;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XfsWFLII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=; b=4HrzwimKf1mykt
	yoRE6No4WOjvXE/65hHYuTN36r0Tj/ehYRoVkCoOkZi71q9ZJR7AXfjqnGDNiCP5pHGu9yQE/Fjug
	1hz0VSH+zaVXarNImoB7ERQ7zL5rjJoasY42pke2ukVxemquyhnTW0fzgIl21ZkRk9Frag8ispHIv
	fgaD04GfvID6E20rN88VBfsBKWO1ZcT7P3lAqE6xCwGmpCwbHIcCSpgttaSKwdxA1KOB8kLXs8izE
	FFnt6Ux6Aa16+C4tkawzjAWnG9GP40iCS3cRJks/DA3mycHIpzA3d3cgoX2wGQclYCl+yITy1memu
	DXuW7W3+++e61fXnWLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrX-00000003wc5-00Is;
	Mon, 23 Nov 2026 15:21:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrQ-00000003wTr-3SpQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:42 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5494606a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447299; x=1796052099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=XfsWFLII2r476pQL+UZ6RgA3FpZ99EjdVczjJWNV/ykDXzUmTT4MCMnTYzIml1V+v8
         FmJ2kSsLqBcAOIOCSzKCCxiMCJDuZipEjvEK/9EgZ7vh+RZFk4n7iDVAqnqkCRC4ntRT
         3w++TBGbU6fd5pusZDX7KHB3cypEBiz8Ju0XGbOlpn0w6HKNYBbUSoW52lp3Ij31bO2U
         axelvokmwRZa9yPe+OiFrenqo9xCqZCzj3OGKRFRzUVFBgV57/rrz/96M3e9MY1+5qAW
         bT7gDiQxRVZqrUUhFlo+is9kKbnXs/FqvpBjRUu00P5dSKrZpC/ouTMcTnuVW/8GcuqE
         LQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447299; x=1796052099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=ed8gLZpgDbaqPdw0PMZyrQV/CjRKdR2qN1X6XdRPhGSjKOijkOcPHzYt3kpLw7tH5o
         QtzpLtzfOSof+y8gizBtj7d4Glo/wWye4DKgfC/gV1R1HtVNdiqKczP2bu4NYjuUUkQq
         QzTVmZNjsqoAQDiEd3V6LaURHx83hhfChRneMqAacJSJ1ZsekpWAhujbP9zodr6VgwNm
         x2R5ZbQ7vDMmUVdFPnZXsoNmte7Syjdk9hZjl73Da8Z4drTwKf5FggoZ9pFvkFRcMGDL
         CLMz55CW/7LRZZrkBvIKcgqCjomQ8nxVri/LGScjuM7uUOQIeNGULOlAXqfrYn9d17Y2
         dzhQ==
X-Forwarded-Encrypted: i=1; AL+hErFLE0u+dDWHQ1+W/vG3EjMPw22BjQPihIQrxhZ40ksrrG6nWEb5aXj07PEZ7qTCkXFJBgxOGAVP2UnXi3eR401T@lists.infradead.org
X-Gm-Message-State: APuU4Z9/eZeT7Kg3ARlsPSrSpeMzwMM8dqBGtUxo5R0XHsXaWF5fxKg1
	DBYZuFnCuhmLDd/cCAj9dl+UFABLjMzDRAgBGD9rHXMMnaZHHSMp9jOgWDF8qZVHw0E=
X-Gm-Gg: AZFdTZd1expkbBrCI85LxeVYfdkZtJ/ttYkj5cKwIUL8nH+a5BXTOkkaiVTeJjwzI2C
	XmTDqWsY7T5xU9pKMzZeCOs+G4LrOQCSJvT2mJz6O5T93XYW7rOeJqbEA4NGj1bECNfvH0cT3rJ
	4QQUWDQ1FOxmu+QokQc8vENeDN3dgaSZPb5srkHpKu+ycx67UVStDk5eZI1SVFpfstzOrO8jpVu
	eH0m6Uf5YUKM/mDulC93oheJWLtB2ZyL4pBNhAhF+VJLPymNElRDhNuM2l7JaC6NmEU63QGWufh
	LoTXo8wB1aUNVqeYuNgv9dlsl1+yWIzTuJTG33D0EF9T4BOcBbccG1pP4sJ0Of4iLs9/I3PwGp+
	+BCL0ijTq3s+NslojmwH7UHl7X0MlYBvuqzlRlJjYlp6u8UvKjSlThi045jymHflbZUabNrcqYQ
	/dquSTQ/+zfUiG1HUOhdI/NfCro6TVIT12pXfnU0AU882rllPy9vd3YJWpGHQAP/KRfKFf/tqjd
	2/Te9gH8i7ueC+3sSGUuXs9qj3/42jgp9gkdsgNYdlwbglT4G0YfIPA2K1GyHxSGPrgIwGPYrLw
	MPzaPgWFmV86nrCMi2p5iCtXLEzmWXUgpFFNzFZlYT8+EilNG7M=
X-Received: by 2002:a05:6402:4004:b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6ba37e6f76amr9086912a12.32.1795447298876;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm22884229f8f.50.2026.11.23.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:31 +0100
Subject: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
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
X-CRM114-CacheID: sfid-20261123_072140_901462_979F96B9 
X-CRM114-Status: GOOD (  12.50  )
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
 drivers/firmware/arm_scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
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


