Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EcKlrfsm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kS6UdBKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gaVuKFdtIle7JKOMDQ/wcXTfl8tFDx4LliF2md1UKpw=; b=EcKlrfsm1SiHxO
	u65CTxjbj6JAs8RQqTB/FnqgCLvvb+3I0bHX87Ok00KiosktJXpX/KEMsZX7FxPfLU/hciqC3jzZo
	n9ru9zWkrhX/Hyz7+LChA2kVwYqMWqRVVxq7Rtatgqctval5LrkJmnKZ0V93dw2/2/L3P3SHlbQdv
	Afisakqf4MnSxIJS4+G9xsr/mvyYu7mTHCcVInSPU32N+D2xd1KpQOJgSr8tauV6ymdkZq9nLRUR2
	55VTYqxdZCaAIgMTLYIPbwgSIjJnM0PdeiD0RtsK3gBRt4ZvAiZ6gYgCV190ilIPDneRXhyXgaNy/
	8tR98VX+MOq6JME3Iujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStn0-00000001w9q-0Kcm;
	Mon, 16 Nov 2026 10:18:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStmv-00000001w8H-36sI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:18:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A3B761215
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4E81F000C5;
	Mon, 16 Nov 2026 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824292;
	bh=gaVuKFdtIle7JKOMDQ/wcXTfl8tFDx4LliF2md1UKpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kS6UdBKNRiz6+pU4ndVMPIn6Gy3EXHZWifC79HLVWf3YBVT9yormhp9TNfzmQMmc/
	 2CZw0AqFdyTJVs/UzlOnSqByVjAZdpQielYdGZoGLQCY3BstmAtjQF32oiXfxKNxYY
	 TUQh6IdLj89A4F3EgHRh2aS0LIg9WokgM+jBPW2XB1SlONOKLMsVkleztZkvp6HIR+
	 hWMkinrDWVvpYxTn9OuhyuAKikKc5U2NI7jRi/7zHti58yREHE/oLRc9PkTs8VOH0T
	 b9q2MuH3lBAPKWdCvtve5ahyMV7Asck5EZita4YJbct1udes+2ZVKDCiYugR8ETuaG
	 anubmRpUTkARw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:18:07 +0100
Subject: [PATCH 1/3] ARM: dts: ux500: Rename power domains node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ux500-powerdomain-dts-v1-1-e0f4459c3ab1@kernel.org>
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
In-Reply-To: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, 
 linux-pm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

This matches the naming used in the binding document
Documentation/devicetree/bindings/power/power-domain.yaml
It's most logical to call it a power controller.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 912d2505318e..5b2b4527a472 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -343,7 +343,7 @@ pmu {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pm_domains: pm_domains0 {
+		pm_domains: power-controller {
 			compatible = "stericsson,ux500-pm-domains";
 			#power-domain-cells = <1>;
 		};

-- 
2.56.0


