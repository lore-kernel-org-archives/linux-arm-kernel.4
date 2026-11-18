Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PZHZN+aM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdshEpb8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=; b=PZHZN+aMBoodOU
	/E16QNHyKOliX8dtIUdG3ztwOLsvwsL42FJTWdil6RSlmC8i5ZqkgvDnh0cH/BM6O6kRedl3X9mes
	DVHKl9BdznhaIqV471j8J6PI2NXvOwg7sclIitCfNlJOcyFfeHxs+ko1f+eH0ALfFomumaL10vhAq
	xFhcmIYBwx4cH2+6TEawvUjVvIZyr5NigNuTHQ4QpLKRYGocp87dIGeT9XZBpGYpJEBOJXvsWxWwZ
	fHwn9Foae8c6MEwIr7mUn/ICsL1vRqTWDCmiGQWX8xMwKzvXJRkIMSAJa8j0aHfWdQwWKex+mz88S
	yinBYbTv3O9+H5fHEsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGQ-00000008COV-22OX;
	Wed, 18 Nov 2026 08:43:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGL-00000008CK0-32Z4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:43:31 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-372bdb942dbso940019eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991408; x=1795596208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=pdshEpb880o0ZJQOjfkuHdAEAELTjlREvFVOe7OuZFLv2m6gVSZB6ZbLJ0cbb0UcEi
         KmXIpJ1UxXEZI3zBW0maJE/D7UrPbd0WZa3124AeyLf/oAZ3BZQuRLpTLx6UwEiAwHaX
         Xdc0fcIFi3KX5Tq5XtsKwzq3R0PD/bi8vnmwTj8xu4e/cYzDv8eiAIU1O/Xjro/CUejO
         re1NO9Ti4hac/jZMeC13rNqYCYAMcxGgaz7jdW1WJZvvyIbOdmDlBL7uIrrJcGdiS/Jn
         2SjwaIY4MkBvq2kZOmyDADjgTICjtLsdw3mPm1R/ZyuPyBIXdi2Xp/VDtZmAkRCAFdeD
         p6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991408; x=1795596208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=r2nyKElEHZVzhRiXT2xLk/V1S9uviflr0nEzDwidiJdLmeNlhZkwvTEDo4l1g20mTt
         pM+fD2r6fTpeHdPZvscBV2r7UQbgTUAmYJFyQNwhjH9QXoC1eYBrMwTcNeP7+64S4rhV
         kB3MGQ5+49PcOAkdsNBvY4FYP2NZNkV5hWIH/L7fZh6Pyv8iEuDBJS77os7EGZ8CmUy8
         1Hs3eJcZU8b7T7DWYXYWpVqkpnChEe7O5Xn0G2k5xboI+HsHsqa90M1lczqm7uachkOP
         1nVUizUfXmq6SclmRjaJ35TT3YzC3E86hpGQ0gaoojvnNv4a/rHgE3ergQb8ywPwD9i7
         vXOg==
X-Gm-Message-State: APuU4Z8YY8IchUPwiP9LtIiS51uROUy7oaoa+Vx+I7QCS/Pd387La1QH
	qvKObNki99mZeIXaA3ji7Rgqat6U7t0z3Wn4BGyDhi4Xwn9VrvMqJR3C
X-Gm-Gg: AZFdTZebdpTlllAXH3IdWpl+DT4akw9Ijd23DVtcjnM62wW7fVkBXHgWq/40JnINobd
	ec99W6u6oWqKo/8Mc55DzzQ3LqiBWVGw9Dt9YrLeiWgfJRxGUO/NEWcO7pGk60jQhDfyYvJbUY/
	aqQhtrzWfLt1S6cNerN4mt2kpjngiQv6069VHzRaB0giGfV4dd4HXWLEMJgR43vgNnHyOsmYM3M
	E++SpgR27iaYQhNvWO+YDvnyCRoBOjBjsNPFR4nB+3Gq13V4/Q6G+l8BcbqPYqxc09BaKqMtcZT
	9AiQmMO5CYwDbLjV9+aSbRKVfQ3CeRVCxdIh3Z88E3qBZ6HJ9LqrE9L8iv3w5Sqxc7Y+nW6ZF9W
	5TeM8s9CvZ4NZesXqqStAmd+AUc8DVvlEn0fAd51LQnmcISbh1tlgmX0uWePAyPs88BJ8h21oSg
	hZm6psGQmbjlFU2oEZdDluM4/EjRo6i1cdjRcgPGDvwc1iHgu9khzYVw3MD7wPGunxsFSEZPBtW
	PQJbdN/qgFUt1rGgFFmrT2fB4lpJq0CdC1K9iNm1HPVkJGraNVdMmouo9z/9HTx/3Jv8EVrbbdu
	pIrTHo4VMu24JEuareyFTpJGZVvEC7bufXAWmF5UN5aYzOAQbRNp2kWSUu6Z5MvyrZ6QyboEwa0
	DXwSOcw==
X-Received: by 2002:a05:7300:d214:b0:382:42a:d3ea with SMTP id 5a478bee46e88-382821d53edmr1784295eec.29.1794991407621;
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:43:00 +0700
Subject: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004329_811351_66CBE47E 
X-CRM114-Status: GOOD (  13.81  )
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

Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
8895 SoC and a 1440x2960 Super AMOLED display.

This initial device tree enables SimpleFB, PSTORE and GPIO keys.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95cb42..1faf01dab180 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos8895-greatlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
new file mode 100644
index 000000000000..a7cfccd59bf7
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy Note8 (greatlte/SM-N950N) device tree source
+ */
+
+/dts-v1/;
+#include "exynos8895.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy Note8 (SM-N950N)";
+	compatible = "samsung,greatlte", "samsung,exynos8895";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		/* Bixby key, mapped as a camera button for now */
+		wink-key {
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+			label = "Camera";
+			wakeup-source;
+			linux,code = <KEY_CAMERA>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x80000000>,
+		      <0x9 0x00000000 0x80000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0 0x92000000 0x8000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+
+		framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};

-- 
2.43.0


