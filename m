Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkhcUWjq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oem4yEc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vHAwwH0nrw1kWkp/3uuQPolxLVo5Vn3FF3b+N7bJNoo=; b=RkhcUWjqKTpxUL876BKCu2LcQT
	Qbk5IqsqMqSdtUZIMFcmZSu8S/nkngRKcdBaBm1JA8oY6yf7U9bck4OhooG9gUSvlnB6xQExHu3vm
	Bws3Qr1ecF7AD8NzhAp96DNzd5ee5PEY65Y4XK/CHkx77N0DNWVUlgQKRPvOghz3z9ftp0lwRoQ1f
	Lka+Jx80ySAvN2Hs5CNXfbOsoSbC3EkQWBUFFyIkqcVEdz6PPB2CMnaI1gbSFsDoWPCttNOwJ3KwR
	yzHe7MxpRpuJ36MrX3ABT+ZQ23l8NmrI2osCekygj57ujVXZvBHYrQ5tfoRjJl/NjJLHblM8g3XxR
	pjrOIv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllO-00000005rsT-1cgW;
	Tue, 24 Nov 2026 08:20:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllM-00000005rsL-1BC9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B86B7615E4;
	Tue, 24 Nov 2026 08:20:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795508427;
	b=nYuT1h+wPIovyujRPxP3EWJ/4IDwiRWTCh6dJvnp6hQ+OICyCyqHN1O9jzhjczd5hORN
	 9Ghda3m5TBeA4gD3yPFB1jSXe4oeJLLZ3yvNuzZHiqKExvNCz4ZkM1rHH/L+ZvMkRdxIO
	 BvlFus+/1xdXIFST9y+122TMruFbDSqUv3lq/WVnRe8AW747nInTysdnYCxpOq38D6Ma/
	 olhnUDDEj4EmBJOWMwZIZNxmAb7OWfzSFlIWzuUCY+590wh6aqon1jqtQtaS2G8bzmzdO
	 Va7k+jtz4rq6jgD+jAPeN2vLTICWRzoKFVR4tgAYqHcNEx2nueOnaTNgq8z6mqOL8FQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795508427;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=vHAwwH0nrw1kWkp/3uuQPolxLVo5Vn3FF3b+N7bJNoo=;
	b=hQIJ9tUXsRDME+jZFnHbhbw+oFLkfRB/2IgWzb9TJH3zCB1O8EA5lBbCgIaNE0Ysw1rT
	 GId3fTql8C8aNQwRru6bIrOfr3mrCp4B0fapr1l8lukLdOczUYopc2WLFEx43AMokuLwM
	 qNstODrF8jkscIh1s5U4q7Sy+VkdmyZmcmSr04yNOC+LeUQWMiJmZvEWr8FPda5HJds7d
	 3iqxq+0gwzDKVXZt92LXemKqTULGHWrFN16TWz6W9UJvJpQkEZHgUgrKNNo8QmKgdESOa
	 w7bea+zXuES6to+ArWgNNGWMiUSZ8VeNvR+12MGQKvgz3sUH+swb1akrJvbHY8CUWqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A0641F000CA;
	Tue, 24 Nov 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508426;
	bh=vHAwwH0nrw1kWkp/3uuQPolxLVo5Vn3FF3b+N7bJNoo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oem4yEc17cD03osCxkd03IdOaJl52/AFXRqwpi8QHEFGSrHFHuObc5ExsFnGREACS
	 c3Hbif08Jhnke8u7NOa6Jo+cBvZlG/zMPzWFT0dUUMlYW9e84AicGee01Eg5ijUpRC
	 njygloo0XXOD8g367mWyubwA85UjlSfZ3/+QoY/+fW5f8wmjqifx9SpkzpH06LiVTh
	 mCeFzY77J+hfDj9rA055xTQop/rWwizziBvPB938jCudid9dCINkki8ick5z2WjvQ2
	 x0FxnyyHB1t5bm9xJFWEE6tWGP/VXEs1qbUIZeHWNYHOFl14IlBwZiE/lnGvuDrA7K
	 DiJz3li5z99Vg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C27F44C936;
	Tue, 24 Nov 2026 08:20:20 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] hwrng: Add Cortina Systems CS7542 random number
 generator
Date: Tue, 24 Nov 2026 11:20:18 +0300
Message-Id: <20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CQAxFr0K6toYW0Iwr72FYwNCBGmHMDBIN4
 e4Crl2+5P33Z4gSVCJckhmCTBrVDyvwIQHbVUMrqM3KwCmfiDjDOkcbz0XOOIahRaqoNo5skxm
 GdfQM4vS9B2/lj+Orvosdt8pmdBpHHz7740Sb9zc+EaZouDHOWZEio2vbV/o4Wt9DuSzLF42tz
 Ue+AAAA
X-Change-ID: 20261123-b4-cs7542-trng-1a1b9f1cd392
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508418; l=3072;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=cxbkSaTDthKEwcdkWgVbloUCaiiY0AcMv8pFTjp9QIY=;
 b=53TlVVtccxEE5Rny7rrzitIWySScAbfYdvVN7aGSCRuTe/5xfYgQIYtLG3Y1kv4pLedC+Kun+
 xn2+1/utxFuCpHLs4nFGqyItpLVt+eLQie7bqurJ7vgqJXOInDPxtSY
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the Elliptic random number generator integrated in the CS7542,
based on the GPL vendor and OpenWrt implementations. Use a syscon
regmap for its shared global scratch bit and provide bounded polling,
nonblocking pending requests and partial output through the hwrng core.

Hardware ring reseeding is limited to the documented CS7542 A1 path.
The vendor driver avoids it on A0 for erratum 28891 and substitutes a
RTC/timer-derived nonce. Reject unsupported revisions using the global
syscon identification register instead of adopting that workaround.
The saved Almond+ capture identifies the tested board as CS7542 A1.

The binding, driver and MAINTAINERS entry apply to Linux v7.4-rc4
without the pending CS75xx platform or clock/pinctrl series.

The existing OpenWrt entropy quality setting of 512 is retained for
review. The output smoke tests do not establish an entropy estimate.

The v1 sources passed binding/example checks, ARM built-in and module
builds and RAM hardware smoke tests on Almond+. The hardware test
returned EAGAIN for the first nonblocking read, then provided 4096
bytes without all-zero or repeated-block output.

No additional hardware run is claimed for v2. The generating path on
A1 is unchanged; revision checks and their error paths were tested
with the actual C code and mocked resource/regmap/hwrng interfaces.
Full ARM W=1 built-in and module builds were repeated for v2.

---
Changes in v2:
- Drop the redundant linux/mod_devicetable.h include as suggested by
  Uwe Kleine-König. The existing linux/of.h provides the OF device ID.
- Restrict hardware reseeding to CS7542 A1 after inspecting the vendor
  erratum 28891 workaround. Propagate revision-read failures and reject
  unsupported silicon before registering the hwrng.
- Describe the hardware revision restriction and identification register
  in the binding.
- Link to v1: https://lore.kernel.org/all/20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com/

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Olivia Mackall <olivia@selenic.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      dt-bindings: rng: Add Cortina Systems CS7542 TRNG
      hwrng: Add Cortina Systems CS7542 TRNG driver
      MAINTAINERS: Add Cortina Systems CS7542 TRNG support

 .../bindings/rng/cortina,cs7542-trng.yaml          |  43 +++++
 MAINTAINERS                                        |   7 +
 drivers/char/hw_random/Kconfig                     |  11 ++
 drivers/char/hw_random/Makefile                    |   1 +
 drivers/char/hw_random/cs75xx-trng.c               | 187 +++++++++++++++++++++
 5 files changed, 249 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-trng-1a1b9f1cd392

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



