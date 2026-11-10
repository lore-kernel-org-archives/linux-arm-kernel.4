Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/ViB7cL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iU/f6eXO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=; b=K/ViB7cLciyWVV
	iIZ2SnZ0JCNGH2BVt2VsL51hn+hP1onK8O9ePntx4KrJohWwOQvfkl7Z7iz6YNhY9QuPw/57lV1Qd
	6RIo548JaQJLWs99oKvezvCHwn+kT2CJyC5qx/rY5/K6s9No4NA0Yp6saT46l/skBhJLeI1YVhUUe
	q/HQBw0flvbbK6q7A6bAUUUHI798XIF31kwMrGIXEnnzb/VL8PFNvs0topwPcq72XZv6cyIhQCSGo
	2KG9G9SDMjQPjU4woH4DbSuNqWZFa9r5aoWtbAl3gFf1jxIS9tyMM4nNtTVWq1Bg6utrsyw7nmdAy
	YfiTGv4gtqj+BfSspNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZY-00000003YBc-2G6o;
	Tue, 10 Nov 2026 10:59:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZQ-00000003Y6q-2oAF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1245578f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308359; x=1794913159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=iU/f6eXOG8zhYoTTrGnE/jVpesiH0oYvvJlrklHfZ1hp/8hKwQ8G7sUXpcCDgHfwsT
         CmpQcM1Nn+dGqnkyzPZRo9ngIQYM1Qs0sUbSIQ937ak97keH089fHdkoyyJxGB7S9Y/+
         sij6m1Mx2eZFXWS/oyZQ3tffTwDG//v4RtC7qdqxCnPSElkJmexcJi76SwUfNy13qNpO
         NT9moN5fxj47YZD1cIHUMkYe20rkK0a4i/GXbw4QLFVnzj/UA0RGqbFGU9fAIds48emm
         Ooj5CNpts3ta4gU0mwelLUzpiXxu+VIbZaZ7opND1iT4Yyc0fx6IOBbX+EBMf8FG+hNT
         IghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308359; x=1794913159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=KaaXSckx8zsuirRlTnNqKy8F3kh08xwPr+7pKokjmT6ig/T+Ke0xXrZQVnut5yW6YV
         5ETKKdHI7nHtxFHEaTrWo4dSAMuFEIpq1rCI+/ErfJ82hwM2tb2zM4XP344gkASECwJg
         k2/kwTb/IexZcJ7ya8unxmFNAzqRgmJn+rzNWmdFs34epgF1OXQ4DO0galZIqL5ZRRlH
         4zK1ioRCqlAUkaaKNv8dOnSIuyCFFApvUhC7bukEcFKjZZYAUV/O/RsfZTbIsgO1/4tZ
         2fXuBfyLeiCzJdKR4mmhGboxbUCs0xctiVZGyE74UgsuHRUSOaoYTINKgFnHED92Vi7c
         yaIg==
X-Forwarded-Encrypted: i=1; AL+hErHpWeLEQLmwGpYkdFSSTxt+Py/m+ylM+h3N2qG4YCpakpH9/rlZSyT9voHE1J8RpJkuz4zH0ZmEwRcKer3WCeCs@lists.infradead.org
X-Gm-Message-State: APuU4Z/4htBY0KivuiiwsR+u5ofb2mmwG8jak6wN8BuwkcJGTWtGU1TW
	ekYCYWNBn033XowBzO9Iim6V/xUbhCGACH0pX8KeNpVdiRwLWVKj6D54
X-Gm-Gg: AYBFou3abJHaMkOwR7bme/V+ef1zG4E+ZX/Z4Pk0SnLD3cMq0TFAZBNi8laww3Kpvtm
	Nuio9iY+//1oOXbiEKvj5vSjf2//0x1dAyMoz98KWammf4zU1lBCm6gDyVzcO/4zlwKO8R5f4Dw
	n/VMoK+W2zj/VX2sJNS9LjMK8QzdmAdrrhOo+jzxTtmLB0Ogs7meGitbrPXz6+a6equvlFtTR3+
	GrrfTN/qWJ0HqhuPbQuNGxFGCjmPGxGHVsOT/ZAR+kAOVDLukZXUGa9Sy+Pv7DHCW2wRaoPe5GS
	eWfCtHrfsV6pY/ZZeif2REwjiANhpAg7spmFZfDmRD33uKuoi7lIh59Lxh+zlh27Igg+3QMLGSV
	LBVc7cZM17dz3X824UwoemnzTjGSnGQpGBEygjfqLHZdcClocqmKq+ajAD3WC8QwNXzMf/PYg7G
	2UMR3EgCCOFjKrurxlYodRUbp63l7bNt/5c7M7ja9xMW7r7oAwyXrhO0ETPz1g6f8v4QLM8mPKc
	DiooMH6b8v+dMQwFDgvM+j8SV1kZqJkDcGmZ3n52jSbFjrCgvDYAjy1BYNGgMW/qdiuyYoBiACR
	X5D5vzdR3K2yr61UTniZbggYHaNxsIJzsbGw5g5tORME3dxNcL0GofyrKxYuLN3IqYEGariBM5d
	Alu7PlLUhVRrnuIDiIkZ4z6c5Hup+QZGqXxM5Z59d4j6BKQ8J6+Q=
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr3878592f8f.51.1794308358680;
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:14 +0100
Subject: [PATCH v2 2/6] ARM: dts: imx6dl-colibri: Add HDMI DTBs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-2-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=GHGYqwad2/GX2e2ukD9rodYOQ4ugyd56E1reFr0Fgm8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JM57YwY/5OWw3N9bT5oSubGevhsdjy4tI1LkOPaQ
 wvJBUxiHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIl8bGH4X+f75cqef15Gzrnf
 na48MY9zdskKWCCp+D3lskzszPRvvAx/Re6HWVxjT55rznBBo/CW/kR2pdtzg98nG09brFqn9aq
 ZBwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025920_744739_24225AA9 
X-CRM114-Status: GOOD (  11.29  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Combine the generic i.MX HDMI overlay with the Colibri iMX6 carrier
board device trees to provide ready-to-use DTBs with the HDMI output
enabled.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The DTBs are provided for the various versions of the Aster, Evaluation
Board v3, Iris and Iris v2 carrier boards, including the Colibri iMX6
V1.2 variants.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d03a8d2845e9..c72920658609 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -93,13 +125,21 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \

-- 
2.55.0


