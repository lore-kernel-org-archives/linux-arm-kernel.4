Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F0B60A381A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gi3xy2XP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KG8U62Uq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=; b=Gi3xy2XPeKwu7C
	sif5BsSri7mRC6giRAHSpmS8FJn5uhc4A2f6CJjGXFkZR+oN9rk4gy83Ib+p35nym2iI5Xss2B7bV
	+NYz0HON7L7dlvOIxVbdxTIXw5d5N9il40ikVsrsb356I9UE9ibS9G0PpvFySy4GA8HqBIzg0r0kw
	V5Q2rOm2N7vd9OlelVRqERxOAX1OPShcK5rNom7EgGyATer3iETgyJQUa7sA9h3ZHXIBbj2MAFTYP
	l/5rkjhC5pjYxdwgudKiVTCrKXBn+qGwxFepSuTyTMFe7e6tjZKJp9bGpP/JRiaR4lDNmH9ndPIih
	WEnzTbuceXyRUO7pvxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZS-00000003Y8D-13JO;
	Tue, 10 Nov 2026 10:59:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZP-00000003Y6b-3iU7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e10a70540so1125750f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308358; x=1794913158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=KG8U62Uq2Yu4MBsuXPQ+0Q661T0rD5OlMmzGXxWgOU+cT595GMKPI+LSNnxvNzXxd9
         J59Mp8ZeA9QNstoGA/LXK4llUim2DS5Z8x2kStLKghUJu2Uk6gY29j9lRoH8MMayMZ1a
         8VdPBtT06dJjpbL1VqoCXh+zvDX6FLG97hCSOrse1Xp400b6aZVEhWIaPU6C/EbgZOxC
         vpqGQC90bpE0nqhT23IZESzUVt3GdhOKFliHCG/PTItz/YzIIClfwTZyfdS9noJGHnZt
         kTpcbkFMWFlC+iEcmAe9Dit/Nk9FJl4pXNMJEPhR2Ovazsxs5LjkpnsvTwWmin9i68E3
         cejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308358; x=1794913158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=NnKYPm3TfHc/PgFFPWH0qZicHtETYoNP0VuUdKJFtN/RL5i85HcmSiU4thDMZoRCfB
         9iFA+sBACBi25lvCSJGC188djViUaffFNSD3yNbyZ2fFyZ3CcXs49bAnb36kr7Y7g67j
         tNN2BkYG6G9IoC0o8hhZMUNkTzMizg9lNajIZYf5zymF+H+CGPrp0FUnBhR4Aq52mV+n
         57XpKkctmQG6qV/slR6yB5wqpt2Qkw0qAGFaPR34CiPichJpudIS1NFrjlIz6ctv1DnB
         Age7IOrD2Z+QnFSq/ea3u3yagOkJZJY9SCNq9a99iK/YiQuNLFSMNcjXx1BuAm1JbOxT
         NQ0g==
X-Forwarded-Encrypted: i=1; AL+hErFmf25x63HU5PmLOn2vtq6a6Vito65Zxo9z9PILJlJ2WTE5E/mzTbE8ARe5Yh0kbKIzQIwLEJkFsIrLHSbZ7l+l@lists.infradead.org
X-Gm-Message-State: APuU4Z9nJyof57xCvhonhpnFvGjYFz5/BgEWHG4e3XBvPSCe0uHA9Lum
	t9OdvZ5WRrOnnzLWmo7UbDkFaGuWfiuIivFcCgKepVZPzwk9EztvkkA5
X-Gm-Gg: AYBFou3vnJjuq3/Vxg6cVcoTa6BWLQ4zCwYWyuVa5gsB5KINgQ5mmi8T6kuzJ7r6odu
	Y/cEFdEKuYjYxX+FoemjcHXyaAb3YxdUCFZk2WISUk1Q/MxKON8aeLfVa2KHKMDz1rwSTyc8PGm
	dz4H3Gpi7dVLsjEkBhGbjda5o4zI63nf1CuqzEF6g2wtIT9dzNjWxYTMe73FW9mnCxjcrPYaD1n
	tU7rUlMLE7M9tkhsPpBCrqn5A9Al3bomE030SrZjhSqn/HPgsSjtdB40qjsXlNHzIcOoyu1vawU
	ASaZFw5SNl8ebiYkBouOWLzywqSLb8QqLPyEXvy5kxuyfo79KIJGdIJNwI3j7EiRggUTfBMtFpY
	4AN+p7MhQyUrsNTC6bX8YfZtcS6Iz+KtPgVgxTE2jbM2oXLULJELopX0rHyLeyvD3cUnmcbFkbc
	jLz4+P8YRexUDnpJgZyaLKPV4TiW2WgZUoDn5x4yfzhaZIYLhkQBdd1jxBCjeMN2mlDs6j54NsG
	r7o2pfIvfdDyHvs6q9tDBK6dX0d50o/PHATNvwRsylzkXvb+jsCaU3vrsFimQuygNtYxNnsDbep
	YXgfSF5N72p0wS2SKviH6W9dw0w7NxgnlqigUmqPaQh0/tfxqoQTDmeJ0jd9/61zFLo5aZjyz98
	z2448M/DoEUZYiuWcp1aAcI9ieVeQL38PpeMOVUDZO70sa5te0DA=
X-Received: by 2002:a05:6000:993:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49828d36961mr4278277f8f.0.1794308357856;
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:13 +0100
Subject: [PATCH v2 1/6] ARM: dts: imx: Add generic HDMI overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-1-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=a0eIgXbh+uCZSw0edG05JIfZzW/ZFfMGZsGT3FOJLus=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5ZeElmX8df7/dmxifWr//6Lsm0bVnWB2FxEQN2
 O5nTloQ3lHKwiDGxSArpsiS8URVkE8hRNaDozkZZg4rE8gQBi5OAZhIUgTD/8oXOWsjGTq7l/xe
 kXR1wvdvcSYnH1+OuJzEnKAm/Xsaw2aGf8YRlW1fFnkVs0wJuW+8XKrc5c+fc7KbZ8QtOHfHIqy
 slwEA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025919_971247_C7FEDCA6 
X-CRM114-Status: GOOD (  14.46  )
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

Add a generic device tree overlay that enables the HDMI transmitter on
i.MX6QDL SoCs, to be shared by the boards where enabling the &hdmi node
is the only change required for the HDMI output.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile      |  1 +
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0ad7ee583e8..d03a8d2845e9 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -85,6 +85,7 @@ imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
 	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
 
 dtb-$(CONFIG_SOC_IMX6Q) += \
+	imx-hdmi.dtbo \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
 	imx6dl-aristainetos_4.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
new file mode 100644
index 000000000000..efb7dd5c16ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Generic overlay enabling the HDMI transmitter of i.MX6QDL SoCs,
+ * for boards where no other change is needed to enable HDMI output.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0


