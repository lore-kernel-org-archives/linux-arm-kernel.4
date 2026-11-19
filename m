Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ADC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Na71iy5F;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Gx0lEc2l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y9v/n1TtDJMFIn4AbhJlfP99z558ytNnhpNIpO3m6Y8=; b=Na71iy5FZnJsK2poEfhF2Og/o2
	fJxLxx84cY53869ce1raT2o+u4L0ld/QnOhmNVaQ1cgJSI8JGH9wW60wUhPYq6QjVR2tkA8lHCfuP
	chobh+x3rqQ+j4Y51RbTkEAW511I2bMqGUMSrIIBc5HO3Usp1qGklpV0FKBE8TJhH/NNmB0bpo2eg
	FLHJcFhctFLqeF8Gf4K5br8eq7uJwE278ORUZu6Xzg2dTBx9v2usZ+5QLqz43lJVzr1mvleZbbfgF
	fCRVeeJIlzX6OjdAZ+UneB+Xo3mzlir/cw+K0LsYXTvKsVA9djaQHLKfcbGUvVLTP+5CSDeeUKfwc
	SU6pV2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2eo-0000000C9Ff-3mKl;
	Thu, 19 Nov 2026 13:58:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2ef-0000000C9A7-2Vi1;
	Thu, 19 Nov 2026 13:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=Y9v/n1TtDJMFIn4AbhJlfP99z558ytNnhpNIpO3m6Y8=; b=Gx0lEc2lz0wacWK7TpmKVJaegg
	zH4VH0zShbufg7rk6wCQgDrxfYfo2vWe2UjrHWd6/G7Pbmc0nX5WMNKNLL2ywpRtpMgSQWc/OX3oH
	LyFOlT4QOtbEKQvIOhtP1MwIQbJmRRXvOy6S/UvhlpcTEFDEl8qgghsO/P+t8xCFzo6yuGiUaQ0rv
	Z9z7G1eFFsQfST4/gbA9J0hVmA1idLtca3JFFa0JeTiy8jbmpvm1s0vno8RE8SNB/ci92FjljIM69
	NQCc2kWXhfrE7QlE0hHOr8/d+2jzE0h/K4DymRigf4o7t+6OW3W+ZS+0eTckqtdXAda3PJoRj6SbX
	1E0Ez+vA==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/6] spi: Implement a atomic transfer as a last resort
Date: Thu, 19 Nov 2026 14:58:02 +0100
Message-ID: <20261119135808.2377849-1-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055826_003341_8F339B8A 
X-CRM114-Status: GOOD (  22.11  )
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


===== Testing =====
Adding the below diff allows the atomic transfer to also work as main
transfer function for testing purposes. As SPI's ->transfer() call
already lives inside a spinlock_irqsafe context, this allows to find
any sleeping elements easily.

@@ -953,6 +953,9 @@
 
        /* Only register atomic transfer in host-mode */
        if (!target_mode) {
+               pm_runtime_resume_and_get(rs->dev);
+               ctlr->transfer = rockchip_spi_transfer_atomic;
+
                ctlr->transfer_atomic = rockchip_spi_transfer_atomic;
 
                ret = devm_register_sys_off_handler(&pdev->dev,

I've also changed the chip-select of my board to use the gpio path, and
no sleeping parts were reported anymore after allowing both the
spi_exec_delay and gpio chipselect to handle both variants.


===== New =====
changes in v4:
- drop the pm-runtime-get patch, before I dig myself deeper
  into an unrelated thing :-)

changes in v3:
- core: allow gpio chipselects to be used in atomic contexts
- core: split in-atomic check, a generic one for gpio-cs and delay
  handling, and specific one for limiting sync calls to power-off events
- rockchip: fail gracefully when not runtime resume (Sebastian Reichel)

changes in v2:
address review comments from Mark Brown
- core: preserve old behaviour for drivers not declaring an atomic
  transfer function
- core: don't use message optimization - safer, but still validate the
  message to get bits_per_word defaults etc
- core: make spi_delay_exec usable from atomic contexts
- rockchip: only register atomic transfer in host-mode
- rockchip: provide a wait_for_idle_atomic function, to
  not require (non-working) jiffies for timeout
- rockchip: register additional restart handler to enable runtime pm
  before reboots too
- rockchip: drop runtime-pm from atomic transfer - would sleep anyway
- rockchip: don't prevent power_off, if runtime-resume fails
- rockchip: use core spi's spi_set_cs to also handle gpio-cs


[0] https://lore.kernel.org/lkml/20240730180903.81688-1-sebastian.reichel@collabora.com/
[1] https://lore.kernel.org/all/20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com/


Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: quentin.schulz@cherry.de
Cc: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>

Heiko Stuebner (6):
  spi: Allow spi_toggle_csgpiod() to get called from atomic contexts
  spi: Allow spi_delay_exec() to be used from atomic contexts
  spi: Export spi_set_cs() function
  spi: Add infrastructure for atomic sync transfers
  spi: rockchip: Fix runtime resume error handling
  spi: rockchip: Add an atomic transfer function

 drivers/spi/spi-rockchip.c | 125 ++++++++++++++++++++++++++++++++++++-
 drivers/spi/spi.c          |  90 +++++++++++++++++++++++---
 include/linux/spi/spi.h    |  13 ++++
 3 files changed, 217 insertions(+), 11 deletions(-)

-- 
2.53.0


