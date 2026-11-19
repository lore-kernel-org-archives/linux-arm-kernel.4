Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A760A263B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yf40xhK5;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=jX8BolGm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lyATTZSpPwfe+0tTFDl9okuYREBYcyzOpR8HimDcF54=; b=Yf40xhK5Z7MsXr
	IGfobdAsrxLSd/6S0AdsfAbBJ+S7wm+Alu/ULJ00JGIbBKVzed4eO9/zgz5Ye8gf4FdLjYfBVExdI
	JYrVSVJKyafGr5LYyyFumR/nGjXF6EHThIk9qJMht43lkkPcyzpDaAkKHcwpLvTuh/tBn0Ej89SWK
	BohHSiBfXKC6wgdltUm9hSzAK7SNggIo0+nGcBYbPaSMjEEEdhnUUPWxNJ/JL/+c7NQlr84GHP1LR
	bS+7CefnSDoO0H9YAlyp6jX1Xb59UGViTGUYGEyOxkYGHVq1CQq2QN/PBBqDhBn+Te3RsLAAOkwgV
	voQs/1I3efEmE18vk7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Ic-0000000CtQQ-33Fm;
	Thu, 19 Nov 2026 17:51:54 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6IO-0000000CtG7-2g3g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795110700; x=1826646700;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=huVfTbErH6adnt9mw42pnrtw5P+Ckl7UHBlLJGXkTlo=;
  b=jX8BolGmfOOejtNBX+X6RfcoX5hp2lp8BPXTPML6dvD4ndu3vW/x2Y8h
   3nCQl7hx6JrLK8NhUPUfa1lITDenB4eBlQ+uwwT6yKoknf9UgcBRWgiZZ
   AVZbfS5cuRvoKBekQUVZabCFobUsRu0tx1XFPDH/3Kv9KR5US+hIKaqeU
   uPgZme7nFpNzDj7xmII7z8MluPiRd0N498JE5vcQmQAcu99N7ewkNG9vg
   OjqDka3TBPHpWFsQSaYVHsDZynTMehE6JUrfDAEmhGg9M3cg+I/x7djdJ
   E0mkd67zbZA1egndwJcwN6sqeZvxO3waHMBLefrqWxPexHgpeUo4BTy3e
   g==;
X-CSE-ConnectionGUID: GEEV0erwS1mGIMUlJTUlqQ==
X-CSE-MsgGUID: M9/RSX7vRLCDIPOA2zlHEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 19:51:39 +0200
X-CSE-ConnectionGUID: ri2IGrxzQdOPJsIu1/kODA==
X-CSE-MsgGUID: ODobeq1NQgavWhZ8D8UMoQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 19 Nov 2026 19:59:53 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 19 Nov 2026 19:51:37 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 19 Nov 2026 19:51:33 +0200
Subject: [PATCH v3 7/7] MAINTAINERS: Add entry for MIPS CM3 PMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-i6500-cm3-pmu-v3-7-c86410934b51@mobileye.com>
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
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095140_972688_8496075D 
X-CRM114-Status: GOOD (  12.78  )
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

Add a MAINTAINERS entry covering the driver for the MIPS CM3 PMU

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..e9a02076017b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18227,6 +18227,12 @@ F:	arch/mips/configs/generic/board-boston.config
 F:	drivers/clk/imgtec/clk-boston.c
 F:	include/dt-bindings/clock/boston-clock.h
 
+MIPS CM3 PMU
+M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+S:	Maintained
+F:	Documentation/admin-guide/perf/mips_cm3_pmu.rst
+F:	drivers/perf/mips_cm3_pmu.c
+
 MIPS CORE DRIVERS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org

-- 
2.43.0


