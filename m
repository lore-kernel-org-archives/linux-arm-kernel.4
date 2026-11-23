Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E29606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inUVyXXR;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qol4iXN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WISXIrRiv9xK2uZTaw1brlBZ+PHhofNzGu96gO9Nuj0=; b=inUVyXXRg6jptNEVgCPdsNz8nj
	gegvwDKVCu94dR+/5wgSZStgoYeeeRqAmUuHX57dIJKH9tY5aWdu3xfxoZbvARfZ91HV5M2Cwj220
	SJGq94dXQYkfl233E0vXKDa3cZ8OyyLS58N1nX9VArVbq044XDSHnO0mYoouBeJEuZAP+MEtHgHDH
	ViXE3GVC7S4WL/3rMNy/0HmWyYn/bl0QxjKU4vHNEHiwbQb3KrEh02gCC6kQKNLJkGlODoyEsF3wg
	U/tAGP96oIP3ICO533f9TQe1Imol+ORCFPfMNYQ50vBvKEWkVnUEWoapQBK0OTKXYYxD0FruCao+I
	nTqS1muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQcj-00000002o5K-1sKB;
	Mon, 23 Nov 2026 09:46:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQcf-00000002o2x-1rd9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:46:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6029F1A179B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BAD05FAEB;
	Mon, 23 Nov 2026 09:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA74811E68AB4;
	Mon, 23 Nov 2026 10:45:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795427154; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=WISXIrRiv9xK2uZTaw1brlBZ+PHhofNzGu96gO9Nuj0=;
	b=qol4iXN905k8bW/y/OwQVXTTJ3mcKwR/HL5e4FQKrpuk8A2ReNVy4Qk1zIwlLVfMylzKCg
	xYQjFnB7HUKBnmjYmS7tapG1vLfOc54ihljWinVzNDfugZFWxrUa7HbAjjUBraJmVrIAOn
	jZENEmqGB/QGE2HvatQZJAoV6/hd9UhzlC6CMMKq7DDrn9MWW62GbfpdmYr9Jc+5IAS5Sq
	TbBo2R6wCCV+VTnz6+qfGP0ViUGZZfArmyJIwmS0+wpJE+NwelcZsZ/2rUwsmEY4vcazFv
	qsVzY9qj9p88/FKlLP/qE9pF+sjUOjjeHEWAMnQsyW9MY+p/heTu+krC313seQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 0/2] mailbox: Add Marvell MHU driver
Date: Mon, 23 Nov 2026 10:45:40 +0100
Message-ID: <20261123094542.44101-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014605_645466_BAD27432 
X-CRM114-Status: GOOD (  11.67  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jassi,

This is the v3 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

This v3 fixes a few things that Sashiko complained about.

Changes in v3:

[2/2]:
 - Request an interrupt vector of exactly 3 interrupts
 - Pass IRQF_NO_AUTOEN to devm_request_irq()
 - Invert success condition of mrvl_mhu_last_tx_done()

Cheers,
-Paul

George Cherian (2):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver

 .../bindings/mailbox/marvell,mhu.yaml         |  61 +++++
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 238 ++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3


