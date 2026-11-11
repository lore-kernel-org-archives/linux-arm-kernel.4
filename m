Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F360700A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+hhmU8w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYtaJBDm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xGCf+Bz5lFU1XFCRiHnhKx3lB4GnvS9tp4aw7yUggkE=; b=g+hhmU8w9UttZV
	taASYpjwitEFHR95V1vp4IGKSEiGwvn9nUBmrRmkvjKyPHU9M4gI3iEljS8RZMEojc7OHL8UO9wRB
	el0I71aOXQ0v3Y1jGtnW1BW631MvMbVu1UKgCBmYnJv0h1NtCQ7TZ8gkcLk/cwsOO0TiNM+mVhv8Y
	HIHRj6I3NeLPrwnqJrifGXxVtMojU1hRh8MWAeBWyGVE7w3iXraKIs4OqBYbhP4Gc/N6Kud/UAcds
	BierivwxdHqsCREzo9yMjlLTernVHzkgNq1uP7WAkRYTXI3LN3W5LJmqcn+gjiqExCcuj+x2qlM4X
	Njdj35dKOXoWGSmIJzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBN-00000007XWM-0txq;
	Wed, 11 Nov 2026 19:40:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBJ-00000007XUg-0kJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EAB994777F;
	Wed, 11 Nov 2026 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924EA1F00A11;
	Wed, 11 Nov 2026 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426028;
	bh=xGCf+Bz5lFU1XFCRiHnhKx3lB4GnvS9tp4aw7yUggkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iYtaJBDmoEOy36rVT3sOYX2k89eAgCPaJocVb4IlGFA6zSLCvaeeki4jSX8thqUsa
	 YSDvWwDzjHaJDriCDflrUVVBXTXfYurAsZox/5wEhCmLjehbtfKeiTt3KuB64pSJ3+
	 CS1FdPgI9Z/oeKekXHYI1ZZW/pAI1eihQvD6CJdobdWJZ8teCWjvb6kNHYMFg65OhL
	 UUFifH4c0aTDd5qeiG36/rFh7i7IX8R0Ghn4J2ta0ejapIdr/Ft8rf6F4mIRKHMjoP
	 tkGflCBlnwV3qAkBkDmOB97pp9QDpcnyM4uaiWFAhqG0tpmvQCOKyW3McHUvJVvNPR
	 EFtUK3LSSjxkw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:12 -0600
Subject: [PATCH 02/12] dt-bindings: mfd: Add HiSilicon reboot mode syscon
 schema
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Add a dedicated schema for the HiSilicon reboot-mode syscon nodes and
their reboot-mode child device which are missing a specific compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/hisilicon,hi6220-reboot-mode.yaml | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml
new file mode 100644
index 000000000000..8114d87d5f95
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/hisilicon,hi6220-reboot-mode.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon reboot mode system controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3660-reboot-mode
+          - hisilicon,hi6220-reboot-mode
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: syscon-common.yaml#
+
+unevaluatedProperties: false

-- 
2.53.0


