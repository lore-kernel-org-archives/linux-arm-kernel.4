Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D4DOjY81;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aVxNoddu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H5SnWUnro2qExgQkV3dbhQ6vKq6c42ybHaKDpPYlOnA=; b=D4DOjY81qFKTZWx3kHKEL4sE0h
	u51FuaG24eLlmnUhD4aaEwAqRyQTCcTprcftIkfAQE+UAWnZHfc0klYpWnmY5/Ji8gXi+lkYsJv0z
	5uejpzr0P5ojzH+C/IPVEo8M3KhOCddp1C7OhWJj5E4+XzucPXpL4nRi0nd3KlJmiwPV4Ysdh5dqd
	EwP7/QVojyqgt+8ODvPbyLjZQE1T3hM8h5Qzc23j7yALJW/sOZJmKlr//Up6Bpow4eDtsHJPwvHAJ
	+U+xL26hrx3Aee4GK6nLU9mzkaeD7yx5AGofMIv1cuDkMl5EVMsVUscdZ9XhA+d+77jhcYVgn8U4/
	DrdxakZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTY6-00000003T6Q-1wpq;
	Mon, 23 Nov 2026 12:53:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTXj-00000003Sxl-24de
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:53:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 951B8C69149;
	Mon, 23 Nov 2026 12:53:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95063601E1;
	Mon, 23 Nov 2026 12:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D106E11E69214;
	Mon, 23 Nov 2026 13:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438388; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=H5SnWUnro2qExgQkV3dbhQ6vKq6c42ybHaKDpPYlOnA=;
	b=aVxNoddu6PNe6qdzMWbnd+11xDh0/XPDGUyqgkqoANfUaLK42ry/x057eaMl84uBeXXuPS
	GAvLLJpqZmSYB9mI9FHMI63neArCEHNlEhdM5T1F3pAphTyNmTlK/3IDbDdsQgEGexTYRn
	On7LNfSyf4THD/ii1GKvXXLiQy1sn4Nd24tm4Yc8w9v+2gNzM2uXXIQcbV5AClziDsNisA
	s8ChpuDIJ8zO0tAX6i61k1eHj38Dfz85xKhke2RWyHvyMQndOzoU0flOpWGW7tOrkzPpeS
	AXmyah/EBp0M3tMYcAuS/5X67igmDg+/XH6e+PoGzaV2wUR3BPkIvmYZKIOwig==
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
Subject: [PATCH v4 0/2] mailbox: Add Marvell MHU driver
Date: Mon, 23 Nov 2026 13:52:55 +0100
Message-ID: <20261123125257.111219-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045311_697771_04A97FAD 
X-CRM114-Status: GOOD (  15.49  )
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

This is the v4 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

The v4 fixes building on some archs that don't define ioread64 /
iowrite64.

Sorry for the rapid-fire. If this v4 doesn't pass Sashiko's review I'll
wait a few days before sending a v5.

Changes in v4:

[2/2]:
 - Use readq / writeq instead of ioread64 / iowrite64, which aren't
   available on every arch.

Changes in v3:

[2/2]:
 - Request an interrupt vector of exactly 3 interrupts
 - Pass IRQF_NO_AUTOEN to devm_request_irq()
 - Invert success condition of mrvl_mhu_last_tx_done()

Changes in v2:

[1/2]:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example

[2/2]:
 - Add Kconfig dependency on PCI
 - Order includes properly
 - Remove duplicated macros
 - Pass a pointer to the "mhu" variable to mrvl_mhu_setup_irq(), instead
   of getting it from drvdata. Then we don't even need to set drvdata.
 - Use devm functions unconditionally. This fixes an issue where
   pci_free_irq_vectors() was called while IRQs were still in place.
   It also allows to drop mrvl_mhu_remove().
 - Use pcim_iomap_region() instead of pcim_request_region() +
   pcim_iomap().
 - Enable IRQ in .startup(), disable it in .shutdown().
 - ACK the IRQ after calling mbox_chan_received_data()
 - Fix register used for polling TX done
 - Clean up macros

Cheers,
-Paul

George Cherian (2):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver

 .../bindings/mailbox/marvell,mhu.yaml         |  61 +++++
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 239 ++++++++++++++++++
 5 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3


