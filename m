Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C3606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uLcPcAql;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=UoTVeSE0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sFHPBhyxEeqzI/mLr3+tgL1IHWLq7an7I5T8KPeBRhc=; b=uLcPcAqlWTRrm6
	OTJ4ZH/2UAc5nvO+Q3drQuzIog5Xk4OBqHZbDNG1X8PXJWEvC8j9qWxWpBik8AbvhHpDJurllUg5N
	+Lp11KM++IBMQU3dr1LSzGhOe6+E5qFzv0ypaTc/bQeO4JBWh+Mmw4rC+4hMcubFhVa74g3J6pcom
	vKGA7qdG0UL7o24s6fNUIHpZPj8KWLR50Zqm+8HQUitOZXSRXBjcBf9g8rRyRTFDHekw9XQA6AaMk
	PVQYRqCakRhk0eBqRY3bDs1RCxJBfrdvv/oXHCU36VruB6b8DjMuqboDoIuwtirxQPurLVVuYekDO
	U/LiOmkVPE5z18oP17+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2p0-0000000GCFT-2LUd;
	Sun, 08 Nov 2026 13:20:34 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2ox-0000000GCDq-16ox
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 13:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794144031; x=1825680031;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=upY+Mz2RBSTRetbNF/wY4CRuGU76bONdjwh7Q0RZt1g=;
  b=UoTVeSE0FrGFGxpAJ3PqYkKahPzlnAhMGNqgOCbK7yE+cNet1VhbYz+H
   gtxGegX5QxVirpI6tFpwZC5+uVsOys7VIqQlG+WPt4h86cDna+sgJYoUB
   2sjEYL8BFZQ0GaIk2c9gccrXAfTSIMltMUdQeVZwgooEpquDmbyX36HQr
   gDhAGCzFGPlrOlz2oAvjNnEISd59iaYp/P95Mmjzu7+tDxkovxTK5Ga1F
   hATZYzPKW1Amz6DtkJELfF9VzWmIX81uQ5tb6LsMP1zz1AEAnXXtgcV2E
   qnp1YkvuujGbgZqCec+oDF5HLAaxJJ3CtYoKg9CjsDbijBuaM/aSB1qg3
   A==;
X-CSE-ConnectionGUID: nogDTVEtS5mHxkCILY+3Jg==
X-CSE-MsgGUID: gZL5EhjjRjy6GH/uiV6QLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 15:20:29 +0200
X-CSE-ConnectionGUID: WSxVgLy6RN2kmPh+/ozyhA==
X-CSE-MsgGUID: sNbE+X9kS8+AS8m5znFH4A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 08 Nov 2026 15:28:36 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 08 Nov 2026 15:20:27 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 08 Nov 2026 15:20:12 +0200
Subject: [PATCH 3/5] dt-bindings: mips: mti,mips-cm: add performance
 counter interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-i6500-cm3-pmu-v1-3-bd119584891a@mobileye.com>
References: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
In-Reply-To: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Fu Chao-Ying <chao-ying.fu@globalfoundries.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_052031_617306_9A1EC90E 
X-CRM114-Status: GOOD (  11.62  )
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


