Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC41606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V28OLwvs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZz1gcvI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pHsOXVxVLlEXOeOwaoQ2j0GNHVZFECcyDzkftLsDHek=; b=V28OLwvszD5YmxhntD2r11PE8Z
	ZOIe/VgvcI2J0JuYJ0Rha/KDCqzX5wWHcM5xB4mVtMWoZnFd8koCi3BVe+K5Ylz5OB2NBIvT3700W
	kR+DkWaUGamTDiex4/3tI4Pl4Pha9OAcauxQyPHMcMxGXwEJOOVb5kASUuVylZt2fkD/0NWLYEUBw
	2Wp06vxjU4t534C+dH8IFhXujXqKxeBhzrMRhdB93J5uLgpGkjJWI8UvrQQjBh6msAj3ACt6hdbRj
	sE6O3Jn6Ierouzt6sSx/qbIm6N+u7tr27B5Wq19T1ftAZM0AflOOBAQBW+bTzOa1Zcs7aqUjepE8S
	igM6RBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJk-00000001gnU-3N2W;
	Mon, 09 Nov 2026 20:50:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJi-00000001gmk-26is
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0301456D8;
	Mon,  9 Nov 2026 20:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96331F008A1;
	Mon,  9 Nov 2026 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257413;
	bh=pHsOXVxVLlEXOeOwaoQ2j0GNHVZFECcyDzkftLsDHek=;
	h=From:Subject:Date:To:Cc;
	b=UZz1gcvIrhMnr0bsvjrO5zQ98G288ZwWf4r8HJjmrRmkfFPjCRBhNFyWckYASZQK/
	 5mVXkG/tIv4qzoIJRjQlgQXX8hUfTP3gjrelEG9cpoDPXWz6k6Kn7Vh61hA3WDGXvU
	 U6HL2q0tUgDo2F2eER126laCBTcc/F1NX4SURHjlq9EbpA0QIT3rPY7+KfmRG1VSUg
	 ye7B5MqntDQJpRyOl1wGBkjZLonDRyL3L0KuI1AhtlAKUxn4AMdq3n6DEZFPb8PhTy
	 nL+9yXl4cIhQZWISwknT185gywW2glZibagxB24Dd3nqRXXECeCxdtI2YLz1OgXlkI
	 VWtc7dlR1MjGA==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 0/6] i2c: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Mon, 09 Nov 2026 21:50:01 +0100
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBG4avIrDuQpGixVyldSOa3nUUTyRgRx
 Ls3uPw27x1kKAqjZ3dQwaamOTX4W0fxO6UPWKWZgguD925kDZELfnkDS04rVwNPdc1WbUESvsc
 HxuBmkX6gVlkKZt2vw+t9nn8X66SScQAAAA==
X-Change-ID: 20261109-i2c-remove-dont-use-autosuspend-3c7e920fdd56
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=1523;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=wAdUJkUDAkxbjk/LjE0YRGa5u0mixzgcRiCVg2IqxwI=;
 b=65Fv3jq7TmhA+zdfDNZ86aIiq59u0GI3Dk3o5bNnJK/yQBn3U/2105tLuIp7/Pl+9BHgT+NSG
 ebdp4dR8JceDtO7rPFoav4i4U7TCCv4X1IOwo5s18NKckgMdtXoxxrI
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

NOTE: Some drivers in drivers/i2c/ still keep their calls because they either
rely on pm_runtime_dont_use_autosuspend() before pm_runtime_disable() to flush
pending autosuspend delays and trigger synchronous runtime suspension,
or operate on a parent device rather than the platform device itself.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
Joshua Crofts (6):
      i2c: cadence: remove redundant pm_runtime_dont_use_autosuspend() call
      i2c: img-scb: remove redundant pm_runtime_dont_use_autosuspend() call
      i2c: imx: remove redundant pm_runtime_dont_use_autosuspend() calls
      i2c: riic: remove redundant pm_runtime_dont_use_autosuspend() calls
      i2c: stm32f7: remove redundant pm_runtime_dont_use_autosuspend() calls
      i2c: xiic: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/i2c/busses/i2c-cadence.c | 1 -
 drivers/i2c/busses/i2c-img-scb.c | 1 -
 drivers/i2c/busses/i2c-imx.c     | 2 --
 drivers/i2c/busses/i2c-riic.c    | 2 --
 drivers/i2c/busses/i2c-stm32f7.c | 2 --
 drivers/i2c/busses/i2c-xiic.c    | 2 --
 6 files changed, 10 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261109-i2c-remove-dont-use-autosuspend-3c7e920fdd56

Best regards,
-- 
Joshua Crofts


