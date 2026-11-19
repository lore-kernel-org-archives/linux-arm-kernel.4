Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D02606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQ9XE3wc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUlTbof7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v3bo8ZcbgAObjcXddzvPQDs3qKip3UcYyi2IBIcsxXE=; b=gQ9XE3wc19Lz3RmJ16W+H7Qqgh
	Jj1dUl+9EfUKzuJjW20+I9vCwL62YWEqA3unXQAJ4PwjPE/Lq3X+d50OAbrUPh45eEY7iiJeu9KK2
	gknDifb4foLyhrDY5FuLorZw+fEe26GwaXTsv8E+vfzQmsXrnj2PlTO3PzkTmJxVY3EQ26vhkT9lE
	Wm+OlrlDhlX4q/kUmBXf4OZ0fyj50zpbVLj4s3U4s3dyDcJuLBNXD+2es1MzUoRPw0NoJEKxkb/rU
	5v64QxuzuFnEgI9dZaYk1i55fqU0+Guzo93kQ2l8v/bbt07M5QMp4No+/SeeM7tGVfMn9B4WOi4Yh
	AC+otLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyHf-0000000BN50-3mB6;
	Thu, 19 Nov 2026 09:18:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyHe-0000000BN4n-1yPm;
	Thu, 19 Nov 2026 09:18:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3E4E605F0;
	Thu, 19 Nov 2026 09:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19B51F000C5;
	Thu, 19 Nov 2026 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079899;
	bh=v3bo8ZcbgAObjcXddzvPQDs3qKip3UcYyi2IBIcsxXE=;
	h=From:To:Cc:Subject:Date;
	b=cUlTbof7TRhkdIj9zM4tAOPe0BxnlUOXyAgKKafiWTNT7F37OrMgblULvjHOKHi7B
	 7kJ68GQ0aMp8WMQbw4aC8lMNrvwUI6lA1C6kJcpAGHDKysiBnB5+FNjwJgiPrnjngT
	 cYH32bJQ6VPHjApvcg3HgSlzaIRhgMMEeHCf49Zvb0v3zOqVL6NSn2USYZo/llzCNe
	 uPV6dDgTc8I12wAuxTfy5qWgbfoaFD15SdhpYdz49kFnYyR6s/dTsaIp51i6PrqDSb
	 2oZ5uY6GET3M+5w2+rb74fN+2RO5sL5kV7Q5hSeu+5/2Gsawym3Srgm4tubLNwcwKF
	 u1CnU5Mu0dqKg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
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
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Tomoya MORINAGA <tomoya.rohm@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Weibin Liu <liuwb@xiaopeng.com>,
	Witold Sadowski <wsadowski@marvell.com>,
	Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH 00/10] spi: Fix data corruption, uninitialised data leaks and bounds checks
Date: Thu, 19 Nov 2026 09:17:12 +0000
Message-ID: <20261119091810.3440619-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

The series is based on spi/for-7.5, since patch 5 relies on the
following commit, which is not yet in Linus's tree:

  3515e312e096 ("spi: topcliff-pch: clamp DMA bpw_len by bytes not words")

Witold, patch 10 is derived from the TX-only accounting in the Marvell
b0 path, so confirmation that it matches the hardware's READ_DATA
behaviour would be appreciated.

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
Cc: "Théo Lebrun" <theo.lebrun@bootlin.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Weibin Liu <liuwb@xiaopeng.com>
Cc: Witold Sadowski <wsadowski@marvell.com>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Lee Jones (10):
  spi: fsl-cpm: Map the zero page's address, not its struct page
  spi: bcm2835: Store native chip-select GPIO descriptor per device
  spi: ch341: Limit transfers to the hardware packet size
  spi: sprd-adi: Do not copy uninitialised data to rx_buf on read
    failure
  spi: topcliff-pch: Advance tx_buf between DMA chunks
  spi: cadence-quadspi: Bound chip select against f_pdata array size
  spi: cadence-xspi: Zero the tail word in m_iowriteq()
  spi: fsl-qspi: Propagate clock errors from fsl_qspi_select_mem()
  spi: cadence-xspi: Advance tx pointer between Marvell b0 chunks
  spi: cadence-xspi: Skip tail read for qword-aligned Marvell b0
    receives

 drivers/spi/spi-bcm2835.c         | 18 +++++++++---------
 drivers/spi/spi-cadence-quadspi.c |  8 +++++---
 drivers/spi/spi-cadence-xspi.c    |  8 ++++++--
 drivers/spi/spi-ch341.c           |  6 ++++++
 drivers/spi/spi-fsl-cpm.c         |  3 ++-
 drivers/spi/spi-fsl-qspi.c        | 26 +++++++++++++++++---------
 drivers/spi/spi-sprd-adi.c        |  3 ++-
 drivers/spi/spi-topcliff-pch.c    |  5 +++++
 8 files changed, 52 insertions(+), 25 deletions(-)


base-commit: 9b2d7c8736a6fd27ceda93bd67529758c139e24f
-- 
2.56.1.708.g77570a6a1d-goog


