Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3153606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJ1Zxr54;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZCmnVXC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a8ettMTIMLv2Wh6ztg/2TP5SGbNIvkE4ulbl7gtN2Rk=; b=OJ1Zxr54hdqPev983QSB+2FlQB
	hw+af50y6E5tAm09uSaQjLjT9zr1fCTw6tVoF9Xya1BLX2KoWKCQ8czhoLn7Nmb9ymLQLLeuLNEL0
	TDxQAnPNEbvTouC1HuAWGxOxSbFpeZZkOAS9r/JFX3Z94P1DVvhbTOjLOB7Cy8yAukLx2zJ06NiQD
	Z3/OpKnotC2awG3ceAGjG9y/ohmrjD3c2SymT4ZGHuxJ907MDALjQvjYKjbe67C7Fsw6O8O0rIj0K
	X/kbEfHNvLp6jZoXbhozkpvVQ69Rf5mM8lMmN4CKZib7CJh63Hp4XXHzvbM+x7W82SMr4RMkpf7+W
	nEVO5OKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxL-000000001Oy-2FGB;
	Sun, 15 Nov 2026 14:11:43 +0000
Received: from out-88.mta1.migadu.com ([95.215.58.88] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxI-000000001Od-049C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:11:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aPxa4y3+ppxmpAAuJ70W++p4hkmg2eJERKnjs9y4jWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751897; v=1; x=1795356697;
 b=NZCmnVXC7qxU1dw6OfZEl8mzxNY+bk1+Pzf9KIvRNb3qrU81NHXNTBwgl+SPUbXmO/H3k/JB
 AoR65PIvRjWMjH/YS84ZSTG7n7dYby+f4TN/sQDYpi+rHoXaoDBwInXpcj67GkEk8HrOP3vlqMN
 HV6X8opinCETepsMaLPSc0UI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4b04229f9dcdc18d;
	Sun, 15 Nov 2026 14:11:37 +0000
X-Mizu-Trace-ID: 4b04229f9dcdc18d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/2] irqchip/imx-mu-msi: Fix MSI dispatch and probe error
 handling
Date: Sun, 15 Nov 2026 22:11:24 +0800
Message-Id: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3czcCt3cUt3c4kxdi2QTUyPjNEuDJMNkJaCGgqLUtMwKsGHRsbW
 1AKHbSYNcAAAA
X-Change-ID: 20261115-imx-mu-msi-8c4523f90b1c
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061140_290893_5A7C239F 
X-CRM114-Status: UNSURE (   5.86  )
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

Two small patches to fix bugs in the i.MX MU MSI controller driver.

Patch 1: Fix MSI dispatch through the parent domain.
Patch 2: Fix PM domain teardown on probe errors.

More information could be found in commit message of each patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      irqchip/imx-mu-msi: Fix MSI dispatch through the parent domain
      irqchip/imx-mu-msi: Fix PM domain teardown on probe errors

 drivers/irqchip/irq-imx-mu-msi.c | 70 ++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 28 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-imx-mu-msi-8c4523f90b1c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


