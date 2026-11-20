Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FF606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HB9GWJEW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTmKAU1B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=; b=HB9GWJEWOsXckhDeMccNKC6s0k
	RyhV0ZcY4g8YJZeGEesf/ig65J+Q41ZbrjdUlyMOczuF+zZvbnuPOe9YgloOR09ObBCRNwimQCQiL
	0Hh0lJxM3yF0v6snA9mZ6A/vvxYjqRGu4PCShjE8gmgybTsdBua3oG0CC9pI/y1ylZgq9ufH7C6AE
	mscBgo30CMxYgvcormwlHJ5PLIzuVXxlKIwaVs9mwhaLqbucfvZsKqs5HgjDvDKhtOpkiVi0yVdgR
	7fwF128o5A6g9MlSrYlFi2VTnH2e96i/x2bQcLtCkPIFZKTDOvYvsSJsSGDLm/uu8GZNAQWufU28O
	3BJKMvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSMH-0000000FgGs-0utc;
	Fri, 20 Nov 2026 17:25:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSLr-0000000Fg7j-3oJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E3A9418B6;
	Fri, 20 Nov 2026 17:24:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195482;
	b=CjguaMpTTVulb32Pi98IoJ4xwcbM1ZnQb3lfN3H7T4WEANyqpgkq9k2QdmH2uDtzemWE
	 R0OgO3pGDZWePq8RMHH5VF0n4OxpzN0/f2lVyngbRiKr3Bd3+gi+19XoyDV2l35Ko33Eq
	 r/mZiTqiBL4I/HTfM3CkJLByrU5/LCjB+FlNkd4xHTIILz/EKr79RGbcJmycySfUL2QiV
	 3GJ5aeDOaowakEZwOV/bxz/mIWpTbHeblaeID3KLTnvs0zEEUBs0qO8+OwTHVyeCgY2ej
	 Oz5wlPr7Wgqj0haVNG1tCmzX8hLomtrUA/pj56Rw5akAorbgrqa/UeLkCYlil8oe/MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195482;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=aa9iGSUcFPBaRDdv4q91rV2yiPj7qGo2FCfuV5qvh8o6sX//IIOj4nGDbr+qgaK3OBja
	 KtBGt3l4B1sbi0CDhHAM5MPyMypj2zft5saOTb4Nh1VDclzDm/r/SGC7rIZu3wxOy6gD2
	 jgy0k/hBnUMBa15XlTz5/KFTheDt4RUxCn8Yls59GGVKkiYgf8j00lrqLMbyzgO5Hb3Ta
	 MCYH+didXuGVU7og21FtrT0Ex7aU82kwBlFu6UyuQE/qE3Has/bbzjsVvf0Untu7oXbys
	 WjyTxz2N2R8ZgSs+pOIQvu4MJa7gNfBSjBxu8ohFwCN3Up5ck+hogzYPX/N4w1bddbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD721F000E0;
	Fri, 20 Nov 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195482;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OTmKAU1BI7wzZ95GTBr27OPyA2XgzdfIYxaB36Te689SJjRn3UvYFy9ljPG+gcADA
	 NYJ5COftaVd6u/UMwkIvAroCmOVJTN3L2R9Ag+09pcUfbccFjSg0aF6m+7GduZPAOa
	 NoXjcNHQJrCkWJnVkYWxT8fDyz+SHcu/RSuyncwgFrwKw4shTnMYBu9NBxKUxPrL0u
	 D99Piu0a28tETXAeIsgT0nFoc9JryLuVM+W/ctJm3aM3ySeU/bsoUrZYUuLd4dCWvJ
	 UPyXC0BpBMu4L746xt7zp01HdImkUd67DGcVH3A48TOxYyMeohF9CFlLzhnLMcBjxE
	 nrAtJPgXwSvFA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD1234B881;
	Fri, 20 Nov 2026 17:24:31 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 20:24:14 +0300
Subject: [PATCH v5 1/2] dt-bindings: interrupt-controller: Add Cortina
 Systems CS7542 peripheral interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-cs75xx-intc-v5-1-f2be75c5e97c@gmail.com>
References: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
In-Reply-To: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195470; l=2389;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=m01hcJJ8xuXAEtFmd0R1Lw/ptpQwdip1II1Pbh1M174=;
 b=q2PNWwUm9hZ0MsD9D7uVLNyiL+lq2NeyuR2bPDGQkKTvg0yRHOpuC0JCJxx1qf94e2ewC5tK/
 f01gczcj3+wC8fTs95gBwiX9GVpyPk7T/wmZRVHl5bLRFp8zRJQP1QI
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

The low speed peripherals of the Cortina Systems CS75xx SoCs share one
GIC interrupt. A small controller in the peripheral register block
reports which of its 15 sources are asserted and allows masking them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../interrupt-controller/cortina,cs7542-intc.yaml  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
new file mode 100644
index 000000000..2963acaf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cortina,cs7542-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 peripheral interrupt controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The low speed peripherals of the Cortina Systems CS75xx (Goldengate G2)
+  SoCs (two software interrupts, two timers, the AXI bridge, SPI, the five
+  GPIO banks, I2C, MDIO, SSP and the random number generator) share one GIC
+  interrupt. This controller has a status register showing the level of the
+  15 sources and an enable register to mask them. The sources are cleared in
+  the peripherals themselves.
+
+properties:
+  compatible:
+    const: cortina,cs7542-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The number of the source, 0 to 14. All sources are active high level
+      interrupts.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@f0070004 {
+        compatible = "cortina,cs7542-intc";
+        reg = <0xf0070004 0x8>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };

-- 
2.53.0



