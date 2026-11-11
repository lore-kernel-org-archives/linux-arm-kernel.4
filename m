Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ec4f+9td;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=soc5S83L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=; b=ec4f+9tdWUTM4F
	9lI3qosvcon6WtaYVBds755EjJzx0xC5ex3JPVgJnYtztrRLun4/yrO3qH2+ngqceIy6DCBFJzXr4
	5mQ4ChnLVJ13NoRrrGc34dhLvvIwWu6Ukct1uo6Rr/AwoCmzUdQVOenwzhPSBitbCeUeKGBX7DRE4
	L71ek/oIPZMFw3XlbD+JnQUE3T6bym8YJwn6JtzrcMzIrI8rVDCQfiq6xbaXXfd/RGGlVRAQ0tC3N
	cUEC7O3AGTqA5BCkrNn7FzDuGO3rfMMjMyrnbLlgIAEblmmN88Myt4JeobPQCyV0KpWlPqiv00mqn
	nHO/8ytlp/IKWgXFVxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcy-00000007Tsu-19Fg;
	Wed, 11 Nov 2026 19:05:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcr-00000007TnN-0Yl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2770054a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423892; x=1795028692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=soc5S83Ly/8NUJrCunfnapamofpWtLsChNXqpW/9lcMi52mi9RpkakLd/Xi6NaUdR/
         Gj5Kw+wJmYUDpr2ccCQQiaGh+eYDq4EADy//Q30/kXJEZ7mjwxoJcJGv7GIIj7jLsWgh
         4+e7pJeUR7PPFWFYoVLAI+iDFB3vCo+nExPtmOjLoZJdu4o4aiCOrlyPmd/rpJn/n4cl
         LCsVharSx11SoO1Uq84X1ys+Aw83XhmcKkSYIgDecDkZPtMHn6wMc0JU/KCEzb6uS3jC
         0E32ZDEY/h68Z22ZdWlSsfxd0xMAflz/lwuI/HsPjKJ+bfbRPXe3gSgGRLI23FKmgNFk
         Si8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423892; x=1795028692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=M9orPktk7pmYK4Qkaxm3+SnlBHaDSnR/M1cZT5JRZefaCulKMJ0fTAuEkBMwnZDaCg
         XlZ44i79E7RaaGUkS11eDVRA0GMSsoCpub19r1H5vqsNkUfnKDzbiauYFbIEdgXB8Jq7
         SO3rGOZmAqX0RQemAbTp0NhDga6SYmeIWE8zWwcKWI+hSvIyU1Mw/4M3NIc7QddIenSk
         uu5qB1uHX7kVzfbTM7Be0gbJLO6EGEBJKjx7dDPNPFRnrhbejVmQNaPoOG+7VZg6AEBF
         oFeuDAHKBDeNnu9R1kx8hcPGxAmwAt2TfNeHzFV/1cR3B19JoonVqNLWlTeDQ7VN5BNU
         7WmA==
X-Forwarded-Encrypted: i=1; AL+hErHlB41IzQdAeFOzl8rnFDZPXVi6fpJ60WK+A1BRRjhc+njf+0SHa1EacvH+TCz+fxcISzsw6XyLYl7AB8S/zqmH@lists.infradead.org
X-Gm-Message-State: APuU4Z8AUPqNYuq7d5ihAuLCJzVk193KUOtOFyoQUHPOhQP2A4FdisfQ
	SCjpQwzYn23So+/X2ZHsFZG0lOeBN6HvK1SXFTLB0NPzVNwPFsT3isc7
X-Gm-Gg: AYBFou3WpjuJiaEXIgvnouhEQF22/O3m+w8weNI7FWh88ucJpeL/s4Fh1SePcdsWTyd
	OKIsMnPTn9AeATSPxrzMx7AnSZyn8JL39yH5A/Sf/qTGzzqy01bnUcjxioOI4kNQdewJGlfW1G+
	w+eT5viIGTNuN14UOF6woOy3AH8IY+mB4ekcdb2TgpbWRV6KQOspti89V9t2Mk/UdN12q1+yINr
	NFE1Qvs6HKtyB2hlzDJMeC66dfCrnqHOJ7hy27EVC0ItNSm8jaeOH1o+6SPSARYNdg67b88XuYi
	hv0urIpupljRMzD2O+xjKT1NxHcbsUyOV8aY9eK71dmxfVhOBB/Pt/NOPwXV0QZszMTYQBTgFDD
	9VH+kuMyOZmmRZ0zhqXdPy7SYLahplkyEVUEyHATwWCX85P9luVZwZWrsos/Bu+AUIFmp80XdlL
	vYxWESCS1nA0glDThlsckLfYGdKDOzIrKv0MB3Rs/Ms6jBx30FJ/bVGTjQ66k7UcGKtMMxzWKjt
	G+AsKKMMpg8HGV/0lBpLl5D+Mc3EwzvqDaEjFcCfbm/+abyMQ5PYGbPp8xMm/nJr8Q8sw0MYKei
	a1oCaFsQ8Tppd2O9NRhbr1yxJwWtqaq7LA==
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr3176907a91.17.1794423892375;
        Wed, 11 Nov 2026 11:04:52 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:51 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:02 -0300
Subject: [PATCH v2 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied
 Load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-6-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2480;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=SdMTfWEdhEcbVe3jVg4HQtrokGsmQDzPQ6HKrJzZjGE=;
 b=GUA2MhZVPFVVx+fP4wtJTG/ZVarRMQCoFUO+AAwZGNJULsfUqPHcm55hq2RjOIUamkxu2JjEU
 s7y2NTEMgqhBHj95eIB/wJVpRyhVGVv/R6f5pa0rylqerr4dAklrjSi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110454_752196_E1FAFACF 
X-CRM114-Status: GOOD (  13.50  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                        |  6 ++++++
 .../dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index fc9a68cbdd313..fffcc54545b09 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -152,6 +152,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx-hdmi.dtbo
@@ -326,6 +330,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
@@ -339,6 +344,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0


