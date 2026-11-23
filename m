Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A41606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XVzARsy0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ej4sFNGa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=; b=XVzARsy0x4Wpp7Jn/yuSO6Wsvx
	UsfpjCKSFKVvQ220L04kW4HSzG/xnm8RWtjw+J8ZK2LcJGa4QGbSqTqbyO4vzhpqMZf65bPL4xKmR
	V+fvR9QEMaLCuUnV7+kWriTHlpY5cxWzqhKXuNEgrc+vucGVOWjZLzdPL36uCoAXdsAXQT3gLSaUM
	JHu19BmYZros0IqBnkV1Jad56J6nJpY8zLKexCBpY4upqiv0EeWHnRMm4u1BRAySKFTbYq0VjZEBt
	IpwOwOr9H8emxeGmXk6yRm9Y2jPNfJOBv8g04iCPIB7mxgl9BWiv2jr4rakfhvG4C8k6efaeevaM6
	Dpj9ixfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc5C-0000000529n-2C1V;
	Mon, 23 Nov 2026 22:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc5A-0000000528o-0f5E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FA6429F7;
	Mon, 23 Nov 2026 22:00:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795471215;
	b=EVZURYWsCpEkturXxd+fwafkwYF/mCnJUcaPQCwT6JFrWmulLRISZkCTjTc9s36ebm0K
	 K3JSt29LxdO8sACAbMuDZ1noeEaBk8XKTmq8CWz/3C+gGk6NVDJYG0gSG6kpFbxUbCZnN
	 jbOkFlntrwXuTzOOPgBmvfYemv2xDVaSXBM3V+K3zcjeMHwp4RbxzUsdet6rmlg4lyM7H
	 4x+/D2B2PdeulzcuDGW97Yma6a+wZjfHind6r3zGhOd24rkfO/eJXOKcawvKQys/d0UfN
	 MzMAhjWYbymE1ZBPUFAm+GcsMr2gRJPVhpFX16ArIXOuUc/Ht6zyNUCNZJuUqCLHnMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	b=VRXGlXdYLW7uC7Ci5s3bNAUNNRvRScMHgaQ7GsZgPLWgJN41akoa6mj3GVcaC+EMOifX
	 I3TIq+EkYLTatVuH3zAwhS66zydprbPTzAa5bqUZGFxTKSsFR7MKxoMWtQH8eqzejaLbe
	 e4DtxzE+c0AyPzV3bDmyhLW9ozZeDMGGj6hB2PpepX1uRDuLwui2FSKDW+yFl4v4P2lRr
	 nvxqtlOcD7AxPbp0KlTuoY5z8T9riHpHq0vfOdufYEsy/C41dTBiCcKiR8YjcVNQDxxLp
	 5rppuexSSWNFkEOXR2sYxD7oMIDiXI4798BIXeOXTqO8K+uoXycMwrobLvHe8ngHsbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F8841F000C4;
	Mon, 23 Nov 2026 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471215;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ej4sFNGaWDMdg9ehgILrSVI/ou9TBycY1mEyeBxRbdS6RV+4zhVEHjTJrn8JfZokS
	 kZXJhSd6anCMH94GJ33AF+MyIC4WW5+VYf1geVDI81cUUA8bOzvdhzMlGh6V7Oamdt
	 d4aAyLyPGqZDt62ZX/Y2o3nDt/U0DNVlSIOvPzF+OdY7FYNGVn/QFPMIocPggHnTz3
	 oO8mqrBI8q57rT5krWgBqxQcuZcl0d/kG2y45rLIvo+7gG1UNLY4He6vaxUXwKic/J
	 husNvitRxpuBezzEix1VkzYCaaBkFWWcXN0OLYNwyuwg28CgOzI7Zzr0+8/A365dIg
	 P1ztNs6F6G2nA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E9E534C791;
	Mon, 23 Nov 2026 22:00:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 01:00:13 +0300
Subject: [PATCH v3 1/3] dt-bindings: rtc: Add Cortina Systems CS7542 RTC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-rtc-v3-1-53902bfbe0ae@gmail.com>
References: <20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com>
In-Reply-To: <20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795471212; l=1725;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zpMLao1XyuPRjMljD/Vh3jkbZiWoCb7Hr28HjaR1ywM=;
 b=JVEzuYZczknbvfw9Uv/sBFiXsf3MZXa53kfeDPvqBAv6qB22xnGPK4LsqjFWc6cuR/ncv87U7
 kk+PtIn17BbDejCuFJLJ2y9yGkcqAeFif1dSZGW5wFBMUrc4V1WkOeA
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



