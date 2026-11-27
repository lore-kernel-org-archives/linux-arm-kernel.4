Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZMAExVv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dad6wqal
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RCjPO13Jg/1eI9KOpBhWyGzhdF76JSGpj17iCwvBrDY=; b=MZMAExVvqIkLVnXPk3tojUpmWL
	ir3GgRxIGEPCBdHr8eqMXHi/GCSqKEAn27iApO9yvAL5iKyWZicYru1rrIbhXDXPXu0D8mDopo07Q
	GV23lGAu/ThYNeeJOnm8mEaZGn/SnbvF0FDJggZ9U41f7jcWYN6ldNdgKf/UrGHjOJJmKBJUH+i1p
	6dxOfySD7p2PU9PxQjOm1HvtDq+p8KUhlyLHrSjYaztzodk1RMYeKCwKFPvkA7NVP6T2NHVafYJaG
	Zfn9tO7CciXT3jfMqjjDGeqLWe2hmBfRRNmgrw4LNJWF/AZrFhkcHX6HM4gjE0j4RgTHCDb1tpGei
	a7RDMdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2Hd-000000002cw-0oMr;
	Fri, 27 Nov 2026 20:11:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2Hb-000000002cq-4AJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:11:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D4C661909;
	Fri, 27 Nov 2026 20:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69EE1F000C1;
	Fri, 27 Nov 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795810257;
	bh=RCjPO13Jg/1eI9KOpBhWyGzhdF76JSGpj17iCwvBrDY=;
	h=From:To:Cc:Subject:Date;
	b=dad6wqal4qMLI/m3CCqeUPQ3+a7J7Slmk6ZMsKZG7WXyk8TUpHR6wtcPKAUvoymQB
	 4PCsnFPEE+eAy5JHUMo0CIZ2hMcHfmK3ihlMI6C/QYD1pyNMCLmTssqGvkDkHBVuyq
	 PV4UOJnaEXq0tdvxQvypek1O/Zq7Yl/Pa2VLRSpqsi0TkIGzGWseykB7haFl/bnbOj
	 DefCUTJqpsPJq8LzHBYIwrBG+0g/NF2XSVZmpWRn8R5coLIl0FDDgWLyrxj5SabL6p
	 /tZvaAuqns8Sc6DQbstR/sDiVyHPvuBBRb/Q65gOXOWoje+JMM1qE3+AH6Y/9NX7T2
	 U0JeJL1jsYLjg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Adam Buchbinder <adam.buchbinder@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andi Shyti <andi@etezian.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Christoph Fritz <chf.fritz@googlemail.com>,
	Dan Murphy <dmurphy@ti.com>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominic Cerquetti <binary1230@yahoo.com>,
	Elliot Tester <elliotctester@gmail.com>,
	Franz Lehner <franz@caos.at>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Hans de Goede <hansg@kernel.org>,
	Ivan Hawkes <blackhawk@ivanhawkes.com>,
	Jan Kratochvil <honza@jikos.cz>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Jens Reidel <adrian@mainlining.org>,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marko Friedemann <mfr@bmx-chemnitz.de>,
	Markus Armbruster <armbru@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Oliver Schwartz <Oliver.Schwartz@gmx.de>,
	Pavel Rojtberg <rojtberg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Steven Toth <steve@toth.demon.co.uk>,
	Vojtech Pavlik <vojtech@ucw.cz>
Subject: [PATCH 00/10] Input: Fix OOB writes, UAFs, NULL derefs, and suspend work bugs (batch 2)
Date: Fri, 27 Nov 2026 20:09:54 +0000
Message-ID: <20261127201050.3532488-1-lee@kernel.org>
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

This is batch 2 of Input bug fixes, based on input/next.  It addresses
out-of-bounds accesses and underflows in adi, probe and unbind work
UAFs in xpad and aw86927, sysfs information disclosure in stmfts,
NULL dereferences in xen-kbdfront and goodix_berlin, SPI transfer size
underflow in goodix_berlin_spi, and suspend work stopping in drv2665
and drv2667.

Cc: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: Adam Buchbinder <adam.buchbinder@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andi Shyti <andi@etezian.org>
Cc: Anthony Liguori <aliguori@us.ibm.com>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dominic Cerquetti <binary1230@yahoo.com>
Cc: Elliot Tester <elliotctester@gmail.com>
Cc: Franz Lehner <franz@caos.at>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ivan Hawkes <blackhawk@ivanhawkes.com>
Cc: Jan Kratochvil <honza@jikos.cz>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Jeff LaBundy <jeff@labundy.com>
Cc: Jens Reidel <adrian@mainlining.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Marko Friedemann <mfr@bmx-chemnitz.de>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Steven Toth <steve@toth.demon.co.uk>
Cc: Vojtech Pavlik <vojtech@ucw.cz>

Lee Jones (10):
  Input: adi - prevent off-by-one write in adi_read_packet()
  Input: adi - validate axis and button counts in adi_id_decode()
  Input: xpad - cancel presence work on xpad360w_start_input() failure
  Input: aw86927 - use devm_work_autocancel() for haptics play work
  Input: stmfts - fix i2c_smbus_read_i2c_block_data() check in status
    sysfs
  Input: xen-kbdfront - check info->ptr and info->kbd before
    dereferencing
  Input: drv2665 - disable haptics work across suspend and resume
  Input: drv2667 - disable haptics work across suspend and resume
  Input: goodix_berlin_i2c - check i2c_get_match_data() for NULL
  Input: goodix_berlin_spi - validate ic_data and SPI max transfer size

 drivers/input/joystick/adi.c                  | 45 ++++++++++++++++++-
 drivers/input/joystick/xpad.c                 |  6 ++-
 drivers/input/misc/aw86927.c                  |  6 ++-
 drivers/input/misc/drv2665.c                  | 15 ++++---
 drivers/input/misc/drv2667.c                  | 15 ++++---
 drivers/input/misc/xen-kbdfront.c             |  7 +--
 drivers/input/touchscreen/goodix_berlin_i2c.c |  3 ++
 drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
 drivers/input/touchscreen/stmfts.c            |  5 ++-
 9 files changed, 88 insertions(+), 20 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


