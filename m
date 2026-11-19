Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D960A260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A4a37Dx0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khXvZmjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=; b=A4a37Dx0zn1AabiMN9InXO61nJ
	gcDzicFykw+LFBkQV7Y1YUlOTK5lrPQQYNDkhdvzzolid2p5Fy7plf0mi5iuhs+Xi5uJFhKyH90wa
	CTUlePr9AZaE6EuLRf9EhT7jvCvKiB9axOpeocFz3ExSv5In3JYyTpdLEpuGjcZ//9XbYxU5tkywa
	PgysxuK+hESZk5Wul3JsOpsk8ollRhoIyLuSEXw4YURHnt5AgX6dgI41EBYIhYbe4HSvAbNabJu4d
	okBaOycuP3rd0HG23Y23BPzUoR68YJ45SFM3qKXhaUqq08HrszGI2uGtgI0z7Yk0BcwoMQJ+HBep8
	yiQcwPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3ld-0000000CNSk-0LjN;
	Thu, 19 Nov 2026 15:09:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3lU-0000000CNOr-2MN9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:09:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CED961B31;
	Thu, 19 Nov 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795100971;
	b=oHHJdZNDrQJZiQbDPuMX9ydHFKnpjw3Q1YqqNYKeNBo3vAeVJ9iaZq0VTjMK2M2kT7na
	 a+0GF4be+Vyzw2juGFNmroTDLj5WiDuNT1ELuyAObczCDqC7bm9GoIcVBWMr71KrvEbQ6
	 7ToiJuBT25OGiPzl126potYzHL4T72x1kNAF7kFgMnPIhlfhn79y146M4ePWIhqWmbcux
	 gYNiYf0VeY2ql4UIVWCk7Fa4MbK3qKgxLQlB3ZxzRSo1ifbTvzSj7H+baK5IyzoprnI3R
	 PvkEJyJnb3yHYxOc+KUwctvfV6UV3csKwYfWFqdBhzp/1YW/0l/EvZaX/pM+Rn6wZmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795100971;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=;
	b=L8bqPdZaPXfaKY3Wz43HYfHIGbYYYUwsuIZzJEjK5L5TUGiiX/R5qsKTRXmu8eRTRwVE
	 v+HFrgXXp4VnIc9QprRWRIi5tV2ri6MbLTtRw24M1ci3zadmqq4DigyVgVCmJhb9CG8Wg
	 4apUTS+cDXpnX5JSvsZP6abVVQ9Nb9TzBIbXQS0/FjhvJZfphR3tPfRSquVdKCb/r8Q4S
	 laWZpat6o2DCBFkJX7ZXgdWnujdVHyohQ0um+WkK/ipsYgFAxQk7FxF765JkMkzKWF8m7
	 lJDMZnLYeczntNY5izABLniF9ohgT6bknkZno67D45vDwnrADqPa0JVfRSoxLqDvxNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B3D81F000C7;
	Thu, 19 Nov 2026 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100971;
	bh=qNGnohMiCzeV/2nST/vZxlru2Awqvea6Nd2NAaEq//s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=khXvZmjH9th7+OQcfNjibexWVE8oZZc+KXJXSeA5Gfi6uNbS/ACzgvo2RcTjp6loe
	 MCQlHZsUll+HHq7J6mrDCtP6I9tE0ce4zxOdn1vIbfFVmVu/Unq1RTTAEodol//tWR
	 Doa9ZXKkpJJcGhTdZapQmEBmGy1AEilWwZq+8YmLV7n2Qc37nLYuuEjKF+CyeEcVQj
	 VgzXrOXOSV56lYK6mhzwyiNLmPhYIwI6Xgol5vSEUKXJ28mqkMIPTwQWZHWp9Y0elC
	 rZikkzuZUd6lxlTRvNd3rsyMthPY/aIDt4sOyYQzhlv1kv6wVDwKkzJbiPFGsWOBfz
	 iIAW2BdCWWJdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F24C24B2E9;
	Thu, 19 Nov 2026 15:09:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 18:09:08 +0300
Subject: [PATCH v6 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100967; l=2247;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6OdrTQPhY1jNQj4i0+0IbDQKAnU7nQcBZYFWTSNHycw=;
 b=AU3emwFznBnD5L3txx99viQBwylTLA9ULRIRR55IJAYyj1hW27MCaobOdb5hezUOk+c9+iqe5
 MXrTjJ7zFeIA4VMyGA8JhqZcYXfgmOCLWu5KwN3e8n0hgDJ3oJEX7b3
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

The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
pin is shared between a GPIO line and a peripheral function; the pin
mux lives in the global control block and is not described here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/gpio/cortina,cs7542-gpio.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
new file mode 100644
index 000000000..faa302180
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cortina,cs7542-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 GPIO controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The Cortina Systems CS75xx (Goldengate G2) SoCs have five banks of 32
+  GPIO lines, each with its own interrupt. Every pin is shared between a
+  GPIO line and a peripheral function; the choice is made in the global
+  control block and is not part of the GPIO controller.
+
+properties:
+  compatible:
+    const: cortina,cs7542-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    maxItems: 32
+
+  gpio-reserved-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@f00701f0 {
+        compatible = "cortina,cs7542-gpio";
+        reg = <0xf00701f0 0x20>;
+        interrupt-parent = <&intc>;
+        interrupts = <7>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.53.0



