Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE732606AB5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oDis1T/V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/31b13/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WbtZfz6Ubs4QUtks6beIlGcmS0Vsf5BKmpwpM07CG88=; b=oDis1T/V8w8wGC
	kVhfExi1W17KBZhw4dvS8UdFBXU41Z62V7Mv1YEtT2qAPcLv+o68EKQoVrIzXaETEaDH8mGG8iXft
	CX8L4bAwbrXK0cyvJn8xlqv58ex8/e/4crXBBECkTvmbpEJC4P7ixFAJYF/UPasfLqrjR3CkXO98J
	JZ2Y5/pxxW71tIPCAvSWyDFJM3T7tSUG+F8cp7dZiXhCqKcaGmjvOlEgSGi2998rgZTtcTQ6zHjDS
	fJc+eQed4cRk5cUoF+x4JEh/acUHPjGfqfRySczCwXUg/Sxq9dOP1QLoHhvKozK0EJLGb09bSBlFt
	IuBpDePCl13mmLCToYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBN-00000007XW1-0OXe;
	Wed, 11 Nov 2026 19:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBI-00000007XUE-1KQA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCC68407C2;
	Wed, 11 Nov 2026 19:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716FE1F00A12;
	Wed, 11 Nov 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426027;
	bh=WbtZfz6Ubs4QUtks6beIlGcmS0Vsf5BKmpwpM07CG88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f/31b13/R2FZtZ3q3vCquxU8orHm4wVVI0X8E56yMA3CQEIc+kH7d4A0NUK9BNxaS
	 QoeIb4qVIykPid6hoIlw4UTfIHgg0A6XTriG4KKnEncXHo9C9G0X4h30g92n/MVFNE
	 sqDEHs42KCSQ9zwuaYmcTvbC1sJwb46q/jBmh0B01mNxKGxgKGVD8ba7fntVJ7eCU6
	 4xqrSQfWK/pEaVkiAh9H8DGXvLG/sP4ajzc7ZmAibipos1cXcct+uw+3aF53CIZVpE
	 zmEKG2a9i6Ab3bUVAL3YZT6Ae83y5yad01tNTdsmh4p8S4O/omJy/HpI8OCB6pHGpm
	 9c8QNMonOI7HQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:11 -0600
Subject: [PATCH 01/12] dt-bindings: mfd: syscon: Add HiSilicon register
 bank compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-1-6c9f5f80716c@kernel.org>
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

Several HiSilicon syscon blocks are missing specific compatibles. Add
compatibles for the Hi6220 media NOC ADE, HIP06/HIP07 SerDes control,
and HIP07 DSA CPLD register banks accessed through syscon references.
The names are based on the label names in the .dts files.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..1e2a46ac2e3a 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -69,8 +69,12 @@ properties:
               - fsl,vf610-anatop
               - fsl,vf610-mscm-cpucfg
               - hisilicon,dsa-subctrl
+              - hisilicon,hi6220-medianoc-ade
               - hisilicon,hi6220-sramctrl
               - hisilicon,hip04-ppe
+              - hisilicon,hip06-serdes-ctrl
+              - hisilicon,hip07-dsa-cpld
+              - hisilicon,hip07-serdes-ctrl
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
               - hpe,gxp-sysreg

-- 
2.53.0


