Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91BE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pDV7nUsB;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jRTSBGkB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UQa4GKXrA9X+wr7u/zsOdyF9bjrxFeMq7idC2deAia8=; b=pDV7nUsBFfcgcOrrK/jSObNQ5Q
	1vdJxLKcGjKEN3+fru/a9YWwV55CPqOtK9dR8G/0UrDrdmD5rxXQtn2hiCT515xjZ4SVTz6hhAX+/
	fLuccMEULlxX/8qTtHnyLmZ6F1yqAgCWIwqGSR0ZMFx+aaS8dsI3em1PRJ4y1kke/tuHb7OCzsvbQ
	x1H83S9QsRm/X61c5bOYjVCNyliu6SPcceXHrzPQl9ISsGz7zMN+ZtvBMW9JC8vCrWFPgsj7lYTCT
	vObxBKZQaoy7hqkikNFSQZ8F/5h2NAPhrtMd805A6Ll0goFxI9K1qdEUkWkZh7lGphdADtDDEl8Yp
	L7mfPuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOWH-0000000DNev-2ZzO;
	Fri, 06 Nov 2026 18:18:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOWE-0000000DNcz-3Bqe;
	Fri, 06 Nov 2026 18:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=UQa4GKXrA9X+wr7u/zsOdyF9bjrxFeMq7idC2deAia8=; b=jRTSBGkBNHrkqdFy+yA8aopz4F
	e1Rnt9GPp24aSyLnAYmdzF56oK0syYCaEO5zC9Tp0E8iAaAKgO2rurmQzx+ffo8CsFetrNhNNZB2b
	/D4zRarhpxgjcQf0TidPSrN0Wjsbim7c14wwvqCzNX8ZQqQy3uj6OG4+Xs9yobGjLvHX6OzB7xus0
	3aa/eAWlJr2cU85x+di3oNWrmAOsf2I61I+nVs5j4GZ/CeFg/ugmxUffg8/UR54gA0h96bTMVKFS2
	oYfir7sEh40zfJyLEL67FtuOILzkVYiOVTmV13nbHr4XUkwwwdUcwL5gyvGVbtt3J6i9XccbDuYkj
	pImTOMSg==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/2] spi: Implement a atomic transfer as a last resort
Date: Fri,  6 Nov 2026 19:18:21 +0100
Message-ID: <20261106181824.1361235-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_101830_888219_02758880 
X-CRM114-Status: GOOD (  15.58  )
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

SPI devices at times are used as PMICs including a power-controller
functionality that should turn off a system.

This happens in an atomic context very late during the shutdown, where
no interrupts are available anymore and conflicts with the asynchronous
nature of the SPI subsystem.


====== History ======
For the RK806 spi-connected PMIC this has already caused interesting
artifacts.

A first change, tried to "fix" the issue by using the
SYS_OFF_MODE_POWER_OFF_PREPARE step of poweroff. While this hides the
issue, on some devices this now turns the pmic off too early before
other important steps are done.

To mitigate that issue for "some" devices, a change [0] tried to use
different poweroff phases for i2c and spi devices, where Lee rightfully
said, that with this no proper solution would be done - and Lee was right,
as that issue now is open since 2024.

The newest change is a simple revert back the old way [1] because of
those issues caused on other devices, but that now breaks the SPI side
again and also did not take into account that long history.


====== Now =======
The I2C framework has an atomic transfer callback for exactly this late
stage transfers since
commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
and during the discussion it was suggested implementing something like
this for SPI too.


As this did not seem to have happened yet, I thought I'd try my luck.

Similar to I2C this is meant only for that latest stage so I stole the
gating from there too.

I assume I did not take some SPI specifics into account, but I guess
having some code to discuss is a starting point at least :-)



[0] https://lore.kernel.org/lkml/20240730180903.81688-1-sebastian.reichel@collabora.com/
[1] https://lore.kernel.org/all/20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com/


Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: quentin.schulz@cherry.de
Cc: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>


Heiko Stuebner (2):
  spi: Add infrastructure for atomic sync transfers
  spi: rockchip: add an atomic transfer function

 drivers/spi/spi-rockchip.c | 88 ++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi.c          | 66 ++++++++++++++++++++++++++--
 include/linux/spi/spi.h    | 11 +++++
 3 files changed, 161 insertions(+), 4 deletions(-)

-- 
2.47.3


