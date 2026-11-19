Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA5606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5TNG+oc;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=mwIyDaOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PRm3Wwq9NQlmuKonGVqXdDDW70eXnhOzZHSNpZOZBag=; b=P5TNG+oc5zS3HI
	0An5uE+VMOaGge6QRz+x4FZ3OyWg4UzfcL9ZPvukWdK1X9oICwp7Tk0UgwKxZ5DRRXwGgdC0bpC/J
	/sI1HVZ+khhZbq/G6ZhIn6axHZHaXmOWN2dZqTzIDWjPpKDZHbPUbpNCYhaCLxBqhd2S4zTrrL/K5
	J+43oL51E7ndHxPcrcBXSlJbvZleQb/yFILyLYngwhoE3XAPVVG5KGm7+YwhcuVRETM/c4axdZo9K
	0HGxRLfjPxlYfMHSO1sowqM8+zFvOCn/pKg0IcZEmk9ce79vpxgkPxFl8pBZgD14uvA93n/iy9F1w
	NCfFQHOGArxxHgLUmsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Ic-0000000CtPR-0c77;
	Thu, 19 Nov 2026 17:51:54 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6IL-0000000CtG7-3bIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795110698; x=1826646698;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tbxgL7ZsrTWsrmUOa0vRK78LFkh+IqmpmHZmgai13Hk=;
  b=mwIyDaOrA8S3JyB1+dfT3Rl4j8bBtgWQF0oLYg327Ps8Vcg70uvR/pae
   n/GplLSOtfa+yK5kjX/Jbp1DAcCJn82UmaUwHBqGSwY8zOWD2VGmN1YAE
   BmOwOVFEXoXF521LNRYkdJu3oBDcFXzSExLUE1PLyyiU6UgvrqVVL8BdX
   L2bgVUwt1qeFLty2IR9KNhyG1jA+dmKSRiOfHjBl46YcJeYbqvPzQLw6e
   zU/mMjy1LavO6GFrfRCimWjRAlmnMbsMrTjLxlIK30mrxfkEbmjZAaKYL
   GYur23rWHb2Jndvs9bZw53V7f0gTp1ZL7vQ6TBP1vz0IcQs1PdKLzkWEI
   w==;
X-CSE-ConnectionGUID: NHm+IBDSSpaVKRb+Ja9T7A==
X-CSE-MsgGUID: zweesgscSp6pBaQQJvntzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 19:51:36 +0200
X-CSE-ConnectionGUID: NaK7sfVUSV+oJLsBsBliBA==
X-CSE-MsgGUID: ZLMV7MkCQwq8KSRROYyWWA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 19 Nov 2026 19:59:42 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 19 Nov 2026 19:51:34 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 19 Nov 2026 19:51:30 +0200
Subject: [PATCH v3 4/7] dt-bindings: mips: mti,mips-cm: add performance
 counter interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-i6500-cm3-pmu-v3-4-c86410934b51@mobileye.com>
References: <20261119-i6500-cm3-pmu-v3-0-c86410934b51@mobileye.com>
In-Reply-To: <20261119-i6500-cm3-pmu-v3-0-c86410934b51@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Fu Chao-Ying <chao-ying.fu@globalfoundries.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095138_191599_215AE084 
X-CRM114-Status: GOOD (  12.40  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CM3 asserts so_cm_perf_cnt_int when one of its performance counters
overflows. Whether that output is connected to an interrupt controller
input is up to the SoC integrator, so describe it as an optional
'interrupts' property of the coherency-manager node. When absent, the
counters have to be polled by software.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
index d129d6382847..ca7a6717ecdf 100644
--- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -38,6 +38,12 @@ properties:
 
     maxItems: 1
 
+  interrupts:
+    description:
+      Performance counter overflow interrupt of the CM (so_cm_perf_cnt_int).
+      When absent, the performance counters are polled by software.
+    maxItems: 1
+
 required:
   - compatible
 

-- 
2.43.0


