Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t0PQZl7D;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ii0O5BgW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z7GZse95e9OsWMMR9FTF/D6iQnoJXWz8o3LKfdTm+tU=; b=t0PQZl7DlyY4Z5IksMC5qZ2AW0
	hy3wesWtNfnwBTmkAU0fdsq5p3BRWOx7ejgRrrL70xNc043J/OYTqFG5cZvIKe0JkjpjD+2KIAhiP
	yw5ZMQDVblQ0HGv3NCP+ndOiGTqhhUif1iWGPYUfNaeaW9m/BesKipqrHvlSNgUjzUHuoYtYeiZLd
	moyIq1FuA399w2e8RTBqxJj2/CbEirJkCxWnaYAUasJ8F+XbrtHQJA0fWMBjn3rwArbjBx/27u3Ql
	dZeoFPf7Q8TqlyLR99nXdpMjDoCMWMdEybF0gftYi+aeExrkFe3vlpCCo4RkkEZ6A+GOlRZ0sH+5d
	cBjwZuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMyU-0000000Epg4-15av;
	Fri, 20 Nov 2026 11:40:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMyR-0000000Epei-0BLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:40:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DDCBA1A1742;
	Fri, 20 Nov 2026 11:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA9536017D;
	Fri, 20 Nov 2026 11:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28D7A11BC0D5A;
	Fri, 20 Nov 2026 12:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795174806; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=z7GZse95e9OsWMMR9FTF/D6iQnoJXWz8o3LKfdTm+tU=;
	b=Ii0O5BgW3ORmBERcxum5rHlZoh99KBF/YCCtFeyC90YTIam82qxFnQMYqdBzYHsjRRtQ0b
	ceKkW1iqU/N/rtgs8+hkqhRNogEPa8nZ4YXmxaE1cQA5V6Zn06KjZIWb9J+BW93OnTkMa+
	5uYCb0QSVQRdi1W64qNZpNMhKfCxzhm4jIsP4sXU7O8sV8G23JV1k9cNU2YzX/d+vOXJBV
	J4Prvo7WtqZK3yGLYwOc4qyVGOnCLk9jbd5Y76Dpd/RpnwdWCQ8EpZOD5E7FjZ0kTD/v60
	rhGh+O0VRW0FZy5+tXA0u9a++pIsff0m1tztoXhAHY2AdSU89Csrh+2+OytrkA==
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
Subject: [PATCH v2 0/2] mailbox: Add Marvell MHU driver
Date: Fri, 20 Nov 2026 12:39:50 +0100
Message-ID: <20261120113952.168265-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_034011_248643_C768A472 
X-CRM114-Status: GOOD (  14.61  )
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

This is the v2 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

I dropped v1's last patch (that affected the SCMI driver) since SCMI
maintainers and Sashiko reported that I could replace it with a simple
DT property.

Changelog:

v2:

* [1/2]:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example

* [2/2]:
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


