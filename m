Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0853B606EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tmgysK2b;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=0ZdDc77E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5R/XA924hf2/hl4m2jUdl12V8Kzuk7tpWfB2UcZ103k=; b=tmgysK2bgs17LA
	gdYXRF1MCult6nSL8lLLELhyosRq/HJMT9uIqhOEiDSJf23HJcstUSrrEcfvbbBrlb/H1RfpLyO96
	7mPKeoL4i5UXhBtDO9ClqaZKx0uaqSwew+yLLqBcnpQx0suZ7tJU6bz1fEDdZTz7L4qKrHdQ5eB4z
	rCCOllwhOgzzOKZ0MBWv2ux0f0tgwEbdVZGoYZ4n2P/rktOYzO++hERZa/oqYyhUoV09OTJINB/iR
	pGJFmxt0fx4vM0ik/C+7ZyZf4R3ZvbJqv9ugNcAXFPr1XQRlLJnjMUdJpn9HIhDTJnrJkk+I9PGKc
	vQO/f7sRf7Pf+iKZqyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6p-0000000DdEY-0Exk;
	Fri, 06 Nov 2026 21:04:27 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6m-0000000DdDF-00kI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:25 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R/XA924hf2/hl4m2jUdl12V8Kzuk7tpWfB2UcZ103k=;
	b=0ZdDc77EQBpfMoPZnUC8Ssfx/XcokVPqcAkCOlzofP7BDD/otd752MbmKcoWDyBxg9Z0W/
	T0b99hoNYGMD4TzJPWkfa5vABHvF7YfHUVnPUZdeQ5UtjL5is2SQznTcp1o08yjZwTm0/F
	k7Qm876oF5g182D0vhmqz++uOs2hMRU=
Date: Fri, 06 Nov 2026 22:04:10 +0100
Subject: [PATCH 01/15] dt-bindings: nvme: apple: Add apple,t8140-nvme-ans2
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-1-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_130424_268780_04CEE7AB 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"apple,t8140-nvme-ans2" on the Apple A18 Pro SoC is compatible
with "apple,t8132-nvme-ans2" so add its per-SoC compatible.
---
 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index 1179667d8723..da260cb5597b 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -21,6 +21,9 @@ properties:
               - apple,t8122-nvme-ans2
           - const: apple,t8103-nvme-ans2
       - const: apple,t8132-nvme-ans2
+      - items:
+          - const: apple,t8140-nvme-ans2
+          - const: apple,t8132-nvme-ans2
       - items:
           - enum:
               # Do not add additional SoC to this list.

-- 
2.56.0


