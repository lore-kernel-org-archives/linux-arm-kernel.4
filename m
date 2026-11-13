Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873F606A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pmqKkWqn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxiFU5D0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=; b=pmqKkWqneRbm9/
	XIxiZQXgxH+BFpQvrws/xxF5RPXLKGnXBD0Njq39GS+T1Rfo2wdYrWH/SRZNmfVBd1Dedak7gpd93
	hXrr0OK5wF1KFIxVK4uhI+5e78RwCuE41BNRhpM2lJJt3kFPvmei9mvn9d5NEfQKiy60aXyKbIV55
	RQ32ICOmjFYYHexGn2S5VAkpa9ASO+/wqFSrxSp7x5nYfIlgJvIGAmxqpqk7anxc+z1syvdH5g+Jm
	DsTCqfyWLJt9vrBYAaR2n0GWWSqKdjgjjya3fplR0CrCKX5y7X3TruSQNPCrOf3Y4QDwCME1ybw1g
	VECInGgoXnb2pWpZVF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwdo-0000000E6WL-0k0E;
	Fri, 13 Nov 2026 19:08:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd7-0000000E5xd-1Qm3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d427836e9so221892366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596888; x=1795201688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=DxiFU5D0ikMi9POe4QRM8bAu5zzA6nVKikpeFBFWPRhmLBgtmNLo4GR+S4BvCwHns8
         gJuuyMDqKh8TqMUQ5mdzIoflJYISaQ9k3wfto7/LcR3cBQbm6KZ8T1oGrArcy4Ip4iPs
         w7del8y+yWVH4+WesnLm4hF+FRrvXWGo/h/sQPjy7nKEhTWsJiutLldVphKI+CPAzDth
         IoqS1pwNKTTTsCA34mWxlbqWLdCOega3x3oCOt80lMldp0HKLu/35XOyGyyBaWF2a1WS
         uRZBTwoIho1kbsAJdQkdSMs4k7X9O672bLD2YjDsnhRd7eNmdjJFHzE6nz5HMAUZXUNH
         mBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596888; x=1795201688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=lFO0piRLAGHWm2gxOFb86k/O6W1hg76LlQAnNvld8EEq0dqPRAXELBa6HAXIIgUqDc
         +At7YqFjPrCPOuGIb+7b73IWbjyOzRDcJcwnBqK6v0vNoJuD2DL0TEqjlfHLG5WossPx
         QyGn4zO5hbO0wvt3WVOmFtmaqujBqGCf6qZVfdf7G+mb4IrKLYoMF83Hrfh2HxwKMkhA
         owmYXBZUjZez4apM5c9ZXrb27BECdN7yiVzYRFT9ai+hHahcuNoiR6G8yG9k0U6k0BVA
         lJFsw6ZgEKoTdwCLnjvN/7ydfZGU6WM8ORir6q/jWf5cdkrIszHQC8B2oO+gDhjFzCVH
         DqgA==
X-Forwarded-Encrypted: i=1; AL+hErFD/j+3KKsI4q5x+yipDfzFVr4rwQsEXAEMSTofJlVyaoCd5jEweB8YTuaikzjI8+aW5vFL0QqOJJ5pL30+YLIo@lists.infradead.org
X-Gm-Message-State: APuU4Z+Jm7bW9jrU+UPwUgh++M1B26hjz6o4dRf1mmtVxlHA4MWS2xR5
	IkY1qoE3TYXHMUwX+CNxlxJSmQKivS2hkSM9juOobnPtmttWaqBCU8oS
X-Gm-Gg: AYBFou0HPyArgz4PDatLZ8wxCoVuOnVIwB6sA4mYL8b8GasD336HyV9LVom8cXK3ncQ
	MQE9sO1tLT1EZUlYh98eG7bu6cc92oqXeco4iRSVf7aIzRtxOCbp271yQI6tR5TB5WL68K5INij
	vloWGefZQWtiFTz69POair0H2C3jFOYJKHBd6wn+lWXuidIjLYvTpEdh/o+E6aUZBNGIlV7fld2
	BeZ8Z90Bim/YV51u2QlrxP3ZmypU4tL62mxt7NKSb/J1Po5NKpH5tRu9eONcaEaEMHUtBhgNT4R
	s5HgSBGi5YlqnY9AX6QEc48dNClDqUq3HTn6/9omHlhZiNW5UHm2ARRcv0TwVMZH8DKyDA3Qy7B
	Ljieb0pbL9nZf3ylY/YYTMe/rg2ZMLqM+AfXovBBQ/56XLA3CVPEmUAXLSinK6pSYrjx4Vakjiv
	N0pZkbWSNfct/3QZraQDO3NboSoRYQHSGIbeqAgjzjOYzo0Osz/Xij9j/8s9XD+QwrqNcFRZe/e
	9IMULO3Pq1utkFHkaWfmKZ6ACkQWSA6eAHznHGUqQOp4MWJQOMZ0cqq23qX5lzjmjCZrlxUlxrl
	dxqxSImM72JM/TF+k7oYEWoCu8d9Yx+6vtmlasvoz3s5XhXX9sziY+n8CUuBV31C
X-Received: by 2002:a17:907:8687:b0:c46:7645:86c with SMTP id a640c23a62f3a-c509641d1eamr287876866b.47.1794596887578;
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:05 +0300
Subject: [PATCH v2 9/9] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-9-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110812_233233_357C63A7 
X-CRM114-Status: GOOD (  18.91  )
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
index 000000000000..8d529062eea1
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
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
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
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
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


