Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y2Lw+29+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4rBn3cY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=; b=y2Lw+29+LxG19K2h9w/0xFGMz0
	tvBQvrCs4dU+f+AwqFZeW6HpdVGbfOi/As8HcP8UtbCpQxfNya90X2W00ETj9TIN5QG5kwka8AV+F
	wk+1qPkLpkYJuNm8P2+UHeSqOL/Su4JKxT3ZnV0iNQKNQfN61sh18gAwUyTa8+Ccg2iiffYaA6SdY
	d8iLeckUMhA02OWcv51RAuASUA5p9+VzpKR+0P8BXkGu9errh4/HIwbFV9slSaS4F6zpxB06o3scW
	WyWEOesDNen6lt/y2838tuY4CYECNgATz6/T4SbJcdv+yqfl9h6cdDZRPld9V6Eo9ia1oU9g4ax7C
	PPShBUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadl-00000004pNU-2Ag6;
	Mon, 23 Nov 2026 20:27:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadF-00000004p6i-1hnB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EE6D440EE;
	Mon, 23 Nov 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465640;
	b=kxx3v+l/i+xO/D2PxWxac86nTrdO0s8rfzYX+X2bWXJWDtfXShJiO/FnbAVnbPp5FpCC
	 c3jANZfnKrOhQrWxV8WG3UL4LE9Athw11IzTOA1x2JStMRPQrdKg+QLtu2s6ArAeXmOK6
	 Wy8dzA/Hohs/s+mqN8bfLz7atid6B1wLVV3Pxerc+N/mZw4ze1eEX5c6zfki3uzqTXJ3Z
	 xzmLSGRK73LxuWI+N+psV3E0p6YAqZ8IXoEfnGLpFLC+GKwbkb+g7WWAR9jKlDB5xVdBQ
	 TzYcPUfsRFoQtqY2RD30D3dAwWlGMKkuphemuUyQGC+EkZOvJvP+T926HN2JLosnUFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465640;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	b=laNK2jk6uVmGL+qdBP7NPAJWNC1C/2oitQC9Cp4pfLbDZYIpeBH5xQ89TraQ7tj1rk8W
	 LA9bTLNmWVImQ3Vq/rHwqjz1mkTqQtWeVbmfvL3ukyC1yPpX2MCnSlaQvKn3Z3JqpS1PP
	 Mj0qeoRpQYpGpfWz/gc8mcvy2co3/Ws7kuT8/DJwBV6c/msdvgcfDuj2G2M+GpC+tVgX3
	 B3HR9xAx6xChAsC5AHvaFRfjWrd28Lady+oEOtjlL2HFnvXGbk55OL6W7MPbMoOru4JC8
	 VmmA4Dy0WYxgTPlglMxfSjy7AWTESfq1i4dIUDobUMqAek9WlVZs9c6NBj6xry+9J1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7F591F000D1;
	Mon, 23 Nov 2026 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465640;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z4rBn3cYXr4PEJzkBkDfYfkwJpq/aFtpBPsju/f0IWqCuGLLAjRcQvBfs5LkOpbhc
	 mUrPiJApGf7Xpb3pqCDb5jLO3xAP8PLcl0cpgcN2kE9ynesI5geVpMRM22ECvl3Pym
	 mbHDsa+waDQp0JtM8uBTZyDlZJDJjoyI9yrPESrRfsWHOEazFOYpez/sVV+vMAQDH6
	 lMtnwbc5IwwPmYnkR9YQFFbEfctPT1Czlh65fJYpzAU3mTGv3eJ1iKV8glqDoGSa4i
	 wphOU/sERlTXj+wwJqkBkT608p9ndwDinxk1v9mrPBMiysPXD+g5ZS8rO3xm5Kk4Vf
	 liVC/SjPaOc1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 292114C6ED;
	Mon, 23 Nov 2026 20:27:03 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:27:03 +0300
Subject: [PATCH v2 3/3] MAINTAINERS: Add Cortina Systems CS7542 RTC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-rtc-v2-3-31ab43f2cc8e@gmail.com>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
In-Reply-To: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465620; l=864;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=V966SZMepm42nKofeQHA+zZwJm4nGNGjIsMkGKj6kQA=;
 b=wA45opt4vjFyPK+e5SX5jemXgfYqH0uOMn52kHqQwBqF6TR5ZlmLB7IFfai+TmlOaxhjs7p0S
 jtOF9TABQBjDIA3P0AgfoyhRLcF0x/2CzFMUx6/iGQcAPZjFN6W6ONN
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

Route changes to the CS7542 calendar clock driver and binding
to their subsystem mailing list and the platform maintainer.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..e7f97fb96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,13 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS7542 RTC
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/cortina,cs7542-rtc.yaml
+F:	drivers/rtc/rtc-cs75xx.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



