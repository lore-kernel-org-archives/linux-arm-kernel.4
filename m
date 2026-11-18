Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0360A2603
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMPxloFg;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=; b=AMPxloFgpR5Nkc
	MO+RpQrfcyDED97hhuuXpJmBc8vKt+sTTKj2BnlGtf06N8tqHI0nyphOmxB5gmxKRQt6ShRb4drhK
	rMnqslSiZg6zi521EK7ScgYrwfMLZdbTdMxsRUoyG5zUm+IOO7sjzZWVSxi7W85fgfsOtXrWoJy80
	+7rA35maWJFnmmOnP82yYZ2e0qfBPWNe9+kuHUzqBNL3abUFvngcTBPNf4d4z5dFUJr3ie9xjkBS0
	2KzlWZ+S4Dkym3bnVEWU68DZe9a12Ro4DFrYV4REyIx1NngCttQmeuO/dvJed8tbm8+apUD9m/z7b
	JOAkXGZriANtU4o3ozjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj6q-00000009gyI-2Bzo;
	Wed, 18 Nov 2026 17:06:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj6o-00000009gxM-0Cfr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:06:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E448C4F77B;
	Wed, 18 Nov 2026 17:06:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 557295FE9B;
	Wed, 18 Nov 2026 17:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14BB911BC29F4;
	Wed, 18 Nov 2026 18:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=HjowiW6d9cnuFS7xom0UpdyuXfkba5rHwRDOHDh9NqO4ULYxHW1hqPaXSewzQPfsci8KhT
	l8nLmYeZfZewI464Fh05UZBpnOEoZKC/Pvie6JUA6unQw3Zx20Ks1Ft42uQAwLqkKsp1oO
	nnYKQMuasEoDM/PHeA9P+iwbKLknSeLzcfYrz6sYrKzoxsAESdxvKMJ3oireTKUPo2Nm2a
	1fQ2j88ZmKycX4ORfCYpWt1AC1rVbjnZWESI5igQneLqtgNYV3WGAYLpgCyBLtK/Durfnf
	jhYIK7dD1F7CNxWfSvnCydSCfAw1XUMfm2tBAqNIHYvvuZ2zjcqi1csHRgL7pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:10 +0100
Subject: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090610_284889_D27A1558 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -2.1 (--)
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

The whole clock list is supposed to represent the clocks provided by the
main MA35D1 clock controller. Yet, the comment at the top is wrong by
definition: it lists both external and internal clocks, which does not
make sense. HXT and LXT are on-board oscillators which are now correctly
described as independent fixed clocks with their own DT node. The clock
controller is a consumer of these nodes and a provider of all the other
clocks listed in this file.

A look-up towards the HXT or LXT index through the clock controller is
always wrong, yet possible (even if totally useless) with legacy DT, but
should not be made with a recent DT describing HXT and LXT oscillators
as individual nodes, hence mark them both legacy.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 764d837d6162..ad0b281da45a 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -7,8 +7,10 @@
 #define __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H
 
 /* external and internal oscillator clocks */
+/* Legacy: HXT is not provided by the clock controller, do not look it up */
 #define HXT		0
 #define HXT_GATE	1
+/* Legacy: LXT is not provided by the clock controller, do not look it up */
 #define LXT		2
 #define LXT_GATE	3
 #define HIRC		4

-- 
2.56.0


