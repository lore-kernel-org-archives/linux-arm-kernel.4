Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16221606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGwrleK+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NH/FZTCX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=; b=YGwrleK+k7f+nx79mLWaJxtGQX
	79YlPhlkTbu4cxSi2+xipF6wHCmoH77qfqtBFvyEqQ+A1PckG8t1Y9szubWu+puJh461DW+5RrQsz
	evHFZluzGmDb1KH0fE5iQ2IlPVgqP2z6lmOuSui9p1BN8dCbld41qzlX7sChwwMjlh4vD1tLVDixP
	PTszVOcos1uDf4uzCYP2H34uvhcATj5y+HcfKCAbryfF89+y/rGo5XP89fi2efhxasvuV8MtWBTlN
	d/q3ZAqaU2NGUJwD4VHwWGSZg25ulD367HT17ykfJWIc3t2/QcgniYunu1YQDP7fzkx7A//XnAY5T
	UdZvjpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllW-00000005rtz-2ShB;
	Tue, 24 Nov 2026 08:20:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllS-00000005rt6-07Cd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:20:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54B98615E4;
	Tue, 24 Nov 2026 08:20:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795508432;
	b=c0MZwJIvANXqRga9t0E/44d8ua3pqP00TnzuLGw3HLNHrbuOOVu5bkVNJ0x3bQq3dJuP
	 N9rf+pRormZvPyfCUPWFahv0Y3z/ysVSk1y1pZle9Kd8JGNickpFEBJWALqiaWQhudTmx
	 bzsVVfqEFLpiBNNZwH09heuwhOQo/NWhVuPIwwCEeVBNvLSWSFEOKEL04tqYbjGSkGqXr
	 VP4uAdGvU5kYcctwDUeCjvFOxrsts9RWMEYZ8WKKaltnjzwZB5YvyayF2ij/MWS9d8KHk
	 jCOe8OsxoVssPXHiqlMwKQd0ewR4APLMcHo9OcerGE8b/jInDpf9Bu/opGx9XCiR1QQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795508432;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=;
	b=1j3ueOCLXfuQ0Ae5XV3zUf67Hg9orA1M53DDvBBByNKSZRZP1Geu2Kt6h0CaBUF0IVOp
	 CYWG2isF57HFNGA4Nb21xVNJDiqkNlW+UINy/Bnv2G8fHllkNvPrV4Hboc4pf31z58wVz
	 arhZwvXWaG+mOKwc6Fe5uJ7W0jtugFMcOoIBpe608zT9HH61qx+a1bIdqGjjUiYPFE6Aq
	 kp7NaSylink+xRZKeSeYmld9EWIYdgSmaLM817kADEVIKFYffDcjRzUJv2bVU4TQUyOPm
	 QNhoES9WLTKqin6fassDKxkj3HiO0E9DuYimT7JkRpgeywlGQnvQZFAK+oM80ui/DPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 975121F000D1;
	Tue, 24 Nov 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508432;
	bh=65XV3n5OmazkoQahF/FD/QxeH7h22sCza9h0+2Ucpy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NH/FZTCXvWBZ87Ve4yQ+n8+eYTAZYvtyAUa6AGEynRIQyTkcm+DtlSaIWRcHpDu6V
	 szwDXapKz3ta8GDEVoHkCRPfEqoAJb9s2voJ9zyxFAFJhokz/UAp7I4AANn4K7D9D8
	 9KPJCZnV7LzzouNrsWvyW+XuE2cNJzbCKo5KCtmFT3PpstWI+/hEVxywzxt3qQP6Q4
	 N1vMTpyCOWp69UPchbjRLvnwet2qYTaXUuV6OIZKBau6g7pchuZur27KTIuam/IFcK
	 PFZOchk8cyCPvInqIb+m/DXSbTk2Wu5ULBihg3r438I+jiXoZJlJltmuJt2ncNjCjc
	 HvdBCfw9nve9w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 295394C941;
	Tue, 24 Nov 2026 08:20:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 11:20:21 +0300
Subject: [PATCH v2 3/3] MAINTAINERS: Add Cortina Systems CS7542 TRNG
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-trng-v2-3-0192937b44be@gmail.com>
References: <20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com>
In-Reply-To: <20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508418; l=909;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=MzB08CctM8fwsUgGK3bypoUBj9M40TVd0CcGnpP75WA=;
 b=tHE1Fi5oHku4Cl+7MQSTeOe4Ua2Rr2u6spKFraXTw2guvbiji8EzAZuQjfcgw1fYitR5mokd9
 KJQwEwF2iBPCVs2obe6IxL1AC5N38aWUyFioU3hPzKvfyYLAG9ZMquX
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



