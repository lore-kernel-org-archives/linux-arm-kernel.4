Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pCsRlv+n;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OhVT3rp3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sqL/30O5DBtUeIumToxEEeq2AZG6X60OwNuWqWfJfvo=; b=pCsRlv+nRAjyE6
	a0Gd/BJhirURLdjiL/U0u3yXnxp5iGcue3WPExrujH47zomLZxLzIrPQcW/MLCAUfe9uCnBy/A7qH
	7OIxsl/MTJxvWuHBFX+4kz/jrFRb7TEE26x8vTxnbfPNdMb4qG/NB4Gs2444Ey6X9MNEnoV/D2QY5
	ld/mhKJeRC3or7KzBqNTBMqeQwh2ZJpSO+U2Nj+KhEcQKAYvLlCjPZIPsf8/ueP6pOvN0fqgA3nuK
	CGIW5lKt2pQ6Iz7fe5oD5pfhqQoZ+HyX++fDhsj9ITfnS9ROfS82Ta1N0Gtv4ASi8A5tTJYzxr3L5
	uxdWF8R8RCt79eQ2PiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfsC-00000008y2J-1gW8;
	Wed, 18 Nov 2026 13:38:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfs3-00000008xtx-02XS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:38:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A72874E41627;
	Wed, 18 Nov 2026 13:38:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70B045FE9B;
	Wed, 18 Nov 2026 13:38:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F62011BC2087;
	Wed, 18 Nov 2026 14:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sqL/30O5DBtUeIumToxEEeq2AZG6X60OwNuWqWfJfvo=;
	b=OhVT3rp3bR9RrA1m1msfBIIjRp4EcjwzlBYz04jm+g++IKrsQyVG82c2Oi3cK4WDIMK9Vg
	IZhNleRlyOvJdaP85LASBkALSO5LsqCl1p1o8sXyDRbxVB6yeqw9p5CsEgUmomxkXBBqB/
	S6wO2Fqr3Oi4W1wn9ekXEQ4QVQWPvcST0yjheoDFqB1Se+jlHwJ2QkfACVyxVttLC4gD3E
	vWWtYg7f4T0fyb8BdznRZOJRk4/P5PCjHIAGAsS0CimILT3BD4aXLz5djmYzGZ3l3YKuQa
	naCyUBOIUUq1uPO4fnrgl8+Umw9of434zWLZpsurASE1LJ97AzsLZl1AA3MGcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:17 +0100
Subject: [PATCH v11 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-10-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_053843_237306_F3EDBFF7 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

I have the platform, I currently use it for my developpements and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintaince of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..4dd185002fec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19982,6 +19982,14 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON MA35D1 CLOCK CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+F:	drivers/clk/nuvoton/clk-ma35d1*
+F:	include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported

-- 
2.56.0


