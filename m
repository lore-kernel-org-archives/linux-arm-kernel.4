Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6A60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UvXknoIF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlgfztPr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=; b=UvXknoIFpesopM
	XSbfmAeBoBD/O2fSZb8QBCYDrACvl3PlpOg4FrvOoXttO66peXbdfan5Iu9CiME+P4j40KUnv0Y4l
	OE4nDdQx6WCu30OqTwyZKFiTfmM8r0s4tMjzcE9F9GpnZxYwwi/Ve5j8ytvqTNmhCpEAOYa1v7EEN
	KGfvUORBcZePDpO+vjPAR2wVgg5MDEtLMXqWjWZ3MIEXeOU7rwM6S6lMhu3VhIbNQj5vXgQNCT7Lm
	ZX6DKwz9bpdX77MQGuSgps73Gk5YeOPLJwDo9yU7jxIFcoZ042P+hJ9JeRk93+Imt4l/n4nOFDNUK
	Pkp95/31vgcV0dwdE01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQO-0000000FwqK-2YJq;
	Fri, 20 Nov 2026 18:33:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQ5-0000000FwlP-1tzA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:33:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11649695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199588; x=1795804388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=hlgfztPrzAY+JW/vUZHH67Z56PeiOyJaM31JkkmhcvCt27zL3OzfP/fM8my+MWD5U1
         oX9rUXhtIksiPwJ7l0MEMruXlwx74MSGvk7EShCmRcHvnKyzO7DaPY6mRV/Sz53TmXOx
         Z29Nq67i9Fz1Ampf/83g1s0VY3hqAJqSy3Cdd2zVp/Lp7Ou9a9G9cswD+yVmfxLW0gf4
         e1z3JFQ2VwU3AxDzT3AaEiNL80xryjEVx8WdfAmrrRYg2FyPWv35QErj9xAbD5071l3i
         SklXFZSAQDbuPaVuqYJcT+kdD2Xxv4LqLqW3cXfaM+kSl2mxEm+fvlPmVcExqtDAoiVL
         bykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199588; x=1795804388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=ujnuJmvfjchYoAXfN64c7tWTEzlHYhGJEU3JS+n+IKg2kmgwk4FtS0y4lQpEtIeYZ5
         n2TPD0QDthhBMBR3t8gq49sNeRv5daTZ4L9vLZyLf2vymTfdm8RY4aCHboQ4iOg0GSdQ
         pFPdMnX4w9kMgHKNwOt/uFoxk+A9yuhdi0rE5iuAK9xWbFYVLe94DMAlZaZgU2+VSr9G
         11s+SYYPCjAVmGJbftA//JI2quKx/qznJd9nQzFasiKfVf7B5n2Z/rJDIUeJITNHo3Tt
         zK7KdHbLfjiJLKsSdV4FARqxWXyhySzLRLw576Ptlitgmcs/EiNxYgpVdxkJofVpMf44
         HEUw==
X-Forwarded-Encrypted: i=1; AL+hErFaXdduxKuYn37uZSM/wpi3xrGJNf5Z4iTwlhw4VC5Qlgifd/VTy8iBuBx0fQvlEfctZ1aNRpIpY+n5W5UQDBsJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/icG81l9qoullA9uVS+Z0gX3InSu7rIOg8xZ14diq/AkWm/xJT
	e5y6wf4XmRqNjahT4JCW+C60y8gex0pTEApQqDeyZp+dKnOvh2TBkDjs
X-Gm-Gg: AYBFou1w74S/1jM8P4zL/vnMQTIJDNHrDxn2FXMQ0tIpbmwloL/ECSPIWsRE0Gnry+E
	hM4R/GW7PbzL8WBX1/P1GhIAGR8xrEXyxMzEIFR1F6zkvFIrde9gnZF+1nxJ3Cz1BRHTQP4BKPy
	gV/BlEBPiQ7rivFR7wvu28y6OZ0I+2pMlxv1ob2g6niVJqhuZJXyFobPCfKhzpNR/fUfwmW33FM
	BCbneGSJOG99rzZa1pK2oZASI/EoOLquMSkojasNP0T8z4/AvtWcmCUsv2kaUNQI8Z8H+Moso/s
	OVjM+EtnLxfDTgq+Fz/ybmwDEdKZkTDiKEhJzpq9ZNVj9LQA/AHWEodGySOfj9nBtE66Ye9Wu5T
	kRNv/UpBE38h9GML8EOHROYS0JASphbgcV7Ibd5JDy8V6yX2u763vg/WdX+h3Q6kKSVmnCTsNTG
	CFJcnuHNfb2PKvQVXBBfw1Y+kmoMq0mAPZe2/pUFULIUjYmMsF6OGc2n+d64zCxzvesypuXZeIs
	NLKeYWfSxej1RljJGZ+GDi1WFtjKPP4BnvfXYVhtSYI3mPRgvlh9oH9ceXHpA1YxzBmqdU+kaoa
	Yi7giT3v0ye7UY8qp8EeLelvJoSPuxFrjz+y5P9NOrVb/MlUyAoFybVI0vcueBL02zzLbz1maNP
	dNbk0DmEQz97M8tkirVFslmLo8CdTlqkskImRtfToUz7P0ddrWQ0lnu/OR7Hl9DpS2EUE
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr89696315e9.8.1795199587508;
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
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
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Fri, 20 Nov 2026 19:32:29 +0100
Message-ID: <6ab5925c4f1346cd801c58fd88ec624419ad0ce8.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103309_775643_B9C3DDBC 
X-CRM114-Status: GOOD (  18.48  )
X-Spam-Score: -1.8 (-)
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

Move the Cortex-M33 reserved memory and remoteproc configuration into a
common include shared by DART-MX93 and VAR-SOM-MX93.

Include the common file from both module DTSI files.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move the resource table, RPMsg vrings and shared buffer from both
  carrier DTS files into the common include.
- Use generic memory@ node names and move memory-region-names from the
  overlay patch into this patch.
- Include the common configuration from both module DTSI files.

Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 31 ---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +----
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 +
 5 files changed, 67 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..72b47ba99cb9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rsc_table: memory@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..efd51f6364f3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -137,37 +137,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 78b19d8918b7..c3e880025a06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -87,37 +87,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..46b739a147e3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3


