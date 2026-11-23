Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=buDEXtjf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfj6zsAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=; b=buDEXtjfJFAJfN
	fcT3YGYZIvSjgb2i0GB5RGg3By8eFue0o+rO9vyAa6nRH9xkAuR8D2U0QEMcqM6x5UiG/RpppytrA
	fahhq90oDEDKeHcidlnd6ZCf4ur0tneRLWd1+6KunCOkgdRBfVu0VEjNgEnIxg6iP77Q85vJEU6+l
	5CoILm1yp4nsQGgLrhdB6Y75wYfdC9GXQHlaSUe6HVRO2fOo1VRY5GjphTPgYATpPC3Ow5Y3qjNeo
	465i1so4yh3gxP4keTEUY5uViZjC+xL1KAehdfl1EbUCHYaai0s8pXH7v9N+vDrJAfAvToiGlqnps
	y35ldux57DI2JpyJ8wvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS66-000000037pc-0usT;
	Mon, 23 Nov 2026 11:20:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4u-000000036wx-2Gub
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so600621266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432758; x=1796037558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=xfj6zsAizAP7QRWFijPPri5i5Au+0PlEsTbTywVkT4C+saZudCeC/GMAfHWfvCFAEb
         zoJ9jhOuHDTNvdWoUK4s0Ai02Xrtgrr8096Wcd/taS83jlk+em4RbRPI13++grjyEans
         WNBgSEnQh2BBf/O3Oup/kB+/uiQxhtbmjlmdXND5mttrhyJrfPjCNDHkM7Au5ttA/1R0
         9jbbbuNZJmEcbXdM/Q3G2qsXt6Ltt0VO0lte9LwDDKHM5vS3gCvA+iNW+ycMs0pCEARe
         pVh5eAbOg6RT40oANXMOQTXCo7eaBVW7b7dhPF1ayMWPHVGUiOSr8uD4YaacK/PJLIlO
         uehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432758; x=1796037558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=YlegdJ5MxS32E9EgY1VQMOnRzqkM/F6mCM72fN+VTeSSrdZTUnzGkWmZbaAfZydKBd
         5nWwjANjoGH3dQElhGpx0hF1NLeOgyXfnKF7ScCRwVl9RzL9Goxo8ucyOP/O/OVRBnpO
         gLwkZtF7r8HRaXgNE+C4cINRh7PxFajb85ghyHPsONOkhv9xDlgvUM7mHTPf3pP3E6MZ
         9fjiyzHnNz5NEXdFddkt9kT+VnE1KyRbH1prmUCxTc56Y9CpZgWfNalKpnXQSlOIkJ8c
         Hdps9AxZIYJtsoca0VQRyP//JN+i9w5SQNH0CSN98b7j7vAKXWFRB5a2qVJM9jLemgCW
         I+Pw==
X-Forwarded-Encrypted: i=1; AL+hErHoPsKBVoAJZklS1akJCx3Cq7RU3e9TR8bbyADPnH0y2kYycGGCkuixAdqfLczmzakCeXwruwr1jPqW+5V0Fftt@lists.infradead.org
X-Gm-Message-State: APuU4Z+p/yk99ar+H9WlPBzJgJGxmIoGAgt1kz9dytrrRuYgsnc/UW20
	oMMTkyQbKjfPlUAble13RxPm3ug6v8K01qPvlr72gh4CR/b1552SL9w5
X-Gm-Gg: AZFdTZeJhbtfvLJ1xVVwMFWyj7xvgHuelXU0yfK4L1zb9nCShheFtK5NKgQjZHxZSs7
	qjPT0H9MxAG3+5MTVeI439wKV12eax036yYcz3LK5p8bULf0faeV9ZgHl8Q570erjtluXh1rTtE
	WcHFUxI7umaK6Fbv6P8NnrmJsE+jvA6NC+IhAvk+Qe8SlOOvVd3LQ832fpV+F/4QGTXCf0AINsw
	0jFzancDDacF+endbyfxNmwEEUjadbOV9h69q6DJl+WrRUIKRg++Vw/KNMC0Xk8SCblCyydAw03
	HFy9Gr9/qliWcaBqdVTMyjMgQ5PumkjOOoKPP31xO6gEIgG1Xx3xuHNKOQl7EzomqdEjaslF6nQ
	bsHean3tT9rTlJN1hNG9FpMkhE3gys6uLqQw36CjVSpIXVw5QrB1L4rK50gXwJYz/iqiDHf+brL
	MGUSPSPIkUcIuWw5T7EDzAnlh7LL/al9S+47v68a4jOxZpg1c3Tlg1stC/CNuCX3e+YQlMy9aBk
	iPQRAwmn07L1Y1S/vZwQ2RaqfNPVrxpE8jvqMotxld7eLy6gjEAO33oavWHy/jIe+G5CvKnaPHG
	sOqr+EcOxNgOIv6sUIocHrB3NTIi0HM+BCiwRSdA/iNFVyRwianH8eael4ttT3YZow==
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr609639066b.30.1795432758535;
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:40 +0300
Subject: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031920_676544_20194B61 
X-CRM114-Status: GOOD (  18.84  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0 and the volume down key on the SoC keypad. The power
and volume up keys are connected to the MT6363 PMIC, which isn't
supported yet.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..7bfe0d438803
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size will be filled in by the bootloader */
+		reg = <0x0 0x40000000 0 0>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+			record-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pio {
+	keypad_pins: keypad-pins {
+		pins-col {
+			pinmux = <PINMUX_GPIO107__FUNC_KPCOL0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO88__FUNC_URXD0>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-tx {
+			pinmux = <PINMUX_GPIO89__FUNC_UTXD0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};

-- 
2.56.0


