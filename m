Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E757606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyqMcpUV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQaMpVHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=; b=uyqMcpUVLTw7MiKOdqTRfHg5fe
	TGaXEGJvHOMWxz6hGPxoxWW/d3Y9q1LW2ugQXdWMl/zvu2ErUzeuYghvMpfkvEFhMbclghjfgWB5u
	KWTguzygrLpLXtOk88tqqAl855dCd0bXw4BEto4gBvYTEZJr/SRTgNnqRxxZNu8bStakBAcphjxUQ
	qSqH+40m2fna9hAyrcre5c9FzXcGHXQp8YnB274Nx9XyBvSU/Bd4pdiL/uMVzdXOh/t0QA83wSQF3
	5xKr9mvnlmA9DkAEGOWbOQJqHtYDyiQY/7X4vIzXQwMmNrKQbpB7GQP99rBNUQf5HyRMIS6vyif1r
	8y7JruHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcrQ-000000056lO-1byH;
	Mon, 23 Nov 2026 22:50:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcrO-000000056l3-0gHM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 826E260D01;
	Mon, 23 Nov 2026 22:50:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795474204;
	b=Zm50c1xB+pzZQe1th8fpFmOMMwK5CkTMwG3LjtPMybrQQgABcZ5gRzGCpWVQZt3fhps8
	 xuIe+FrAfnb7N6bhxx2DiPhXoNOnh71+3JFL36SKxmFjy3GK39CAVGrrRNta2lziRrleB
	 V3tuJxNgLJYl/gE7GYt3l9tEBmx5ZIMOsDZX0UxjmsLI3WOucFRBuWcSrEShN7T4jx7iA
	 Qk+xX1whqZrWZPp855LVjqmNZP/1eZUV8iPuVNmPAElHC7kEMAm+Zhph5q9Z5YxHVsJzG
	 pWvYEY3gYDlW9RoVZMZYhmN1Jc495s7fAcjhf9Kf9LXmpN2Jb2a24hooYFVOx8jz7Yg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795474204;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	b=f/cARXIWrXCndgJ4q5sr64BDejCDGRrJAWMnMwgkXTa5GUC26W+qg8Y5qXI47XmUVMqb
	 RwZEHISeia2Dz9UcHhK3anQgINnLBJLcCFZeuGEmhi1cd2O5EN1iQTqpC6czgB10bPvWh
	 632W6k3k0Vl0957Au3ERgt4Lt7YpdMb9oUycDeiVRRIhdg4ES9QKcu+JqSGQLFIRxjtAR
	 E7jN8/Ur8RhA9m2yZJXBm08ws7LuQhaEC7hyFUy7dSB3lfIJAUdqWLJclV/q6GwKympbi
	 Hlt0Z0c82nn44a2U0r9tCLHgGaqSfy7VDxuiKYo2nmGp1j1CnG5eGELGhp+3vwYxnow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E16CA1F000CA;
	Mon, 23 Nov 2026 22:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795474204;
	bh=aGR2ezp9P4Ja129w/l+m8Ayy/DbyQLAojBQ0FlM8kps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XQaMpVHTb7BArGyhjeF62QsOk5zJ3Dlg83buTDKE5lGaJ8C19chG96Ninjv+HufVW
	 Uhb4wRmYnOZeegy1WSZHQBukjfLSf3N6lnySTXDA8DFb6iCFc9TocPjRfTKIBxcgiL
	 Nzn8j2XAV/WFB1I1Z2tIMFMl5qNABD7jgq44x2qLZnVnZxNZspoE6u40MGabe3Mz8C
	 k/YLiD7y1KBs+fy+7nGSkvfX7vH3lzs0BtwcP0k54qNFjh96GNWqJ3N4O0AWq6/oUQ
	 AQNZ0ZDsE7sMGVyWkgaNjx4hoLzH8fCJNCXWYN5C7cVOgTjomr1ZiF4OqQutmICmU5
	 pNYELCgvOpEnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 65D264C7A3;
	Mon, 23 Nov 2026 22:50:01 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 01:50:01 +0300
Subject: [PATCH v4 1/3] dt-bindings: rtc: Add Cortina Systems CS7542 RTC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-rtc-v4-1-bceefd844074@gmail.com>
References: <20261124-b4-cs7542-rtc-v4-0-bceefd844074@gmail.com>
In-Reply-To: <20261124-b4-cs7542-rtc-v4-0-bceefd844074@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795474200; l=1725;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zpMLao1XyuPRjMljD/Vh3jkbZiWoCb7Hr28HjaR1ywM=;
 b=oR9esJeUokeEbZbQ02JskhlGOH4puiHttYHl17UuOIWe6aXpRWccZ2ZqaICQjdZb/s5vaU3mA
 14QGt6UnM/TDu5W93R1uxBzV6ZVsC19Y3sygKEm/Vya7Miqgi4SJZgB
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



