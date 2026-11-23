Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXzOg2rj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtblAx1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=; b=vXzOg2rjPcvEDKsdrTPzXKBeE3
	B9CG4BELMh6T8qh5+Z+1JPbj9NohG04o7UATTJ2vakSXXc6WxCyDdzExMJRyeJnIwi7hL0r+BHY1d
	lNpBK9Jis/tc8Q4JR3bqQzeW/Ty/3/txTeJpYNhPKEf4lIyIA+1+7B1pvVyCktkXUc3Zs6PlqJJtf
	WtGzECjKWRXXL5aKpbIr6RzWYNfxOogb1s8bmrdxREo8i15Vlzp0paNK+wN9qKQ+mxrFC2iSmBTgC
	XeZ15wkTO97Et1FS56ZY7EM3Jqn5sw2bOAdmBjEKLdGl3jYgQd56sOn//cWEP3EJ1gwSbVRgyJMEj
	Iy0xMLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzw-00000004X2Y-200o;
	Mon, 23 Nov 2026 18:42:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzM-00000004WUw-1JJC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1740245A70;
	Mon, 23 Nov 2026 18:42:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459324;
	b=ofFVj/WVlyjKtYnxEFviH1I+0fm4iwrDzPy2Tjj6dHQD5wg4eWVnJbHIjYwBivgWP+o1
	 NnwoxByUT6o4sUbwZ8W2duNjH/9BynnhN1qs0oPlLkgD3tYpt+DIZ97wLSesgb4r5NjRY
	 CFkhE17iCzOXp/PfkAy6kJdfeCTGBj5IOBr7/YYqGHe7lzpuTAab1EG6gRzCFcXwQxg+b
	 rSDiCw9qphevDYtjJ1xCa/cX7cnxXiODiPV/0xELObniQuKH0s+Cz6ickvDwe026eEKC2
	 Is18ZnhtRHUZwwohUAqEfCBJlZMpEYyO9Cx91NB8JApLZW1Z2Pw9wkeNrjjZvYB4veg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459324;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=;
	b=VXwgA7gExPzxtPfs5YKhugcuoTWkFUoWEAJICJShPiGnrsqdiCGONwpZJ5lKE+N5Rl/N
	 sjxYUwTRG0ji2dASlVYZuY9DOuirzCRNLrkyHwna0hlCKZddbPhnJdVjB/tmxhWPirps/
	 5B/rtMLdkHIilSqYzSoh4Y4GqsJI7J2jJCfeCAHNteCMvpuGZHQGj5vIdnAOZ3WBhGcbs
	 4isWnAFId81FTjINRy6UwbyY0ggrdATPhnrxPSMu6SxraAEYowkGJDDYBmGYCCpOx29gv
	 yLdSKtcKebYZMMWVrin+fsinUEGUcMEyEd2Z+L7BV7E4ItidhplnYqwhOkbID1CBjhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF3921F00A03;
	Mon, 23 Nov 2026 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459323;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AtblAx1aqGRKk6ImEPMzRvTpcTwX3dvcN5wTG4A7h2GW32V7aaeJT31iEwFnZQScf
	 klIuLsN8DNMgs3ubbMx8v2uyue/ykezawANHNjznWEp3mlGE3Pit4/piOJJgGA0ZzO
	 rAHaX2OGOpzMF//ZrAf2Wa8hx65yEvxOO1myKxZE+lNbYW5+zeuCwDlrXv332oRw3D
	 +SBwN1GfYB2XF5OE73xjQJA4gFU1MzP2iQB8brxLlfAcyOVcnoQaBVxJkO3to4K5as
	 JgNxDcGUQjE+rwkcoRfV4GPjiGlKldkhfVZWcc95NmUJr7tv7LZ0tivlI4E8KNJA0b
	 qH84AAbH4L90Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6E7CC4C5D9;
	Mon, 23 Nov 2026 18:41:35 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:36 +0300
Subject: [PATCH 3/3] MAINTAINERS: Add Cortina Systems CS7542 TRNG support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-trng-v1-3-92d9ffcee531@gmail.com>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
In-Reply-To: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459294; l=909;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=MzB08CctM8fwsUgGK3bypoUBj9M40TVd0CcGnpP75WA=;
 b=N6RVj59IEkHti0WR8j1M1CP9Z2QUvmfNUVUF87ibspUEEE5Jd2HiA+5NoVHeEWCnCanbQWjjI
 SrRM+HiVySfDUA/ISJgQ3L4xWIWWVGlsXWVh2Qb5IP+pzrCTOif2Y3A
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

Route changes to the CS7542 random number generator driver and binding
to their subsystem mailing list and the platform maintainer.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..46d0a5778 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,13 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS7542 RANDOM NUMBER GENERATOR
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml
+F:	drivers/char/hw_random/cs75xx-trng.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



