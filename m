Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD3606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UhliYBQQ;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWva0iSU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=; b=UhliYBQQTbL7Yve+psuJNlz04z
	5LBUjzAoN65pml7dRsLy2SsBU1SWUDYVXDklkoEH9Zbyl8fB/3TyOSHvSupkF00VfWKgpufW/zIRC
	m4sfhsLvBrhWR64Qm5xrJ1w6tbPkrXge5JwcBM94Wc+tyRQtJwhAGo7Ra+Rmm8EZlVeSLzbDy4P5e
	H63gI0RwEUAgJby63RB35Yv2MX/t1bgD9dmIgmR4u6Kc80orBQDS5GvspFo7E+f71K+QWE8eQtWQD
	JVLK4c84QFzLuC8Tof+NQNq5o+bemlL7NgLi+sBDFNVG5u3te9z6vF1J+Ro31VAPqyp/uUTigsZYo
	Cfm8mrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWig-00000004AJL-3Sa9;
	Mon, 23 Nov 2026 16:16:42 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWie-00000004AIJ-2Zco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:16:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A29B201BD1;
	Mon, 23 Nov 2026 17:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795450594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=SWva0iSUNtiYs4YrPQWnIARdosnn8kP6je8hSuDShfH3F9Npjs9OfNBjXqDJgTDYWrKUiJ
	Xum+YJQ3SCBa5DxyyYIkhBq/NRgkRUzcqZIC0862fUGiSrN35O5SE+PwdEUZSeBAmRGmz7
	i9WPKihCGV2o0FkxSfOLo3qPsDPdCjABp4St86ZTRysblRRV/giP8VQP25IMftDHghk9Xg
	NRTb6Mo68R0eNCV6fCJX7lONkrtO/kUPna36IZW27iKnMYxkQizEvjmT9zuD2HhKOHV1Sl
	q/Dv+6UrPIRMf6GhrxV5o/JRNduQVvLm/SbMOvpA32oDNxyYjWAjFEJK+ZaZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795450594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=DEZaqBi+jXR5mGvun6InCSvE7U4qhLHmeUXU/iQr6vA9g8sIcZWln0yWy8GgVhC+cJ8pG0
	7QQyXBXW772MigKfVdM3332bhCCIEyCJb2HIzFDV7qR4CNh0FZ7BSUyJ/DOQO4R1Xs/Pig
	DTiEBrfxLH3Xjm7xlO5fbQRewheL2fKTc8P89Y5kpp85Xw+mdkQVaHMDuOmufiOkDLzUeJ
	/7qUYhF2yvJbPcSnYNp5G6OXAHKr5KBzRqS5EOAnK9+zLOpcsWLo1OCBOolH6m3e/XQwYj
	z5gn+DMXSFTC2LrTpfcOs/qgKPT0rKEKyHP+alXYLX7K1C5rLDZu2yTsXXUA5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795450594; a=rsa-sha256;
	cv=none;
	b=HxZnzLVHqrzsWwA4xfLcc71u+2EqTjHcWcooufCQQRNXvkEGipiy6wBpZbN4NaIEzonGWS
	+xwgrhxR4qvzKCvsfPMqYxI5ks2Lsfi6Sk2z2jZXafmLuR8Nn4/VtzOOfEKyPStYNXeVJV
	0efbsxG8TxdQLuKkzr2m9lGgnf93t3Ws0KVTFY7ecI2EE6RqfY+jQxn1EpBGFZsiAsmBHm
	jjcvWFfSYk+edau4TAu5PJ8XcNf+u/4RNJr40M8pTrl1cYshocxpc04ARRJYyOdKQwonrT
	VFQtruvDqjrlcNGbACtFmDge72ABT5tzii5t6I9Dj4qQPdJVpVClllghZLTD7w==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xVWiX-0018kP-2S;
	Mon, 23 Nov 2026 17:16:34 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.4
Date: Mon, 23 Nov 2026 17:16:33 +0100
Message-ID: <20261123161633.2530037-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_081640_800926_F8F92CDD 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dear arm-soc maintainers,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git tags/reset-fixes-for-v7.4

for you to fetch changes up to 586a87701101ba11477c8b5cdc1528413318ab77:

  reset: core: honour optional resets when the GPIO fallback returns -ENOENT (2026-11-17 14:27:15 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.4

* Set up dev pointer in reset-scmi to avoid a NULL pointer dereference
  in case of_node is not set.
* Correct the RCPU2 PWM[0-8] reset registers in reset-spacemit-k1.
* Fix a reset_control leak and a lockdep circular locking dependency
  warning for reset controller removal edge cases.
* Fix SDIO WiFi on Anbernic RG35XX by letting
  reset_control_get_optional() return NULL instead of -ENOENT for
  unsupported (#gpio-cells != 2) GPIO resets, as intended.

----------------------------------------------------------------
Hung-Chun Tseng (1):
      reset: spacemit: Fix the RCPU2 PWM reset registers

Kunihiko Hayashi (1):
      reset: scmi: Set the device for the reset controller

Tzung-Bi Shih (2):
      reset: Fix reset_control leak when put after controller unregister
      reset: Fix circular locking dependency in reset_controller_unregister()

Yang Siyuan (1):
      reset: core: honour optional resets when the GPIO fallback returns -ENOENT

 drivers/reset/core.c                       | 71 +++++++++++++++++++++++-------
 drivers/reset/reset-scmi.c                 |  1 +
 drivers/reset/spacemit/reset-spacemit-k1.c | 18 ++++----
 3 files changed, 64 insertions(+), 26 deletions(-)

