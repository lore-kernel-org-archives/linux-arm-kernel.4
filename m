Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860660A2612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RnVd2bVx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvbxJEmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UwDf2Dx9TN53qcF3/Abn62i/4UVSHTAvMalmNjk43/U=; b=RnVd2bVxsFA8dUgc+4d7vkPP5C
	0NoGkmlRZNyY+hwt7wIRADCzk23DrntKVya+qwH3Fq32eyv2GG1yMV6O7x7w9isck5cGmQPrDDRCX
	chFeMg6Y/uDg+RFlaJNEqfTLuGrKai7DIVftLXb2fHeNa2im29h8HxyRVv9TYsLd8mXkBQBCrCFy6
	cbkv9WvU1usK0P4CElTqV6ALcmh6KZ3YU7UWPQaDFglolpUeGKtiVCHuU/SsT5ZtPV7QXVa2K0vpF
	zqCvWgcXGYjmlHpzf5V1c8T9Rpokh4cRxSsgWaG/1ZtOH15PvpUNe857+Yfvt1BJR6EvX7JDjsAmM
	J8Pmd7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxa-0000000FYsL-31an;
	Fri, 27 Nov 2026 10:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxZ-0000000FYr8-11uH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:13:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 993DE62746;
	Fri, 27 Nov 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774419;
	b=Wtrs93SdhwuYlrU6U+7OOHECU1LZlNgtRL/qDTQkU1r1ivw8B0+MNWAVfmHsNkKXxPC6
	 gsbl9jVAcdsjWPjPoZszc7U4k1TOkfPmWszpewHzDbR/hTB8QbchHYqDT9N5JD86xS+Es
	 5GQVlfXL9MTjh8XTdkK2GGKPJteJA79Re0CBFWRS5bHXIOSYMabg1//EcyRi7/vYSDfFS
	 4ZQajHQEtQ0r33PhH1yDMS0+TH8bQb1mcRY+UwiwHrO6fNXKTWQb9MtcYlR5yLXH9TEBD
	 MM4f2Cr2z3fmHBuwoSLtqTZUqpzsGwf8ztKeZhLyNie+7tv+d+u/uTZN1bJqkjLxLAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774419;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UwDf2Dx9TN53qcF3/Abn62i/4UVSHTAvMalmNjk43/U=;
	b=aD81IecyLIRQnreU278FPiDpIeNBDHSMqFTicnsN5xYRfS8evZo5hhA0YLH9rUIB+mjK
	 CLPYd8niWE6b4hyJMOBoK8Oa42UIkceYGm/iSgzUi70TYkb35GGHced2WMeJn1in9y/8N
	 PoSreBw/mibVWXda1BEoX4RVHnsy8nvGF+EWdKhS8o9rJzrSR1gSLdGE0ICg7eIQQ9cWu
	 0KvM/stBKjTGjvhYlcOt12w+sqeDNp1eGUbcGXD61HbIKK1ymqg6+Lt+nppp9jUR5wFxf
	 SQ0gvYQP8eG8nAGizLIrG6t5eqkO32g30/R77xW0426GAu3ORUllBJ/2KykZEJswKsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F7201F000C1;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774419;
	bh=UwDf2Dx9TN53qcF3/Abn62i/4UVSHTAvMalmNjk43/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GvbxJEmVL4/2jCQEPOA0aO989Tz9+GaIbwHV1yAEbQ5ljjKf3VB6DVUEDwG5fIugA
	 cmY7jALXNH8m+hYIHQuaG8xGzRAAjB1Ur4u73Hv5eb6ho9WfDPiUJEKB5mo9lSMHdQ
	 hqPnjcc1V+NYeQLW1fk204lEabmm+2ILm8sE5Ov4X+7cce8wvUNWOnNvujVQbdl5IG
	 lXL/HNxl3BUJDcLKWsgnk550dLd2fNuH3QqRly3xaEme7JZxNYiw+01K9zC2KUXiz3
	 nr0rQqhFur5ifYTFgjxCGGnI6e/ARWcLNsFnAFEOJ4AIf5gbPO6J3vw1aUiPTApaf/
	 0DbByBP6BzEzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C33FA4B6DD;
	Fri, 27 Nov 2026 10:13:21 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:13:02 +0900
Subject: [PATCH RFC v3 01/13] dt-bindings: vendor-prefixes: add Yupiteru
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-at550-rfc-v1-v3-1-f2221008912b@gmail.com>
References: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
In-Reply-To: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev, 
 Yuugo Yoneda <yogo.0917.sabu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=853;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=65TJRYtIa1YUzw6sl3ctlqKpkKfiSeKHU3m69S2IQzk=;
 b=CdAoOg+4gZ2zZJTbl/tX+mdOwCtR4lvywQNU4aTsXTzfrM2X28LKKgZRByuO/++zH1cBhk5oR
 vJAAaHXPKOfDwIN4+6Hq0mlsvXXQd+m8hEu0wVQA7QkisjVaZWgTaWy
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
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
Reply-To: yogo.0917.sabu@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>

Add the yupiteru vendor prefix for Yupiteru Corporation navigation
devices.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f9..a8927fea3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1985,6 +1985,8 @@ patternProperties:
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":
     description: Y Soft Corporation a.s.
+  "^yupiteru,.*":
+    description: Yupiteru
   "^yuridenki,.*":
     description: Yuridenki-Shokai Co. Ltd.
   "^yuzukihd,.*":

-- 
2.56.1



