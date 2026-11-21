Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6A606A69C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4s+LOExM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QbLMPLtH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=; b=4s+LOExMkJq9Q3Srm69U13ngNJ
	BWxaAn2gwMJVM5Iqarod37+OO9D43C/sjIEmbrjf/cCLsZaxgWq+5FOCpPo5fuemgJ1fsR/BDg3uF
	l8F3eG4Ltjd7jFDCaPAIbkjwWRGtbnhTktHgYa1wLlNLysPZJF8F7x29VJM+hgy17crmcWXB1v/aP
	Qkok9wmj8gYeh+A5YR+PC7Dr78a8dlmMyU+nQrT6Xm5SRvAuatd5IymJHwSjy1fJI4mNWA7VPvUcm
	UZ6y0BgRTO8ojlFUS2SAYv94ysbanxrhM4wW8VfneZCqRjthk4Qp+TQRR5bCmoSlsPsBMaGdNaBEX
	cVNin1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDu-00000000IQS-2Z2Z;
	Sat, 21 Nov 2026 21:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDt-00000000IPY-39CL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7BF761B73;
	Sat, 21 Nov 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294932;
	b=2fJnnYRw3nMEngaagJ1FjPkOSA2ItVrrIySI7tg2QbajEkg6zupwDy26XHnAF1ZB7KuO
	 zrRSvmNMyBGvm6INX5f1a3TyUZ74Sk7fJd4cepxtXALmLRZUswgOlSnjBr8pASVQ+koZh
	 DJ+IJTj/kOBVqNxZ/aHinl2HMlPtFcg8C92Xiui1pSMT5OcfaHaOfCJvjMeWnZStNBW0P
	 dLgBkqHxp3Jl2gQmm7XRwUOmer94wSTTwA1M+Awj3z3WfjuDYl7WWIxXUaJWnNaU+172+
	 unPIz1Xe1CRlkJdPGt/JvVgZDrtl9Ga9C0p6rv8g5wwgJ2iCvfnicBM5+gr+oX9Wo0Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	b=t5ozOomsp7iKI3sei0aseUA74JudO4UTz2amxLLSuDn+qQ6EtCaJ6dZDnUaqwuLQV/aU
	 fKGDLfezXXfcYWw1QqOslMK3Cr/dJ2FWzKPgafx+K3WTJbkrCu9ZFxETyCmyw73LZLfWl
	 C/umzOmS1VBkh3fPEsFtxMLHiSoSOHnVUuKBlLUuD+uUfPyiKWtIREaxaxVeG1TYTPt2z
	 gxM8ARhNnpYByfTBzJBM1AbsNFWoRfsYn6OhHuGtUNVyJHHXPATvxOk6aEXDBjDRc57Ij
	 ixDhFBxN3Hhm0dPj3LCcDD9fMAmgzqCWGjdhvZNWPjnzkpsWd1+sG57GSIsFGPzo81A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD7991F000C6;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294932;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QbLMPLtH3KdGFjFbfvtaqZdha1mh+Sexnyu+6xTGM97Vw0aSbkX/uaVernZFa/j7I
	 V7LKfusAYVYLLkNAWoWrdh6kD1/QCz4fVX7DObQ4wssHzFda67k3X8oxxUPrB7INSi
	 XW7KiTFxL/5KirkRnPVruewuUNMVVE/LBDiWUL7zVs1QZz46MmgS80P/D1jjcwmoXM
	 JdxvetMcMT5OJytLFDTr3LeICG5mqZlzMuypkS3+k5P+dsyns4ONqJVUNMa1rs5+xP
	 jLy5CGwabYMFz41sHjCDUq0fAp6h8yENzMkHDbnucJUmhey8j9Oo8L4Bvi2CyeKupq
	 /3+MohpCiCXTQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 49CC04BD96;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:46 +0300
Subject: [PATCH v8 01/10] dt-bindings: vendor-prefixes: Add Securifi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-1-5f971b0dc69c@gmail.com>
References: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=944;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=573roVKzdDYFuCfGNESYptLR9xpcGKVT07rDsXKZwOU=;
 b=9IGSTp+UPPKwidUo+IM1fJmflAPWiRdgWJM34LaPqXfLkS6YSbKB5HlKAFo0OMxaOaa7XVoWu
 0Udkp5udGS1BN/jxVxh2g71uO3xJxvsOdXh7b0LzaCN98LWeOnK7mO2
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Securifi Ltd. makes the Almond series of touchscreen Wi-Fi routers.
Add a vendor prefix for it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f9..f1f764ddb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1499,6 +1499,8 @@ patternProperties:
     description: SDMC Technology Co., Ltd
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^securifi,.*":
+    description: Securifi Ltd.
   "^seeed,.*":
     description: Seeed Technology Co., Ltd
   "^seirobotics,.*":

-- 
2.53.0



