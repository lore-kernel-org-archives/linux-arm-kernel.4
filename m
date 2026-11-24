Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89A606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VToU85xT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QL9BS6di
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=; b=VToU85xTfjyt23
	y0tfVSetVQQCElzK3GQTaaRneSn4c61YeHeVwfysdZUlKmhYLerA0tEG+Fx26U90er49TT2sFQTLv
	WNhgSnUsCk6SY7ud9ytwJqeni5oiISaTpXo96+9Lwuw3ei4hR43uAAaor0bHjCZNPRZh4uLuPE7Mx
	+OhxJxJO/SEVDFT586YNBEgFVM0SHCK3+dNvQCQVmrIRUB5a0N1iWUHaoxiqt0TPqQLZaUWw2adGt
	De6SCNeqf3lr3OZrLhdFuBjJtoklpA1tSniACmhkpV2Db0dxOgHZb9H34vtygtS99P6cPG58B2FUR
	DPF4xFuvb0RcqT1+EfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoTP-00000006J4f-0vte;
	Tue, 24 Nov 2026 11:14:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoT9-00000006J0f-1f9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:13:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so38041035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 03:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518829; x=1796123629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=QL9BS6di+7KARy90FICKAZi6eKrsm1PjHyuoULoa6v0OT7fm1+R7e12M8fOvoAVoJz
         o54A2RMOKODB/xd8GgyQVT8J9HHJ6DV3XyjCQeGvsISP8fYQhCUOpISqcMk3CHVdlmy5
         Yczjnjtb7JD8qktPz3JHmGPzAUMpVwPMjAIO9Pn+uLVVCn7+sOuYobAl05IeQ0IYcYZ6
         OouLoGkX0vpQWjsBRDlEDskHM/zVo5E00A2LB3V06bAcgKlZg2tOq+In6wYZE2xExZN3
         JXrmxi4x0GYPXkjWvSnlBeb+sA1A0YbCjbUsrT39iNKB/V1OPt+aOKxj3dH0VdRqIXZf
         Bwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518829; x=1796123629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=pTn4cg0BduEx4Ie7TDmvgsdMv+yP9q9P0PtQp4ifTv3bNyqMKFfrh9PnVfu7KEO706
         mkBCT1dyidYCRs9JTSpRvd5K/UQTxKWHF8FXPqCDHSCCP6nregnw70qTPV7snwXP9bCO
         gVbVHMe2dIVCGlDLngmUvQLEvSwjE//5Ja1uNtlJj7pppYB4Gr67xaUmI+QW2qwfiNOD
         FbVn2Q2ZAWjhvXFEbdQMvulwT2/l+kIs0wqt0uJzXQUNkqgqZAuCNUs1qEA8fUOGnEyy
         rFRsTObhIdXUaLQvdO5eRXDEpxjlT4vYQPfT8cKMpv9zL5upt6FWDwtfHLLPF0RJfyXR
         KVZw==
X-Forwarded-Encrypted: i=1; AL+hErHGZirifOBbpsFVApaUyVCSJTQ+dxcgb7T7j2AdTPqOfdJSjk0up550yYG96pY1ufVCDHeW63UWL9i5hY88z5iF@lists.infradead.org
X-Gm-Message-State: APuU4Z8zFD2O/W6q5ih4Lv6P2fysVP+vMghz9tV0SSW0dTOk4p+5hPfc
	8jZLsQMQLNdlDB1MIOLlFIUXLiAI1hzqwQjG5uFZISPZceAmxJp5NKFC
X-Gm-Gg: AZFdTZeK1uWBs8S6BjPkFAuEIvtE5TpIWTVKWeRZ/zSokSYP/uK+zYTh82S17ekgQKq
	/gB0d3gGnIVBTYMinV0QdtIp/ljWJr4RaYb9WCrl0rLPQmSMZvl61VdUUvIevAl/q2u5r4ssqoj
	1SHUD0IAJcc+2zkMID7cnU9uISMpNw6yApcAIjhPJeWkJB/g+524r6v9W7JVUt+uyIuq0/Q+2Jv
	bMskX+XQ2S4jNMyFvpbldKls9ByWFxyTMKYbQ3h41BNOJXFofnvB5DdJjA27q5q2Nk4fLnH4BN9
	C7z+xXTl5Jp6gTOZABk3lDaRbTwXQgz5yLrWJxjxUyZrpeI+SA2gHpTpmD/nYXhtmmiZy+dgKmS
	7dBFgArZYwFlM9kooXyaWK3ry5RG6/ejvU4tVV0KDTAMrJx5XxgT4abBpGLvghTMURJMx9HokoZ
	ithJ7XhdrL6zp5AjQRr2lvGbYl9vKbtzDmq6wiDtsaFVOsThqyeZlQcMWyh8TQGATmXHu0l5VmL
	rgN2Mjz+GbLAETVmXdozF2Gfck2TNgTy0kWYYMhGiFINLVgJLb1pS15HH4JG70z9O4vUvpAfOH5
	ia7NE+3uYFbqPrjL8AOtsH8dNCNrNnVgK51IfWefC+UHoac=
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr285246895e9.31.1795518828812;
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27642918f8f.5.2026.11.24.03.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue, 24 Nov 2026 12:13:33 +0100
Message-ID: <20261124111333.33734-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_031351_512171_5DB88EB2 
X-CRM114-Status: GOOD (  16.18  )
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

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
Changes in v2:
- Keep the original BayLibre copyright and mention the U-Boot
  meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).

 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..9f57d9433ee8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3


