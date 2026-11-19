Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1560A2606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mg306kty;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UuPqSXrX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=; b=mg306ktyGgTMAER5v+Qfbjv1ab
	Oof8ijOeTPKZ/yJGJX+I3TfKrDDocqSKcxWNhPxs2uXSGKdvI3b9bfYEacdktLkEt1bxJXwXtVkOf
	Lo5hPCp6COPsdX1wMME1fn+2Mjl1fiXauLqkyhTHMLdWGkPFd8eb0Kpa82z9ovGk3/pWf0vhBqptt
	iY+Au0+TvlUXNrPMgcPUG8c1nhU3XeKqnWPzLeT5sPwRoQMme1Bx/GGP+WpgIthu+JESyKBVveUDR
	JKcAfbeJU0o5p8LpCYj+TLSBic+GRLN+i8+nOXjjf9Gj9HI6oJQeXVTx3+riDhc47td5+pe9XVagL
	I1oI6SNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvY7-0000000AzUD-3SGg;
	Thu, 19 Nov 2026 06:23:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvY4-0000000AzTr-2d5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 06:23:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ed08b07213so8785435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795069387; x=1795674187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=UuPqSXrXj4aTSQ4Tl4UC/iPGdexV7kAoZN1ub4pHMF0KJBG43PXf2ZDLpwbFFgKd7A
         /e50l/bN1vnHoLapscDoFf2zv7jn8uUckK4pKS7S+uUNxfa07aPJO5vMGPEA2+83Q8ih
         6DKbJbZwbTIxS216Fzceads9z7CBLGYAfo9fuBHmijruCcJ6uiIvHzXmrTVFxr3a4HEf
         qnv83dbPx2hLHkoWZ90T8qDkSHhJZNoVfokHULVQ2458XvmKHLvjVcP8bgAw06XxLh4K
         DNNzPcL+iEhwJI20IIiLlMVmavjzbRa8SB48qlFXNz5ebjqWC/bCPhw569h4caUMlWAn
         uu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069387; x=1795674187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=tqzggsPGXVwRNjefW4wYlFyPSjBAwJFl8nDGTRt/5n9P6ul3lwWCf+tF6xBKgyFf1c
         C95Dzk8FxwLytybntFivJx5ypmn47oQhN+oh3FFrPsvea9wd2cAYFzDDXwnPDiREFVef
         O/2h1A5moyFIyhYxVI4eCNguccfoKMiU5C9g50dm7cEMN0J6PAGpcODFj+8STQPm1kbt
         uCzItQMVVhkfjVInrQKcNILC4jKuUzu5Z1EO2I6L0eHhvmAQPh36BnubERZiup2rbvKD
         BHIugVzHCUESMi/YZbMlDwTnsGtmQmNqno0ja7NItSj1rUF0CwZWT+EaAovyClL/rXlq
         sjXg==
X-Forwarded-Encrypted: i=1; AL+hErFso4/wHiWMGxVZryGY6s53AGgAmcHiVgJnvrwoq6DOB0vKkrCy3ssca46A0FthhkSTWkzsZ5RrpPQWk0NEwxZr@lists.infradead.org
X-Gm-Message-State: APuU4Z/Q8PhM+J/31jr+vWoci9y4kShsCVoPnFaTcUuYCHx6MZC8unpH
	GjfymDAgfKPAeCr1r0CFJPiVALGeyBloiEtCGiMzAONQ8D1bronicX7ePVqIB+VedQ==
X-Gm-Gg: AZFdTZdKmRaMug3a2uZ6YIaoPuUxA65tagp1WkRXJOT2zrK2xtw4JvPcxVIVrCL9WW8
	D18vOlTZJoHrNVpyjjxupYBh7XPjD8nWFfJ5YhUrEXtGaGU/TJahKmXkpkxMmAWuz3H+FL+zc7R
	bD81GESMMxj1wsmIMTGRqB92+dJ8z0bmsRYeAiNqU4yuYRPNntjJmZvJhg7yF4XDD7XLtyXfYY9
	hWTrc9ptKVJ0eQS+Q1yXqq72gH1zm75FT0eEQ+DUWWo2Ydj62y2KEwwrpvg81miEgaGGZaPQWEk
	jEKDN1B/+mcpCHQQpWfSP7CaFeVWSbOOfBTz9IjQuREPvVqEjUHlnyEdAgmoy5S5O/N6MP0FKKV
	6rmcIg3+18s1ykEPUhB6x6qJmtzTPChwGHwXoeF4hpJW5XpeyiisqyTiSgi5Tk4/ylr6uifDLil
	hZePkFhdOeVmjX+vdcu2ffEml9Bho9aEf9zVjOHdQU71HyVuH9SVSALspeBGYBmUoDb2/teA4NY
	tMhkNuAPtLEErxa+Rdo7Qgm4iuLkBerTi9oMqaFLvYjAZqT9wrLmImg/z6nTiM+Vktwz7N3Bprd
	9ayX2KSJuu7kJgftn5dTBuX1MHKzuXVsDU8tXsaxTcA4rTTsUP3dUzQjk9ipxW7MSEoAy9sOU9N
	ojzuy8nvJI6K89m8ixiugszATBQaIxUoKCVISPQ==
X-Received: by 2002:a17:902:d48e:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f020cc33e9mr13953395ad.51.1795069386749;
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627f421sm24292605ad.57.2026.11.18.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
Date: Thu, 19 Nov 2026 13:23:01 +0700
Message-ID: <20261119062301.1778558-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_222308_767492_9DD7C662 
X-CRM114-Status: GOOD (  16.29  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the FRDM-IMX8MPLUS, pins 13 and 28 of the J18 expansion header are
wired to the SoC pads GPIO1_IO08 and GPIO1_IO09. Very few boards
bring PTP event signals out to a header, so this is a valuable feature
for PTP work. Add an overlay that connects the two pads to PTP event
channel 0 of the EQOS Ethernet controller:

  J18 pin 13 (GPIO1_IO08): ENET_QOS_1588_EVENT0_AUX_IN, external
                           timestamp input
  J18 pin 28 (GPIO1_IO09): ENET_QOS_1588_EVENT0_OUT, periodic output

The input must be EVENT0_AUX_IN, not EVENT0_IN: the stmmac driver
timestamps external events with the auxiliary snapshot; with EVENT0_IN
no timestamps are captured.

Tested with pin 28 wired to pin 13: a 1 Hz periodic output on channel
0 was timestamped on external timestamp channel 0.

Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 .../dts/freescale/imx8mp-frdm-eqos-ptp.dtso   | 26 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..5cdad9dbda8c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -633,6 +633,11 @@ imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtbo
+imx8mp-frdm-eqos-ptp-dtbs += imx8mp-frdm.dtb imx8mp-frdm-eqos-ptp.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtb
+
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
new file mode 100644
index 000000000000..15d0efc30243
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Overlay for the NXP FRDM-IMX8MPLUS board: connect PTP event channel 0
+ * of the EQOS Ethernet controller to the J18 expansion header.
+ *
+ *   J18 pin 13 (GPIO1_IO08): external timestamp input (EXTTS 0)
+ *   J18 pin 28 (GPIO1_IO09): periodic output (PEROUT 0)
+ */
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&eqos {
+	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_1588_event>;
+};
+
+&iomuxc {
+	pinctrl_eqos_1588_event: eqos1588eventgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_AUX_IN	(MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
+			MX8MP_IOMUXC_GPIO1_IO09__ENET_QOS_1588_EVENT0_OUT	(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+};
-- 
2.56.0


