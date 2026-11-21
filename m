Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF4B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=020LHbeX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfXsunPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=; b=020LHbeX2ga51h
	eouGZu2b6KjQZloIRNc6ooTLTYWp1PxCO839rwH88kCHSnH74nL1Dgk7KFeDmzcSoEvs9e9x5hHfO
	bxJXnFDVUilNtTsh1WA550fP8IZ63si0jFyF9FrG0RgdzvzkWMafyEIFEUpDMC9Pxl2/y9D/qfvgE
	s+OPz1opisrGyQcE6Pm0XmgvCanaun2qFsS28o/LFQNZiYimsikmhAwQ8K5OQ3ApRlkfUbHhecKdT
	QbG/jPwajMq7EfuQ6xJkVhu0laObFKnx5bRhnCOH8MBSXVycxfattcROiNK1ap784aV3raKW5fAsH
	HhY9bPM/Pu6xbTLC4SxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYU-0000000Gw8V-3wcu;
	Sat, 21 Nov 2026 08:34:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYT-0000000Gw7n-2Cb8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:34:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01DAB4128B;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250080;
	b=Ktafl5LyDqbNCiCPTkpOxIjKdgvbgJhTqy6oqwkSGZVC4xwlLOfKC/qN2ucNMbilDPUB
	 YZs9pkmTasnR73gZ1gQ3gUT2ls6inJeUjf86E0zrGsh6H4AGa6S6g7W3usJtbSyMeu9Xl
	 7Qsd6bRY++OaYEYo7BvmXRLUXKuhOoLMgKJmBqUWV/hcArkDxjoSyklRAif4oYh1Qf5RQ
	 /fXD/CcBt4bSPTgvz8ayNRCMTa8mLstvMA2tJHN1X75Uf5fV+MXu9j5aOWut0Gasp1Ir/
	 bIcEnsfn2uUpCFtHP5SpDOfTwOnVX8eVWHYJvdJo/N/mmsPn6P7H0yUTV0eE2NYxBzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=;
	b=xhxVTyEThy7OMg3s/6nWhS3fh+AR+3TCzmPTYEyWD2+ydKiEHPGarPTzuvAqmS03HHV9
	 ix3q2zXIP8j2+tgUjBJ2K4E9j/VyLvDNhsXH0O9IzoMSY4Q6PwWvVcQjuuOimRrcrSUWr
	 KMADPgBTXMdUH+AZQ60hBtC69TK6iUaFRf/Smfdkx9Gp5RhB/2nVFxuE8JBFQJRNzDxzi
	 sX/WxdoIXbccwwzdI+Gb139H5qPfJB5iBzHEwvbJLDKq2uiz8U+IhWRFOFCPnX5msya+D
	 XrqrLhU2zFErnQpZoKEIMG13van0DI1bra0PhkUGn25fARaZbZ/qUiaXQOs91h621IQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE84E1F000CF;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250080;
	bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mfXsunPBsGbf/SoWd1udSgbRvpKT7mXr/bRv025/+eS0CEmspg9r1GE4PNljckgji
	 DmD0nIAD0lIYll30QmFQ9V1NLfw7Mt6M7YyeUbzADj1j6XwPx75wuW7SOGauVRIkVZ
	 kpgn9wG3ogLS37UvTIeGAIZNESepYACZDS9mQ4HZFmf5CdNUJf8d6ggm39dxxViabH
	 nOVONYcN3eI0alDb1eMIRaPSIz7xjb1si8ldPgaig35ID6F8m5trY57842Y2fMYREc
	 RfCQUG3uDE7lRl2aL0p+ZWzB4KEOl6vDM5K2qDj9hVPS50e++AWzAy56ZVc05bXikM
	 WmBMk82c4U/pg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7A4704BB97;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:16 +0000
Subject: [PATCH 2/4] dt-bindings: mfd: apple,smc: Add t8122-smc compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-t8122-smc-dt-v1-2-898f3f5d6228@gmail.com>
References: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
In-Reply-To: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=946;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=tn5lVW1FjAYmZE60s+OKJciG68xs7HiP2AZnWSAa9v8=;
 b=6kSbfAXUY6Hx8zZUZFBAQvz8WcZ4q2RQ3ZdaVS8fU/1yMEP2+nQhCgjo7LEIvIovLZAWK4ETP
 ZkucVQe7/UuAhZKcrLPTm8hvQbpXqHfSupR5JZn7IEyJRMSlrgjusZK
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Janne Grunau <j@jannau.net>

Add the apple,t8122-smc compatible for the System Management Controller
on the Apple M3 (T8122) SoC, which is compatible with apple,t8103-smc.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 Documentation/devicetree/bindings/mfd/apple,smc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 34ce048619f5..d5d30c053845 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-smc
+          - enum:
+              - apple,t6020-smc
+              - apple,t8122-smc
           - const: apple,t8103-smc
       - items:
           - enum:

-- 
2.56.0



