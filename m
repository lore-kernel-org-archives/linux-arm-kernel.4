Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C1606EEAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gvHRdAl+;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=mKzXtMPg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vm1P29Q9pGIVuMvApDwWtOHri36Bhi1asrJ/ETI2sEA=; b=gvHRdAl+y5dMCD
	LxtZGxVYNkZMcvptbUTSokWWwgWp409RXc97tm6Q40AmvQFrwrSEYTo8NzcgpHbIKC8Gf8praE3HW
	duXpAs+KC9InwKxxu9fxnd60IWYUnracLOOwHjMTw7+5Z06VCEUrrsZGZddsVy//7o6/P4E+p7eEI
	Hrh46L5GymM3ANl6WXPb3KlEZrKuAjn6K9AsHgltgcrtKT8+9KE8h/vXbEdFxYibQZZValByMknBC
	chBYMnxNU363RhGdfuHa776VHOR9mImjGkP6fWOSNX4CYAJ6yRcCxYSEfKRgGSGxJGkh8/SwGitX6
	gThJupjxyJz7PL8agTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6u-0000000DdII-1lsW;
	Fri, 06 Nov 2026 21:04:32 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6o-0000000DdDS-0nql
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:27 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vm1P29Q9pGIVuMvApDwWtOHri36Bhi1asrJ/ETI2sEA=;
	b=mKzXtMPgtwT9JeGa8yf26RcZBkyDWsxcqmktl5FZMfFmOoebEWNzqP3OIq7NGPFQgK8X+r
	4C3k4+Mi8GwMaltwSSFH3ik9mTxPcHX8LJZp0eT8fETfWCmQUpbcrTdIpV40F74yr+yAii
	BMPUrTwc633PDwFz8LK4/KACwpkMqIc=
Date: Fri, 06 Nov 2026 22:04:11 +0100
Subject: [PATCH 02/15] dt-bindings: nvme: apple: Add apple,t6041-nvme-ans2
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-2-22f4827b4ece@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_130426_428778_E5165AA3 
X-CRM114-Status: UNSURE (   9.46  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"apple,t6041-nvme-ans2" on the Apple M4 Pro/Max SoCs is compatible with
"apple,t8132-nvme-ans2" so add the per-SoC compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index da260cb5597b..24c2be3b9544 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -22,7 +22,9 @@ properties:
           - const: apple,t8103-nvme-ans2
       - const: apple,t8132-nvme-ans2
       - items:
-          - const: apple,t8140-nvme-ans2
+          - enum:
+              - apple,t8140-nvme-ans2
+              - apple,t6041-nvme-ans2
           - const: apple,t8132-nvme-ans2
       - items:
           - enum:
@@ -84,6 +86,7 @@ if:
           - apple,t6000-nvme-ans2
           - apple,t6020-nvme-ans2
           - apple,t6031-nvme-ans2
+          - apple,t6041-nvme-ans2
 then:
   properties:
     power-domains:

-- 
2.56.0


