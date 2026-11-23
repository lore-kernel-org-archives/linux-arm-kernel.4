Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vu/jmceo;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hrcMmVYE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SALbL3rmUCGs9CMvj5o9j9zBy8rVFFlBbLAPnntxEJ0=; b=vu/jmceo9v4x3d
	uiQu/sc9VLZY9QQWbu1Kh48ow5+hxyjackRrPT8W/MmNmeW/lI3pexs2PYwzMOF1GO7vEXjDGdbCe
	zHnYdsdk424Io+H0Q3Grf9E+WS5K2/O4+PZb5NHdjjFI810y3n4VCxMKwptEtkFPRd0LmJzL5KQDC
	Tm3dEkGrQWuwQgkWl9mi7RSqagalaFkN224NY4JbtODvmMe6H/gSqB2rfhCAwMn/uzbwaMCUno9Xl
	kYJYioFhLCDT+cmrZ2pbADvMQGR/YP4wQodbN84BnTqxxyQRgNHy/OaxiA76qXXnOvkHxkFYfE7jn
	VBNaP0JMNYlv6amtSmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTY6-00000003T6i-2q2S;
	Mon, 23 Nov 2026 12:53:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTXm-00000003Syq-0I1J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:53:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48330C6914A;
	Mon, 23 Nov 2026 12:53:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46BA9601E1;
	Mon, 23 Nov 2026 12:53:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 922E511E6A386;
	Mon, 23 Nov 2026 13:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438391; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SALbL3rmUCGs9CMvj5o9j9zBy8rVFFlBbLAPnntxEJ0=;
	b=hrcMmVYE9EXJOJsNs9+2aUI2vH/Gsf/+WJhei1sJJLBBZiKgBdjzhF8Xk79yx9s+O340tx
	K7VtzYeSnpw4TnXR9RH2bGj24KQIuBnOMsRbEWcP/x9LHtPiiBLkBkUSY2SjjLpWOkxlWu
	gc622C7bkYGGUgb1cDIB7jrWdXmBy3izIj3sYURrV7g8QfMv0qDncyg3fb3yGo2tQn84h+
	NxRl2VJTk1FNkI7h8TnqskC2rZNnBAGIs7k5wU6jgeoZAQw28COoIa/LGd35Xdc54IGUz2
	7fJaQaDvWlmSBXabmZQ6nHC8j0uLN7Mb3/6Y9gf/8evnFk+cE/w0z1iEi7qzhw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 1/2] dt-bindings: mailbox: add Marvell MHU
Date: Mon, 23 Nov 2026 13:52:56 +0100
Message-ID: <20261123125257.111219-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123125257.111219-1-paul.cercueil@bootlin.com>
References: <20261123125257.111219-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045315_557773_9E8DAD61 
X-CRM114-Status: GOOD (  16.76  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: George Cherian <gcherian@marvell.com>

Marvell Message Handling Unit is a mailbox controller present in
Marvell OcteonTx and OcteonTX2 SoC family.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v3-v4: No change

v2:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example
---
 .../bindings/mailbox/marvell,mhu.yaml         | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
new file mode 100644
index 000000000000..5cf20d5642ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/marvell,mhu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Message Handling Unit
+
+maintainers:
+  - Sujeet Baranwal <sbaranwal@marvell.com>
+  - George Cherian <gcherian@marvell.com>
+
+description:
+  The Control-Processors Cluster (CPC) provides Arm-platform specification
+  entities for managing the system. One of the CPC processors is the System
+  Control Processor (SCP). The SCP is responsible, among others, for booting
+  the chip, clock and power initialization, controlling power consumption
+  through DVFS, monitoring temperature sensors and controlling AVS. The SCP,
+  as each XCP, contains mailboxes for software-to-software communications.
+  Mailbox writes cause an interrupt to the local XCP core or to the AP.
+  This driver exposes AP-SCP Message Handling Unit to the system, providing
+  the mailbox communication mechanism to the system, with the intention
+  of plugging into the SCMI framework. It is designed to work with Marvell
+  OcteonTX and OcteonTX2-based platforms.
+  The mailbox has no other usage than SCMI communication. In case of
+  configurations running without SCMI support it should be disabled.
+
+properties:
+  compatible:
+    enum:
+      - marvell,octeontx-mhu
+      - marvell,octeontx2-mhu
+      - marvell,cn10-mhu
+
+  reg:
+    maxItems: 1
+
+  "#mbox-cells":
+    description: Index of the channel
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    ecam {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        mailbox@1c,0 {
+            compatible = "marvell,octeontx2-mhu";
+            reg = <0xe000 0x0 0x0 0 0>;
+            #mbox-cells = <1>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..8f6f98acc8fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15825,6 +15825,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
 
+MARVELL MHU MAILBOX DRIVER
+M:	Sujeet Baranwal <sbaranwal@marvell.com>
+M:	George Cherian <gcherian@marvell.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
+
 MARVELL MV643XX ETHERNET DRIVER
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.47.3


