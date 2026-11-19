Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6119606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ajdk053+;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ODs/7JNY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p902X5yNspl97EY5Sspgrrg88N0a/kjWZPhxygshMiM=; b=Ajdk053+HrLOGyjW1HhQnD6UJX
	lD3ywwJCHKyZKNPn7IrHX6sRg7Fw+kC1DPgKLX94VRwHGbYkX5zhppmVeAcwgiOqnSnRIYBOOvES6
	hGvB0BDKRFJMLgy4HDikFmTS11CFLGqdLlCzuH04llk+jQApX4xzrJxSyh9di0BLqxuCAXREoaaF+
	RxOvX7lAc+8jhJemr9EDhUz3uErmggSfqwXJaRkz09O/Y4Pph/LlprT3Yt1Rlh/a24QtPJbaaHxbP
	lhEcyknrSoCKRJoqGnFXqcGTnBixH38ubg25VPdhdogC978M3JoRvJvGddN+HUYP+LG1Kq1UckJ+9
	Ew5oJRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45R-0000000CSR3-0cJ9;
	Thu, 19 Nov 2026 15:30:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45M-0000000CSN1-1RzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:30:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AA09C4CBEF;
	Thu, 19 Nov 2026 15:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F42B60237;
	Thu, 19 Nov 2026 15:29:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3A6111BC0B70;
	Thu, 19 Nov 2026 16:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102192; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=p902X5yNspl97EY5Sspgrrg88N0a/kjWZPhxygshMiM=;
	b=ODs/7JNY5OTyVGpPU2fhvXMp5h62UvCBHsIH2Wowd+wJppvzO2usLcPB0vclK2lW4jz9W3
	Px8gv3tee90BtC7QajP/k4uR/afAW+FCdTzu3jyyRVgnJ42XqWVdYKeCaQKDtV9sq8eiK/
	3n5NaStsQsUDvfIFJtR2gs59jmbljUmWessCntDWhSDzU7+4VT6Vob/Zre4qpdq11ofemu
	LVKbMwUpNAAVnHVAcsq3NsgmVURDBABsiM9yxLy2PiStLXxnmab2O3co8cyQEp6zwkXgeT
	mGaXQoRC071q0Hjy23mnWJZgxrLRJ7hwCY02QeeyZLOpiTRi5s7lMh6CpkMm9A==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 0/3] mailbox: Add Marvell MHU driver
Date: Thu, 19 Nov 2026 16:29:41 +0100
Message-ID: <20261119152944.276763-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073004_531678_77776F78 
X-CRM114-Status: GOOD (  12.85  )
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

This patchset adds support for the mailbox found in the OcteonTX and
OcteonTX2 based SoCs, which is used for SCMI communication.

This is technically a v5, where the v4 was sent in 2023 [1].
Given that years have passed, and that the original authors left Marvell
AFAIK, I figured out it was just better to restart at v1.

The last patch applies to the SCMI driver, it does not have a direct
dependency on the other two and can go through the ARM tree, if you or
the ARM-SCMI maintainers prefer so.

Cheers,
-Paul

[1]: https://lore.kernel.org/all/4397b39c-084b-954b-956a-5168a3c8958c@linaro.org/T/

George Cherian (3):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver
  scmi: driver: Increase timeout for rx response

 .../bindings/mailbox/marvell,mhu.yaml         |  60 ++++
 MAINTAINERS                                   |   7 +
 .../firmware/arm_scmi/transports/mailbox.c    |   2 +-
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 267 ++++++++++++++++++
 6 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3


