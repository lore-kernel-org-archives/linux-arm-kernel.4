Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490A606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DyUu1u5N;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbPn31L4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9RDnkosvS/VG9gv5TnH9dYBxLUR1ZIHWYvcSLOH8qdQ=; b=DyUu1u5Nu7c98sOOon4I/jXfoV
	Db9hYC9gbyXb0EyFpWw6ubioJdutN6DGBEaeHMpcbHAdldQ6aJRUe8PlSL9hdIE00jxn500O44kJH
	UOKz1anXjdzxWxLVxnlnJ6dQQfQgoTIE4JZgl6YGqpiDUft7MNDNuVo/8MyJThc8e/09g32/x+hpV
	rgzeZmTRevmQMnWtA7UIpqtDBXh+qdw+C2qrnn3dcsueXy0EBHl75K0mUsYj0G9WZe6ULEhDeL2jw
	iTlwSp56ilkZ0/SdTdfFj2U6q8mesN06cVrwdUqdiBgmBhiz9jxdfz8gKGKCY6B6uZDp3RVQJlTVr
	emFXRGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxV-0000000Gq3s-2S8l;
	Fri, 27 Nov 2026 15:33:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvj-0000000GpCD-3KzB;
	Fri, 27 Nov 2026 15:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 777BF405E1;
	Fri, 27 Nov 2026 15:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637C51F00932;
	Fri, 27 Nov 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793527;
	bh=9RDnkosvS/VG9gv5TnH9dYBxLUR1ZIHWYvcSLOH8qdQ=;
	h=From:To:Cc:Subject:Date;
	b=jbPn31L4uj8I28oPIA8sQRMmPiqajwLaP4uxWM9+lluWhNjTJefqsB0RQtnQ9lJAP
	 43shSSbjY4X043opZEKvQr4GVOBCsgSdpfMXUP8RWWovxvPR+Sei3ffXq7WJnOaTBu
	 GwgIBNW/P0KQ7l64X8HfIe9vBl+TeBjk+WM5ac1bMDnA0Mi1lE9awK/KqDmr7/E9uL
	 EoGhfFge4zrCLH7WchAKtG15UJelE5Tgx8LMiwofINFJyfiHo+7K+bketlhm70NuJe
	 yzlw3rtJG8kw65nmL09vHGyI5alA9VzRPq7uF0d9CinRzcS7Dr09lbXKZhLY9ufaGA
	 iZoJ89cEq4ECg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Anton Vorontsov <avorontsov@ru.mvista.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Boot <bootc@bootc.net>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Dhruva Gole <d-gole@ti.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Foon Tan <lftan@altera.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Gabor Juhos <juhosg@openwrt.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Graham Moore <grmoore@opensource.altera.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	Han Xu <han.xu@nxp.com>,
	imx@lists.linux.dev,
	Jayshri Pawar <jpawar@cadence.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Johannes Thumshirn <jth@kernel.org>,
	Konrad Kociolek <konrad@cadence.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Murugan R <vadivel.muruganx.ramuthevar@intel.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Suresh Gupta <suresh.gupta@nxp.com>,
	Tomoya MORINAGA <tomoya.rohm@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Witold Sadowski <wsadowski@marvell.com>,
	Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v2 00/10] spi: Fix DMA, bounds, clock, and chip-select bugs
Date: Fri, 27 Nov 2026 15:31:03 +0000
Message-ID: <20261127153158.2969573-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

These issues were reported by Sashiko.

This v2 series addresses Theo Lebrun's review feedback on
cadence-quadspi (patch 06) and rebases onto spi/for-next.

v1 => v2:
 - Rebase onto spi/for-next.
 - Reject num-cs values exceeding CQSPI_MAX_CHIPSELECT in cqspi_of_get_pdata(), store cs as u32, simplify the commit message, and drop the stable tag in patch 06, per Theo Lebrun's review.

Cc: "Théo Lebrun" <theo.lebrun@bootlin.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Chris Boot <bootc@bootc.net>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Dhruva Gole <d-gole@ti.com>
Cc: Felix Gu <ustc.gu@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Foon Tan <lftan@altera.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Gabor Juhos <juhosg@openwrt.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Graham Moore <grmoore@opensource.altera.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Cc: Jayshri Pawar <jpawar@cadence.com>
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Johannes Thumshirn <jth@kernel.org>
Cc: Konrad Kociolek <konrad@cadence.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Murugan R <vadivel.muruganx.ramuthevar@intel.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Parshuram Thombare <pthombar@cadence.com>
Cc: Pratyush Yadav <p.yadav@ti.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Suresh Gupta <suresh.gupta@nxp.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Witold Sadowski <wsadowski@marvell.com>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Lee Jones (10):
  spi: fsl-cpm: Map the zero page's address, not its struct page
  spi: bcm2835: Store native chip-select GPIO descriptor per device
  spi: ch341: Limit transfers to the hardware packet size
  spi: sprd-adi: Do not copy uninitialised data to rx_buf on read
    failure
  spi: topcliff-pch: Advance tx_buf between DMA chunks
  spi: cadence-quadspi: Validate num-cs against CQSPI_MAX_CHIPSELECT
  spi: cadence-xspi: Zero the tail word in m_iowriteq()
  spi: fsl-qspi: Propagate clock errors from fsl_qspi_select_mem()
  spi: cadence-xspi: Advance tx pointer between Marvell b0 chunks
  spi: cadence-xspi: Skip tail read for qword-aligned Marvell b0
    receives

 drivers/spi/spi-bcm2835.c         | 18 +++++++++---------
 drivers/spi/spi-cadence-quadspi.c | 12 +++++++++---
 drivers/spi/spi-cadence-xspi.c    |  8 ++++++--
 drivers/spi/spi-ch341.c           |  6 ++++++
 drivers/spi/spi-fsl-cpm.c         |  3 ++-
 drivers/spi/spi-fsl-qspi.c        | 26 +++++++++++++++++---------
 drivers/spi/spi-sprd-adi.c        |  3 ++-
 drivers/spi/spi-topcliff-pch.c    |  5 +++++
 8 files changed, 56 insertions(+), 25 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


