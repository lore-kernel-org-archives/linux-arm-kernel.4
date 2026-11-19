Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38okJW3O;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlNUlO1d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=; b=38okJW3OsG/xY3
	75OCYxHuXZMBj8e7myDU+knsL03ggaRcVtHYBs0HEUOjBpw3PuVDdFsy7BplfBz/no8RkylNP0KBU
	Vf5igGJ6vQ3oMkReJRuCV0IRjVwocdNWRNhn1NauPn0G86EusuB3QzXEXfeDDkFZmrfsQd5vWGw2U
	gmSidwBsbF2+IWAdA6nYgcA2ZM30r9gwxtbpCJOxDSq5TDBaewhBGiPjVRr6zLYKkqznFeSWzMXUx
	tx42cmo32EEQDJNgz4aul5lywwiZE8mNDBKI9JxbEYy3NAThqXlWH0WQIOP2lZ1rjTxRAV5/DQMcS
	qq7G9kqh0W4eqhZRL5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Zp-0000000CZPF-1whw;
	Thu, 19 Nov 2026 16:01:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4ZS-0000000CZH1-3jZr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:01:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-492690dd5daso2080226f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104068; x=1795708868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=IlNUlO1dtxShdd/f/vspk8R/4xRL6bDz5lWVD2bfDYHwKFHi2chgbPJ4Z6RpdCqNVV
         thxCM+cDqZny/H/IhxtKlyzlauXZA02kwabEZfJYRo8OYhKoV2Js3g5DMJDNA5kWur7G
         tjLjxK2AZYHcZXXFNCeLDUso3q01vD2Lm2E4lc+UkWACAaNR0z39lDdnSKcv0boK5Kj5
         jxUczO1OjQspECMu9o1J+wbaZe6NqIVhfKYu9lKCTl3a23XKWPr73mTz5LA1TSL4ONUA
         ++dVK+M+rbLC9QGrlRoMsQtgPs/wmCIJTc90uv1uBwkhCpkG4vdqgfAORjxT9P9cVEon
         sZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104068; x=1795708868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=wTS69AfxiPyoEDXh4ng/1eCOabkxH+cnM1b5pwyNkworttMlMqVmwVcc9GNohox4X6
         +z/GjRLFgdfQwE+eLv1qcP5BXMb2RTUKuLMjCN8Oyqj8tgkF8hty0ELlc5fzggOWH9k7
         4VGxJ0+RDd1H/ZAJXjMZ3DhQkFbmRrRGPJW84icb7UFi1FtEwwcgemKCOqrkJfQRYPsA
         TW1hgy4GrpFsmKA3c857JcS3Zl0aPu6AKQ+hJ4C9f1tzlP3Tdz7pU9WCYckVZ3plH3wn
         Ot/lXGb50EHFSoPApPqebxE5WEJFMOxY7ONmpIBt/PViRCRXs0Jz9iKUAStfeS2P4cfp
         JA9Q==
X-Forwarded-Encrypted: i=1; AL+hErGR29uEGh229pK7eKS9iaOzFmTzlr+xDtdkm1Ez8E5foC1AmuOPcnQGlrfo9rwP9Ieu7+XadDo8Pnwp9n/tqrIi@lists.infradead.org
X-Gm-Message-State: APuU4Z+Q9VENooYD8+VpqxmP7iSnNQhv/O6to3blGHz/jmXhlNXHUgsd
	a1v59BfpLbp+nV1PcOv7QShHi9h/u//dZ0HpoP6UoDlzagAaPtVHf2ZX
X-Gm-Gg: AZFdTZe2syV4K2iuatQszjJYcHGW8mcaXOHmMRPkyZ28f5MJo9Y+Zil1SvJK7PppjfG
	fXNy92MYrSxAXx8gPBHHStjMUEfClsO2aaF4QGaP4Rt9tTkoJl9wcJlnXYA7Hj3gujBARMyqAtG
	Tiamtu+FCZXRNQXqD7KoLUylyspvgiMDfwyPN0HEwGuXbtpjBYTMLjMc0c1WkZlYYGLsn1DOMID
	hTtRtT9mNwrykT+n54dnni2v0WJNXieDtR9howzSm4LK5cX2BfbLyRLh8bmSNGMmqIzNL+GtNOY
	NOBq2zu4ppeZS6WA2V7QrSqtnwzX0ir/1Eot7HjzmSZ25vm/JUMDso0Ho+50ULXU+R7uDbISvwd
	0WrPMRuA5wM3NPk1sDtLYgA1vFDC/SSytprYowbeatFvurbLjLjWv+8rY7M4yovoLnXe3Fw5waZ
	5tTObAtd0gZffhxDEvR5x9nEP5GUHc9pOlpX7VCSMwnrKwCO3lR9mEPabFVrFtEJAXJFpziB0zW
	YLy6NuNv7/FT5VEkaRH6J9pZjjvfTUWhx8E1MUgO8e1usNxiajPyn1Nfys1H+rDcPPjxvPyduJo
	lXYRjXoaCTnmG4VaxaPC422tEfpSu/te0Cyd7tk8ghq7j+qaYbdmVgZp8DgsOzUwkFXoYJ2d88d
	QaInD1VRoyc2/0sQuyIlvENeC94GHQztqHroe6gVD4P8X2sVEfnIijMc=
X-Received: by 2002:a05:6000:2403:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4a6dfe3fecemr11577697f8f.40.1795104068125;
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/2] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Thu, 19 Nov 2026 17:00:53 +0100
Message-ID: <deeb0fa8588673f063b14c34a7aa59efb1521b39.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_080110_961469_31840F9D 
X-CRM114-Status: GOOD (  17.45  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Move the DART-MX93 remoteproc and MU1 configuration into a common include
so it can be reused by the Variscite Cortex-M33 overlays.

Keep the common file included from imx93-var-dart.dtsi to preserve the
existing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

 .../dts/freescale/imx93-var-common-m33.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +------------
 2 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..de0e56f322a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..4ee4d74cadea 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
@@ -54,16 +55,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +212,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
-- 
2.47.3


