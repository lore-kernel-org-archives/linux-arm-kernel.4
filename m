Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B65606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUGrMHJI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VU4rJiyp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=; b=IUGrMHJI6YjR3Y
	aeJuhm/GCYdLO9EJAssMgIEHAbJpWazjIVD2dE5qFfYGC9VhJAW1a0pVBXmpunlRaowTRfuRT6Fo9
	GlR3UEJQMuTCW/XJ76/C0qfcMrbTH84sHIXgyInZx92VjHCUURl0mXZDNe3XHwlcbRcTfe64KGNno
	cqKthllVOJNBg3c1Xb/283r+oJpUxpWPZX0uuU0wN6TNB1gqSXp2s5fcbfU2pwL7yNygkp9Ds8XL3
	ZjDeOwBNW5OhyFhGvnxCMQK0Qf5IPGbE3K2yzA9Jr9QRN2upfSd/JOR4+PGY6/1QlgF0tlK/QRlUb
	4nL9QNkO6ljmCXexlvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcZ-00000007Tax-00uB;
	Wed, 11 Nov 2026 19:04:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcW-00000007TZt-19vz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso1261397a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423871; x=1795028671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=VU4rJiypB5h9oFcPQJFUsWcUQhYEHcqoxM3bk6Yp/AdIhEXhzt+NqDy3VlbP0e1ijo
         9TBbxWl5YrW738x6x6a+KfUaOnQYjXWfHVLmmGH7YWQ1pQFbV2ooyTY9UBbsHIO5rhKx
         8bxBFGtDo/cKWjLPdLIfVoYIROhL2oecfRKbXMiqqs09A6pc5EKrMYpEyWliXLBaeqtS
         SGpqM6GLrj7sjqKWGcfVeXeC2w80ahnS5j1t9LP7w5GMr5jQ2uQ17TQLdW9gaxH+CTWH
         reIErQakttLiLUMvyKPl4kdC+OpZZtQKNMEbPVJlPR4bcoTDvplLUOqZsGuufdJbTB0G
         0/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423871; x=1795028671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=dzP9eXMC0SAYQ8RZWJ5xb1pno9L8yeq5rv1rGadNGCL7yE1z9om9TBFVrIuHE9rQNi
         4A9n/cy7tRjPjKVKvJu/QrEx3ivm+szZNYXWDNsl339G6zNcQ1qM73Eb92nxeU3JqHsK
         heOzGrR180T+YoMJlBgwMjSgpeRYoD8zI9jtOpYvhKXd3hVyBoDUxdFp/PCHBkZc5LFa
         kfONNqw0j3g88+OR3lNQOv1AJ0R4igNrZdlfFGX4kYiNJvjI7OS53qJS4avwBm2Qn8U1
         Rvg9z5fqxD3eyXvyWmeSJDN7K3CNW3hohvCLlZdUPc7eGo5CppUgZC29WESsyh5sBM/U
         r+Kg==
X-Forwarded-Encrypted: i=1; AL+hErE5s31Nqxvi92KObfFt4I9uzPIZlZY7RbEkDLFYeCY0zkjSMVw2uNDsJXzZu8Qy4MedxVW6Cs/CAlKqj+I16Ga/@lists.infradead.org
X-Gm-Message-State: APuU4Z+b/Y1KHa+7zaOA5XKfuDLILPfjDpWYDvw0eIXK91oly81YV51p
	fEMtMl7kNVDxBRg/J+bPcCUYuzNs0LW8LlIWy7V8Q3jHmVSR9OoqyWmp
X-Gm-Gg: AYBFou3fQ1NIsOQYjy4OjTkmFXOmdRjGtegzXRDGRuX25nwNBpi7y6TI26e9TNP/I8O
	xz34HULJ7STiYAbwvxYZKKwHWP91dwNyjWDygy5gq1x/jtTtN3j+oVPJEm2HCvTlfvjQj9k83cp
	KuGjg/hi6C05mk1FowzA0NmXBm3wSvjJP2OUNyToDZxX23rgbN7gei1NfK6Y9qBwe1hs2Eck6YY
	XHktxmmDQwSqrWNeGTpkt+EGSUFK5lZlqCCEYUbA4ZJ+YWJpjKQD/ze0oGjtYKgmKuyYR11R8qW
	FHHhIDb/cQoYUR1kRtFDnTg5/wMsG+3vGyP10iK/nK+E4bQ7AWhclKy2ikasv2Zm8rm/fLWbRd6
	qJE5TKpF3V4mHZk0BzTk5GGZd7v07uwMI6x/XoK5fA5RtmPjTjYpPM/MgcRdt96anBZ7HdnDdCZ
	PoVD5cdAV4fpvppE/uwk/fDz9ol4CgxQs1N7J7LasbJGE+jli19zjTo72L98RzwfK2vddAIRwTA
	aJXW9T+ll3FZJqDU09seHK39kNZF4l7mqpHCN18m0rQ1cZJRyxVfK+bcKZ+EC3nX529iJaBhapi
	GWGTWgmSOTPRdA/zWPCREj4BrHHubaJxuUVNwzCc/VQbhisMKmnjI3o=
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr3006901a91.7.1794423870904;
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:58 -0300
Subject: [PATCH v2 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power
 regulator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-2-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=1776;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=G0D3AUMCZAfAB+oBMBn/hQwsHUHoV16Fn9kK3ypcWVo=;
 b=nVAd3ioHTSP14EpXIOGgXQEKXYdlaDj7tVEwROvBxWF3/+gClQ12Rlidq7vEtLB+ule4J4Vk0
 3bR2zBAFxnoCkRzAHzkq5qgKAg20KQVSPt5/X9Lvj3yCeW7DLsd4Jni
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110432_325571_0EF1EE57 
X-CRM114-Status: GOOD (  10.61  )
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

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 6ef2a986ca8cd..73e3b99486d0e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index 6b5393accc092..6fb57935cdf1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {

-- 
2.43.0


