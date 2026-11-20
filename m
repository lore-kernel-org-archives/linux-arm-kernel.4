Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F55606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UaQgHV4Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdeecgNj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=; b=UaQgHV4Zi5Kafx
	XXFpac1GRW/lf8pjMYmrLsaBByiS+SUvLse2mHBc07oP+Z1Og9IU6GZD2mtR3ieK5tZieeR48pR6L
	kzPXP4b63pdgGPbIz2m3Bf5NrIIw3BghxUoYyTOtJRHRL/0KZPgCvSa77NoK63hWGD+0tjjgiqFZ5
	8YbrZj+LY8FkIxXcbNxwnLyadT2V8HtUj2x6PXC94Akpj4tQmvMYVW0gBSsG5gPoP//IT5UXTHJVw
	L3ThDFKa18lYHjH3rfVQZ9eKlq9hNYk46wBymjH//tXmMLm5hrEpC/QhKFDJOw4L7ZQIANZuQP8B4
	Sl3oI3A9A56iT1xm+Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNnW-0000000Ey3j-1IlH;
	Fri, 20 Nov 2026 12:32:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNnR-0000000Ey2j-3OpZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:32:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so484309f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 04:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177972; x=1795782772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=;
        b=tdeecgNjNTgMuJkrYsporl6rhqbggD50HuVs3CcYIQLuarviux/vE/Sgt5UErYbLtS
         GYijxtd4BqYj99QHAyzjX7znoROD7bpZEaY+p9qGymY1OvvlziS0piGolfLJhsE3TIXz
         xLdSpxnX6J1AZyLFuMGxCX5GVpW58om204aOUyvnOmKcEKXj0r9VTDE3vTjpZbb90a3w
         Uof4BF4Kp/FIlXtssJ8lIJ2bzZEG3DIDq8R7CkIMf8n7AedaH57osKpx/U3J74ptgU7/
         HpI9x0G16lwe7fM3af5I3h3ilw7up/+r0k8+jVTmgIABXx9xGBmX1old43NJFHZePSod
         dBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177972; x=1795782772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=;
        b=o5DqcuXEqdBSyf6AA6joB0MxvhkB9zOO5i0C8r51MIh0E4XDcdbemAQqkFUyV2awct
         AsawybHALQwm97Gg8jXGhPQnEeCbIS+BhT9ayT7n9RdkGHIrGfoAY57YQcrmsyEopya0
         QLwe4aRuNKt3Q6SCOi3rYF5KZnWLNUgl2pw4fsTFn+3K/q5+OP1hOkkkIhWZ5ZDFmpw+
         3NG7PhBc171W6atjpjvZZbOTOLcsVYxD7ykDkdNa620gm8J1O1HwWcQxp0I3DemylNc/
         2mTUyOZsAoXUb5MBDXmV0+YKOFYxNdoDmJKsJvm8nXAJa1cXrW7keqltLSUI9VQ4G2tz
         ZNyA==
X-Forwarded-Encrypted: i=1; AL+hErFAxgsM770MwaklVez73RspZurURdclHy24/dkC6NfS4skzCNaWvLshOFcoq7PeYbMqAHZPKjHkGXdJua36T3O8@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZYaV0hBn/EVuwMg+2GWSO5+0T3t8TLKxy6VVnfjVwhwc4qax0
	MB1NxZnf/V+7ZipmdIj7rBpHi6v2riHjzHPDg/m6AR0IzoysU11w1R0xshhqqNPW
X-Gm-Gg: AZFdTZd5CIcebn3lSxkgNLkr+o2Or2TWqc1vUtPEoW4+eNl5reQKylDrRp4Us50OA9t
	AE3uPTvIyC+KiRsCSyYYiBld9i+s5mieE2l9mkt9IQHlLf+APjmVqay4Y3rEiWDQGI5l6xqZlQv
	GyYSLL3lFwzc6jD+U71YjidSYZpXi+cBJStKX1XDnmQgkdRr5uzMB3JBPETRIksHv7kfUqDITIt
	QIB0yYuzQz731T1iecExSvrqt+44Xp5CxaCJYDzu0JSOGoJqsL9MqxXcmb2xosfmM/k3kdH0Zse
	s35GuGy2xbtMj7xiWm6BsaYLd37AagAuNV5Yn5P03veS9n4Ap+1lRyLKcVLt/gCuVNZ1xbF6vzk
	1rDOjHKv8TiM78MHqTohmEsHs2oJnwGY81ty9bjuY2WhXaihyihfaIO34eH1XHG9R5wA1Lma9wS
	9eMQTaU7ILOMzmQFTETLtvA7QIsupUUPCWLskPHBhTTCl9pl1feaWr6jHQarmlaoXwpQKz1YBlO
	bSVe47hupDjnEoT5v27eQnixZrDOTEqEy8EHeRQ66c6ws7/uPiWm62p0/Nd6rSOZ3ekE2wxKuMm
	QPFKSBQ6tKT1uQPMeRc7oaFZEyuvKT9cRydUwrnpz9HwhygFvs1NbX+Gi906SwCEmLMM+6JE8AF
	a
X-Received: by 2002:a05:6000:258a:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4abaab633d2mr6296799f8f.5.1795177971631;
        Fri, 20 Nov 2026 04:32:51 -0800 (PST)
Received: from debian.tailb81abf.ts.net ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm4968496f8f.12.2026.11.20.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:32:51 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Fri, 20 Nov 2026 13:32:50 +0100
Message-Id: <20261120123250.1417061-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120113555.1402132-1-midgy971@gmail.com>
References: <20261120113555.1402132-1-midgy971@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_043253_865627_46E99991 
X-CRM114-Status: GOOD (  10.05  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Midgy BALON <midgy971@gmail.com>

The ROCK 3B RJ45 jack carries two LEDs wired to the RTL8211F PHY LED
pins.  Describe them in the PHY nodes' "leds" subnode (binding:
Documentation/devicetree/bindings/net/ethernet-phy.yaml) so that
PHYLIB_LEDS instantiates one LED classdev per pin; the RTL8211F
driver drives them in hardware via led_hw_control_set (e.g. the
netdev trigger with link / rx+tx modes: amber = link, green =
activity).

Tooling disclosure (per Documentation/process/generated-content.rst):
the DT hunks in this patch were drafted with AI assistance (Mistral
Vibe), then reviewed by the author and verified on a ROCK 3B board:
the two PHY LEDs appear as stmmac-*:amber:lan / stmmac-*:green:lan
LED classdevs and drive the RJ45 jack LEDs via the netdev trigger
(amber = link, green = rx/tx activity, HW-offloaded to the PHY).


Changes in v2:
- Fix leds subnode indentation (align with the enclosing PHY node)
  and add the blank line after reset-gpios, per the Sashiko AI review
  and Documentation/devicetree/bindings/dts-coding-style.rst.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 9eef59ef7d07..9303242d20cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -605,6 +607,23 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+			};
+		};
 	};
 };
 
@@ -615,6 +634,23 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+			};
+		};
 	};
 };
 

