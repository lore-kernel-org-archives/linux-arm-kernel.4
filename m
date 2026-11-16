Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90884606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6Ua2UXu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTpgp70I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=; b=X6Ua2UXu6o4moG
	LbgqXrktWRKRgC/IisG31b848Pn/WZLpnuwir5b3Q0SFSwbrY18VsCm0h3CwmuVOHEWbDvu4LHQ27
	F6/stNJOo5Q74Hh6MQ9vvypf+kHcUHGO/HhlOWxVCpHMtu+UV4/jjMHSgCDXNbotvNpaK2DHLV05v
	8jpo2Gs2hTz44pZOKKcpklQ/fo4AVS7QtP38HoGfp89LeoT1Xm4lGL9+Iuu7a6t7S5uEoBejDumA2
	H1yhevuqQ8FZgRysJ4B4Yh7Q+wEj1dMt6DBIYVQY4v9LiGacI61N/1cgvRnRhymhOgEdRA6UHkjv7
	4De5EDKT81IY0BRrH8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy50-00000002wVe-1olx;
	Mon, 16 Nov 2026 14:53:10 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy4o-00000002wRE-37ef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:53:03 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3712b6d9843so2788004eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840778; x=1795445578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=;
        b=zTpgp70ID+eFa6TftmW+7RTcaHjgvnV9EZlJTIsXFZJpWs2ZUG8rptwKNnsDXZywki
         r9OSWG0bYVH8x4GvUNL3hbQffyC4u2wExRDaCzC9yIsKYfXCYGSRDawYPWVfyJtKcMoj
         GJmv5xkUy7APGmVsaxUCTtYksZfUDYvjsLkEtX3tAXH4k2nROFalLgffvYrIOmVgO+kQ
         jxsVSy5KhfROagARYX4U4goNZxIiZY42dH//BdthFzdsnjjfV58EbwgzeohG58OCXD7A
         prvjHXCf2+rRR3pWR3OiaLqk3GeaRxsxobW/RccFnZJoDUwoijblbB3gTfzWeOGu1bAv
         C6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840778; x=1795445578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=;
        b=q6MKfsjG10a+p6WipmwPPWROQahiMl1tBWbiZGFxs08Od9RZemxSFl28DNavI/4KM/
         TGZlREsgqY7W0B0JOR4pdrC7ahhSrv/1A36yHDusGe+oCPM2V0QgM9GaQbvXakSjLGpL
         x1q9cy0MyQogz9TTNFTMwnkwUgX65WJm+WlBclHpYuxstT8ytCwJaZOF+XM3UoIjBP/w
         3GJo4RUDJifRHIvBmhHfHo57D49nJ9nnuqcr+L12SmbJHkPjefuvd3dX051vFRhlOOeK
         RZtxnlvId7A9qNzmh62K3whn2KJUQ0f0vu9lEDVbMR47hNa9d4a0aaxUmG0BVx085Nxw
         M1WA==
X-Gm-Message-State: APuU4Z9rywgmDWpg1PNsiVLHrefhHWRxOz2MQ+k9Fm5YOOrpxzUixeHL
	zgZcfNZm9QEFr/WmPHFBI67OPcan8jS8mTDoZQoIKkdEpFkHR9QD2rg9
X-Gm-Gg: AZFdTZfBnQdHjxR97HGkaJOqCt92WeVHx0wcwYxEMwMyX+OeeWGHf6IxkFKJ7sTlwIl
	/fWRgi3Ym4KEMhI4sB5kQuulDxqXsVohFfOjL9W/1cODPH3eoVDWoL0yPViXNybBzgln+ktcTaE
	s7XUgoULMIbsu7+ObMrLp40Lkx71IZGLDZyWSf429i0Ig79KTo5FRSTcwcrF8Wf605YmDtVP7XN
	rYX5gU0tLKEoCQeJygbIzM5i+KzMK7uJPMHWUq/YTNzSlBf+xPdd/NSNO2b3tiVERP7jOxaMUwR
	/xKTAQt/gPVR0QpqQC9iW6oAw584j89BQAD0sqtapZFHiATOcGaDxHg8+sjSuGkCYfDOpMGJbHg
	GaIlcxLaQ6lAr+KHHuO+aVZd4Er/SxUKF5GU5mp2yab6HfgU71Z9mHA+LRLiq6ARV35of1yRfI9
	DfobHSegbxBQgD98TVkJp3JP0ajHDkPPsifIF5eiHv8hFYLkd+wpDF+6u1TBIMW56S39H9SUKP9
	RPMXAQ7/rptKmG6FBAyKiVyBZnLyxmuCAQ592kIJCTj96fuzPwy5ZOU8WQBxOTsGkijSFytn3eb
	tTlXNkQ3PEai1mhIokTZ5Wtl
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr9331278eec.19.1794840777579;
        Mon, 16 Nov 2026 06:52:57 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:56 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:34 +0700
Subject: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-upstream-greatlte-dts-v1-2-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065258_799708_70542171 
X-CRM114-Status: GOOD (  13.91  )
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

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
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


