Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=csU8nI6M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWj3MRF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=; b=csU8nI6MKFxECcgdxjKBOKeOaf
	VHsUV7ysdWTEm9JvnXZpgcnNdgNLNo8hCRBUPuQndm1HxSVY3sRK7ldKmxMm702K3a15TegpnLvs+
	vEMl+R0+QQq4kAD6K1r93hGcNNJkl0J3u1nWkuZuNjy+ZNskXX6e0jqGZKMUkwi/Yqz1yAE0ga/IJ
	wAoTRthZ62r1i4MolKQfvPxubEU41fTADvRyF0hfXuYM2jN4+mFRLWz4r2gS/0L8ohANXSGwZlAZ+
	yMFG6wUdwtKKHo8wUSPj9gEON70e2mmahqsplKD8i5FDG+Et9CMHVFm2fEgmxlEMAhYNh1vLm6RSY
	pXpmqXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWVL-00000001is4-0wIm;
	Mon, 09 Nov 2026 21:02:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWVB-00000001iqc-3qxg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CDD141841;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794258125;
	b=11sk9D9ruzcBCmP+enM98k1o/hWa58Kba0Nk2bhi8sic9vWpEPF30OyVqfDk5qHgu4m/
	 YenGjYPNLmlmHqQ4g2CkuLVZKSnK7YYbesfMgfZQH98r13RpzHOtsg6UoXSm9Y+SRC1QU
	 FXy1neE/n7Dln79AWCoPgbwvdKaiEOOnhFpLi2pCoz3WGM0G2U162oNqlKNvU2ujVv/ld
	 rhwn39YelClNUf0UKSs1rNXXoehCQPeacIxmGJviPH4rCJG5wbIqqfGqQeTuGZQLvbv+3
	 2q4TIQq30UyD8VNUEtNvZ+X/ttszk3AU+vaO2X9KXnY9fmzRt+GccT9HDgJ9ZWV201A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258125;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=En7L7vyYmO4C92yZU0R+Og1/U5inekiVljrQevCYT7NfmWL5cfIdwUHqMFtlPhonsR+4
	 k+ebHMHbK3YLeDUtme9n/5G+t7IEogkoDFAVWWf+WdeOQ7hOYG5UVdK0O09dkYSvG7POT
	 BY68yYG92q5McmHk2WGR66450GoTeb8O3gljtnIs2PRnqmLEPGYxrOgD8c8yYKXtGlqnF
	 TvcexYShwVubWFscPx1m8fDp2AzoLpSKiQ7bSDnP3YtCasKehB03/wuKxonyjk/hfa6hZ
	 OKJZDqb8qNB6MPuHKj2sG2z5GW4yoDBkTlxuUCZvqr+KHWfo2mHhPPqGqFBGOW4c59g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02B9B1F008A1;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258125;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WWj3MRF1CsS9ekTN5vyqKz6GAcd8jUFwYzxz//21SOeahzRMhbLpxompo8VJ/r3x/
	 aCMALzfCfgMbsvRHzSyvFnWQ8HKRjg+8TYd5b6JKQHvb6ckvf8TpEWI6sySQIlAEs7
	 wwESC8yVYnVTZBRV24pxGYR/H/0NrvZPCNqLuOWG0z7Mg2RoLfEiyWLVXtDKshi1Pj
	 uhedAZzn5hwNILhzmZrOMbzxAASIdt4/1mYogb1PABq+TN81O16aCJ4900vjMmj9/2
	 YX/NRAWUk7y78sLX/vSAtUlCEarZVH+AkkBv4FThCRhAUCfxfH0BWYvhHpo4AEnAyI
	 zkK4KxVlDfPQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69B8448645;
	Mon,  9 Nov 2026 21:02:04 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 21:02:02 +0000
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: samsung-boards: Add
 bindings for SM-T515 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-gta3xllte-support-v2-1-85c31b6efebd@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794258123; l=932;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=rPHV+1f50EZ85D3csJMso8rMA1UhcD9FsDkCoV1Wx3o=;
 b=zUnWIrqvadiWfBOS7sVKmVI09UnbwQgEzT1TCWU/YJA2x+FMIDqrTIJwAk0MNH0+YVgWpLN9l
 xhuGqB0AkYwDYLxonFJPW+ZK1pX9fkNKksjEeJaueAvFfRf/pf93k2I
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
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
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Add devicetree bindings for Samsung Galaxy Tab A 10.1 (2019, 4G) board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..6ac7f895351e 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -226,6 +226,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
 

-- 
2.56.0



