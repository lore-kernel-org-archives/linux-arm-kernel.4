Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8C60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DN+Qf/Wm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVY9ZptP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dno6YdXon0jNsrWO52jr41oaAToDX2QCmdvC+fBV8no=; b=DN+Qf/Wm98HwwTwZe13Fw+FX+w
	KAMenjc+RBLZTDGF/aFO4eqlT5zvxfmUqYV2MDyPkAQ7PUD+ez5mzSP6rH3k4bOJ2xe9oX0PfVKFu
	blkNuVi9a394tvZF7EvVKJaNKD7JVFrU7BRNoqrBpg01tlQT6/qoZIA9+iBEfqXNuNBhuhJs+o4m3
	MwDCCyQcLKhUwa6yAngeyCx8144JqfigYPI2AHKicx1PDbkzNZv7UCwq/cn+uQJTYKJDIebskcExW
	VjWgmi7OefFqRAOf2KeSbRu6pQ1rdq4b+j6FAAHwQj42tiydrT2MYf+xvFPXUUWAIRdV0u53MW347
	txMHOo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxa-0000000FYrh-1Ziv;
	Fri, 27 Nov 2026 10:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxV-0000000FYpt-1Ud0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7C37626FE;
	Fri, 27 Nov 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774416;
	b=MUQ9Ry+YmbpO0Wh29g67/3ZBp2aphRPFBZ3UfmBL+NiHixdEITXKU44an6Z16AmbNq5h
	 WNhXCB7emoxH5I8G8rtNfJM2WPrkstUlR1sVAOIjPtKl630AFSqxrJDHIOUpevT0agd+l
	 uPwfAWr81hOdYOzQM9VaNASnVHhE53yTxM46dHGHawHImG6g74GB5ce5FT/1J8y7cdjwA
	 JJR5eA6A+Sg3cWCy5bnV5zBHB2z28ZHqe25nTbDiaAN2+Evnf7HdTgEFV1NSNNOYv5Jli
	 1SURm3ff8PxOP2YIQpENGbn3ODkqb9OuxfoOlSvqE+a0hpZZ7Kihb7N7hfwb2T1JL8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Dno6YdXon0jNsrWO52jr41oaAToDX2QCmdvC+fBV8no=;
	b=zyDo7pNehUFF2hCQR/plwLM+UaFAXe0ZQ9Vgw76odO+QYtBzpH/6JibtmocWgt4/CbI+
	 x9iBJXfgxUIaVs7iA9R6fE3ulEolvJAjrAwwvKai6aa9h/5GdoGnG23Fg78qw8cSc7XiG
	 zm9C+C9CnrF1e24EDDmE19Zk/7eqOIOHK88fU6AmzhA6qoCPC/QY7NAyx7RNeMk9bckEG
	 yVbgXhmq64JQqCUlUFv/uc8zhOkK1xUS7m2Fr5G53jUAYuvSBQ0ms2F9rBBYXkyJUOWmU
	 +OUxY4DIhkBXfLmuIdppptpF7uLgZwEYePAM4qa3AtdzPi2dLB4xVkdmeyabOkqhLlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FFF21F0089F;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774416;
	bh=Dno6YdXon0jNsrWO52jr41oaAToDX2QCmdvC+fBV8no=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BVY9ZptPB3a+M7FPJV9EnJDGqdeVid0TCCvCfovAYoNXb10d9SFoNugdE+RGShyKy
	 jUYWiwbzobxoxoxdxHlfnsgVfctXeiFUtpRxlDywSj6m2EmhpPjKVVkLboP83k4TKv
	 bSVSbWHkDuxvRfsc999qnagwSCC+b3uEtRiD7rulRBS2irr+zyMc7rmMEvso7wqfdO
	 hMNBsTGTFcIxL5g1qFK8WWvreSSkqjzR36jXg05M7e1NnS9KZS1CRpaYI8W0Qf9fgG
	 bufl9XfD1dv3gUJMXjD2mLunIXW9DOPyQyuw0H+yvJM+LrtTh8EFHgzlY6AGzOfF4i
	 9nMYxBbeQcb3Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E3DDE4B6F3;
	Fri, 27 Nov 2026 10:13:21 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:13:03 +0900
Subject: [PATCH RFC v3 02/13] dt-bindings: arm: add SiRF AT550 and Yupiteru
 YPL514si
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-at550-rfc-v1-v3-2-f2221008912b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=1613;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=oTWW7C8LNvrBLMu+SxYnhZaZqTkEn0NaUocQIPGH7ho=;
 b=+iEGAm8OSpD4adNu0u+4u7L4gYDxWwQvrQGCUGtN3+4HqPd2SfH9wuhHTrvgKQKpxv1Xzv/f2
 xlXPbuu42b1CQjWn5wHQ6ywKICKrUTmYqXmISuPQ1FBK2rO1kQNpwOL
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

Add the Devicetree binding schema for the SiRF AT550 SoC and the
Yupiteru YPL514si board, and create the SIRF AT550 PLATFORM MAINTAINERS
entry.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 .../devicetree/bindings/arm/sirf,at550.yaml        | 22 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sirf,at550.yaml b/Documentation/devicetree/bindings/arm/sirf,at550.yaml
new file mode 100644
index 000000000..0234324e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sirf,at550.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/sirf,at550.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiRF AT550 platforms
+
+maintainers:
+  - Yuugo Yoneda <yogo.0917.sabu@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: yupiteru,ypl514si
+      - const: sirf,at550
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d73899016..a825b3bae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25847,6 +25847,11 @@ F:	drivers/gpio/gpio-siox.c
 F:	drivers/siox/*
 F:	include/trace/events/siox.h
 
+SIRF AT550 PLATFORM
+M:	Yuugo Yoneda <yogo.0917.sabu@gmail.com>
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/arm/sirf,at550.yaml
+
 SIS 190 ETHERNET DRIVER
 M:	Francois Romieu <romieu@fr.zoreil.com>
 L:	netdev@vger.kernel.org

-- 
2.56.1



