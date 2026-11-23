Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC2606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A98lQTJZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2eJdN4b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=; b=A98lQTJZNCo7dIgV8iYQVFFcwA
	bal+lUmbtfzbUxIo3SWNvQJUATr8l0yv4JTnJbk1pfmArY1dUceMvJNdNurIJgzuZCO+u33TVwyFo
	HN5jSJ1+/Mbwd0CI9PiI+kR8ywHUEFihWn3eDdVMWRAVsAQV+W9Dlhxda2i9MVg6V1PsuBrGEa5qx
	ADhY2jff9uTN8mcVtxLzPUrvCOLHNhxZ913mUVk+jitJh7+fj4jgU0cwNgjPkyqjCnZSP8a7uld35
	zTzQJuQGD/ee6omIzdblGmnfoddr/M25Qu905VCL4ZyPRt2Tq6PV3q7CegcLYUQXzRp2Y02Edf0ih
	Vg7/dm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzH-00000004WOz-1r28;
	Mon, 23 Nov 2026 18:41:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzA-00000004WLc-2wRi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:41:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24BC862348;
	Mon, 23 Nov 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459311;
	b=emaIPw4rqXRPh1FVr6HpQRz8W2jWCKbyyuUVCQ+4sDMV29rxhkn4Mk5znAMGRmDvy7ya
	 IEWXsDmLPa25l+ZBCDZv0JZfIhMQPUT8GMKLzPZWQtgknF55W4Iw+zpMP/XTYkfZmncxJ
	 NCmeGgu9oBdSBnNuTqPyYXwsKw/ubeYHptR3EHp5IpD21GJGo3kNS+RgQA9dtaQS5eLON
	 z5ou1cmEYdoFoY4gWWnEOVAQULxLMP6nBpCX9jORaYXcEJLDK/sV65F2UpCbl1He940J+
	 E+Gl9DD+4mnk3fqck9jcJq5xZh1NQq3U3eQvlvQ3Unc1lhdAIwn52H5Xw6yLknRAYhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459311;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	b=vHs0Ld/+8Cr/a1z8cn73uVOjtId2BF8rV8skhb9f334tImGYKDzpu7F05ypdunJJD+dz
	 XuBaDTwxu76j8VmWfNsgt38854VzD6C2/zhn50RRKDYd1UmDy3NvY6J+mjeeKohGhENTE
	 ie7vq9rhu6xXGMKD8HRjYeVdWIuvjp4pZ++gBd3Tq4JWoBBo+6cmpMumYXuljT/mXPDne
	 8g8S5GYvpvmBGNCnxaotudDVWW26DbMJ3d2O8qdaWDSixuJ6S1jwa6K5SSN2jrp94cJdO
	 Epy+FXFgGP8AXd5PuJW1Jt4lXXv6mr63jOrD/c1qiPEkichxvKwU7j4fiPtJJhHdYSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 993211F00A19;
	Mon, 23 Nov 2026 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459311;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L2eJdN4bVPR8sGVoA9CtPdNK1b3JS/0bw7KDmv0HNNV3MwmrPALPOqTLLsz6u4xHg
	 n8uCXk/tebg6v1KBfhzbBjm7ay8rvp4TaDqqhImfF4j8WUiQ/nMTFr8H4RW6vVKQXQ
	 bs+ZKVTIhFJ5N0q4wlDzfswS2wK9wzEHABuconk+GAtRlifa0z8sqTPlzmN4vkFRwA
	 UgT8ql3utTr3FUriAdBmY5awphF+evf9h5khelm3G0s8uF2x8K+/YU5HpmlWHbFTCM
	 k5b55KWRg9jOHSucVM9zeU5+1MmQLMGVrlLgjwP/Mvz6yJ2onWGpfQQccKOcYqXjO1
	 cNtbX2TnbslUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 280594C5BF;
	Mon, 23 Nov 2026 18:41:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:31 +0300
Subject: [PATCH 1/3] dt-bindings: rtc: Add Cortina Systems CS7542 RTC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-rtc-v1-1-6c53761ffa03@gmail.com>
References: <20261123-b4-cs7542-rtc-v1-0-6c53761ffa03@gmail.com>
In-Reply-To: <20261123-b4-cs7542-rtc-v1-0-6c53761ffa03@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459290; l=1725;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zpMLao1XyuPRjMljD/Vh3jkbZiWoCb7Hr28HjaR1ywM=;
 b=FH4dylyL9MHMlQgX/Od5LCuwMnaNohqrrCaDNMi3cVfgNuLwDYK9SVr2v6Si0rlF62sIyNcl9
 b7bbAt0QW5DDAGkdpPD3RUyfWATnu0eutPvBAgODqVQTMum7+sdZcM7
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

Describe the RTC register block and its optional alarm and periodic
interrupt lines. The initial driver supports the calendar without
requiring those interrupts.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/rtc/cortina,cs7542-rtc.yaml           | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/cortina,cs7542-rtc.yaml b/Documentation/devicetree/bindings/rtc/cortina,cs7542-rtc.yaml
new file mode 100644
index 000000000..8c2cc7ec9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/cortina,cs7542-rtc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/cortina,cs7542-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 real-time clock
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Alarm interrupt
+      - description: Periodic interrupt
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: periodic
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rtc@f4920000 {
+        compatible = "cortina,cs7542-rtc";
+        reg = <0xf4920000 0x50>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "periodic";
+    };

-- 
2.53.0



