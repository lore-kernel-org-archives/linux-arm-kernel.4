Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B79606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tdtDSQEI;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cLuxjmkw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N8fkAzHTMmXQK5kkCqSvxK9vSLYdjWOlTgVwabwGWQs=; b=tdtDSQEI/MST40
	6JUyHNG/MfZ9rgtIjLnz81wlp7V5yWgBx08y0tRlHO6WWIP6L0LqWn3Xqh7GW79WN7evDAocKX+8a
	7Voj60ikyZRmTbjWiSkItpzbxHCi+jhINqWR2v5QvsSR+x1lF2VAnem/LMnbFD0kEfeKi3sWWzwyv
	ujgYPYejpS1eOSJM3ntnIS0weKImKT+erVSzdJ6Pk972b3snGn3X3RKS/dX328DRKzJXQsIGInjxh
	jRVlq2Ol4o2CDmquLzjAPZvOLlU0yTVogmqlhlrcM88k4FW5X1WtUFvizNqW+x9d7GC2OSKL1O7hh
	uZz46IvZQpL9lhKfBugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMF-0000000DLSV-3fwX;
	Fri, 06 Nov 2026 18:08:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM7-0000000DLMl-3cat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4F891682;
	Fri,  6 Nov 2026 10:07:59 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 229B73F673;
	Fri,  6 Nov 2026 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988482; bh=0sQyUBmWBpYRJ12TUOeZeZAxa6t3iC1IRmwLSvpeT3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cLuxjmkwBMAhPVjdWAmknQbUVcaMKFx0ras2eQEN1e9H+GsR/Sz4cUK+bMEwsDE99
	 WMv5TQLyaonGL8NKOUaZdXcmVV/wqiZlqVYe+lRejV9Xh0X1ww4U2WemLSRQYdCczY
	 T+W8AvsVe5lNR3RJPRp/YYE0dfvvDNnzcHWr/jVY=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: perf: Add Arm Bus Monitor Unit
Date: Fri,  6 Nov 2026 18:07:45 +0000
Message-ID: <2df5b5c0185b94602429674826e058b9687e476e.1793986672.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1793986672.git.robin.murphy@arm.com>
References: <cover.1793986672.git.robin.murphy@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100803_943963_C236E6B3 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -4.4 (----)
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

Arm's Bus Monitor Unit is a low-level performance analysis tool for
matching and counting transactions at interconnect interfaces. Typical
platforms will have multiple BMUs each measuring multiple interfaces in
various parts of the system, hence for the sake of usability we make it
mandatory for the platform to label each instance such that the end user
can correlate with platform documentation to know what's what.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../bindings/perf/arm,bus-monitor-unit.yaml   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml

diff --git a/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml b/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
new file mode 100644
index 000000000000..3da59e5447e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/arm,bus-monitor-unit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Bus Monitor Unit
+
+maintainers:
+  - Robin Murphy <robin.murphy@arm.com>
+
+properties:
+  compatible:
+    const: arm,bus-monitor-unit
+
+  reg:
+    items:
+      - description: Full BMU register space
+
+  interrupts:
+    items:
+      - description: PMU overflow interrupt
+
+  label:
+    description: BMU instance identifier (same as ACPI _UID), per the
+      platform optimisation guide
+
+required:
+  - compatible
+  - reg
+  - label
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@12340000 {
+        compatible = "arm,bus-monitor-unit";
+        reg = <0x12340000 0x40000>;
+        label = "ddr_ch_1_2";
+    };
-- 
2.54.0.dirty


