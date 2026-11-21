Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNMLcaiC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtKelhFb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1yuakmTQTH2nDMkgihJWUJR+XjzHNUnODXcOI9ROkNg=; b=yNMLcaiCtubdfJ4gipcAQ6xhpn
	4RkYW2hP5XaW3+InpM7/FyJh+TE9DKpd1hsHX19rRdRUfOU1vD2dKJ2SH6TPMxMQ9bWqFlbyNk+cE
	yjqa19WjFYP/nfIBKZApZHJfMoweKOh1oTFdIBIfqVlXPNg/iASl1guPk8CGTrctSSYfN1ueZXIOV
	+AAEImVDSErK2lG1TNsGpDJCKVB72s6Stb2jrR5i96+09Xupi8av8gNGFhTkn5z2XubcEN/OiS1xq
	gmbT2SMnrT2NOKT40BGnrFLd9ndv/0aF13QPIcIDC/hs9OYcoyue5SE+HaJ1yPgcEEFUwJFZhJnUf
	0n1d8ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRO-0000000HCUu-00wt;
	Sat, 21 Nov 2026 12:43:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkR0-0000000HCKq-3jy8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5802860EE8;
	Sat, 21 Nov 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795264994;
	b=syC4y7fC3UMUnV3qLtg/1PVeDGDPN6Ghj8vIrSKL8MeYtQtZarznEuwbIitn3Dn4u5ng
	 b+SWR8okkANr29fK07aTPYZfydp/vm2k2HUlOnunXzMWG6F8ccIztanz/90goMReK3XZb
	 1bkMQZU+iCqMfuM0wha6KEe1qsYU0LQEDHuBC4Ekj43iw3gbYEfM46fiqBuLJHgl23/8L
	 3DupiKG3L9oF9WZ0IesHqjBtd/yluzD4fCnXX7wIO+BjnNSn1mdMsnPAmmz2adnj/DY7f
	 98i+6DOgu4M0Cyyzt616+23PKPz45/V7YuVPHvmStA/mhQr1MXQZy9XqX/kLD9gPUEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795264994;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1yuakmTQTH2nDMkgihJWUJR+XjzHNUnODXcOI9ROkNg=;
	b=Zm+gX4IOIieiGo4rxdBCu4G7gk1YjbA7JKPWTyogwMBIFmpIygnMQlizgTNqQogKnx79
	 KOqop9+UR95NbIsEXeLUGmX+xFvvh9b0LhHcwXjFOqUCZa2OZAB2WPmLRvUVgRzsHL5fw
	 2gpEOA2+MtN2E7eM1MOenvKgdb0/wfwMDkuZ9NFoW8PcbcbSp/iSL8ROMeTg03Fqiy8DT
	 rpDQTDiw0AabMMPXcv7X/4eFq+tCoboQQqzCNr7v7D7t4oFN2ayKksAjeE5DrlpBm4DhO
	 6IaANothrPwA15DARLXUktPzs2HN3cnYLSezF0wubIj1tosVX7E0xVbK9QhjQcF8tUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BDC61F000C0;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264994;
	bh=1yuakmTQTH2nDMkgihJWUJR+XjzHNUnODXcOI9ROkNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QtKelhFbc/SDLCCr/emMuEHSq1hudODoU9eYLLumjbE1xbNm4jNO5lLM7zvWx5MPp
	 xXTTD+xj9jHq24BqaagF3SUiAQeuQa8VKEpIiIoBZBktmrH4A8Bq8JPijzUHTwK/xX
	 /sVQNa5bKBEdYegY0VWulYCi0bpyiLA9tXHLsAWhKFmbymdZ+lcqoNQrGsot1T6mri
	 CKqnKOGa4A7GcVU2LbZV7ABOYGEST1IojSfv5R08QEWjnQFcw7Q9QkPFnCsXBnh1qa
	 1U82O6dqPi5E4hZCs6TTKHRYMjER/EpXIIzrvOyMRGH+XI9m1ZS3Xq2z/JBOqlzXzN
	 CWV0a43uPdAEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 004964BC28;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 21:43:11 +0900
Subject: [PATCH RFC v2 01/13] dt-bindings: vendor-prefixes: add Yupiteru
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-at550-rfc-v1-v2-1-b0309d0789b2@gmail.com>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
In-Reply-To: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795264991; l=853;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=iTb2YlDC2bx8pU62e20oqkil7g9/9I3ZNsd6Gavq2p8=;
 b=l1YtOmr9CaFokZU5dpeyq/EVoMqxnwB90l19866gxNAwwvsVxpoZM9f+hkdODTQxJVZV1+iyg
 POP1Rn6jT+MCi+07TxTe5oOi1aTSOsHRAL1ee9s2Ap7LzWBvyNfrOMh
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
2.56.0



