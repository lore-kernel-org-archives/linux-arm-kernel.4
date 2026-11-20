Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB93606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8yhp9SL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2ABN7wk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=; b=Z8yhp9SLLGl98zyTuRc9+N1Ejp
	0ccg0JndE01gyd6n0Vhbx1z2eMZW0KPCi3lV1+reghWN+U3dnBwbZMUs5DtPzOrSFkvGxTRDL/Djt
	ShlOKCH5dwjDzbSEIqCNS7pCabI3BwZrjgOjHRag8edTQfprRghFxTQZLdmoL2zsWCGpQ1NxGnQPy
	nZrC/olD81gsHJHj3cfgDPV2XjrgmhN2ZLJVNe4s6OS5kCPnpGZcN/fKpAnfv/MGH96U5+D71mCMq
	ts8q8PVEPDtg4Ki1+3psKSaPJ8otjPnVjA1g64Q5YP2w4BuT/4Ku2YqSO+OubYOOancgnxsiP9E8h
	0sVTZyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf7-0000000Dl6I-2CHz;
	Fri, 20 Nov 2026 00:39:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf6-0000000Dl4K-0T4E;
	Fri, 20 Nov 2026 00:39:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31FA56122B;
	Fri, 20 Nov 2026 00:39:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795135170;
	b=0x/ddWcNMbC+eUKOCeAgy5cmlPYbbx8cjooKlwQpMCtidIme1IZwUKt019sKEvJBH64d
	 tj2ZyTzS+fXcde8NwJBGkvmV86pDNF4uDEhZvqNpQvuLz+FuDzM9R7wbbGHng8ohQyWPe
	 SsGH+TqMQ7ESQjDJM7s7RiHUyW0QC0hheGwQQ3Dai8xWLaW9NUHhDiFNczvWIsBee+0Cb
	 4vE8KEP8nbMpHwuxosiXGXGkhqP9cf3xugopNlIDpEcsFtPUo1gulNNqKGv1dnwe2LeNs
	 4gPIrHOFUExt8eEh0XcYHIH/ZOOj7nYfyaQkgFTEgkNqGeDqg3RO+TLGdHrBDCHdUPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795135170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=;
	b=uxhJuStZFFH3KRuwERjlsUfaQ2708d5ZOlR7y0g9wHxS3EmnNdoUC+ZtH/zWuxJS5o2h
	 XAisgij+vocnzCEnfU2oUMWnZCTCbgTygg5YCZPJrNnydrvnfYQ7mWSgjWBU6hHWk4fJO
	 cIIXhV32mkaIGSoiicaUVg++QHyc6EYrQ+kfp3nXvHPla0lm9yKYsHhASa1bKd9nT2AK/
	 2s5PUlytie5VgCNMBrLeKC2CVA9cmrbHLhtYPIfyLW1K9d2AxWDNDidpH6sbeeLAcH4FB
	 T/fLyZBmhKR1qiC9L+SJnBFKOiuX7INlfNF0wz7HDLBlispW1kKtlvIBdH+i4WTaTAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EBFD1F000CA;
	Fri, 20 Nov 2026 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135170;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S2ABN7wkzPKbR94kwk/FvJCsvtImOyG9gRg4rqPEidTUcHUdsZqhYCMdFHuErjjwF
	 UO48WElkJlheblOsQ1Q+hPIa2sVX8FO+Ws19RzH7aUp7v+wptq9oLwBcNA/G2ZtyBA
	 936YolD/jZKWG1mfVVfBHBB5Twb8J0gPoKVJlYEdubklyyn1K/uk+YAWHPv0Tru89A
	 MBtK5YiXrs2bqd2lHmkjxjVSaPRf1ySDe6N1P25JqVZ7vvsQvpY139dnh9AxrnFKqP
	 xshKlCjgwQQiDILRxrpjvJU67X3xI6N9b84QD9tQDtQEZZhflckXiXxxughdvnzPGj
	 4HTi0LL5PyBXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92238425E3;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 20 Nov 2026 01:39:28 +0100
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Mekotronics R58X-Pro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-rk3588-mekotronics-r58x-pro-v1-2-4e70c077c7b4@pardini.net>
References: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
In-Reply-To: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=2G78J0UgfXoTrXCAbZ5jv/J7JIo2b+DqfUU1E8WzZBA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq/5bAQTWLRYGYREzXDvbPG8mt9JJ3ioqRNk0VE
 Fipxd+VixaJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCav+WwAAKCRA7Xj/jnsft
 6ZJKB/9njf+S8P+q2eGygIUa18wgD85SjCrCbvr1wsJiwBNdxtRLlRVd0ndrpH3qLha3/8YXSoJ
 7fHN4FmrrBwBQr9u4rYQHMzfwGIf2XSNuLLV4fEQ78Z1KChohTvOLjlWpYiZtM5iLeJN1cc9ziF
 dM/XY3i9/xxdumSuKinm0qH2nesOET8QnDrT8SHmkRZ2sTLH7NUWJN0+Cv+U+Dw4+TVwAuedagq
 FW7il78IV8/LvkWn/mPv9+S2vx1NekP/8SRlrvCuvhvo1GiHIf0BDlAQO2kbDj4M4jOPdfaNFrB
 X4O29dFdsjn1me1sx1pYoj+VzxZMwWV3nTzZJ5Y2NW7+BOe7
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Pardini <ricardo@pardini.net>

Add the compatible for the Mekotronics R58X-Pro, an industrial mini PC
based on the Rockchip RK3588 SoC.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..e8817cebdba9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -864,6 +864,11 @@ properties:
           - const: widora,mangopi-m28k
           - const: rockchip,rk3528
 
+      - description: Mekotronics R58X-Pro
+        items:
+          - const: mekotronics,r58x-pro
+          - const: rockchip,rk3588
+
       - description: mqmaker MiQi
         items:
           - const: mqmaker,miqi

-- 
2.47.3



