Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102E606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KZPeiFbp;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=V6pRcREO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vURHFJpqxdNji4XYAfQR0vnMtn7b/TNM3hv/Ptn0Qv0=; b=KZPeiFbpQ106m/hTmei17ax2IL
	cawVeU8voGUiveWzXgcojAlMsXI4m9V5LCRP80F/vIXFkTc1fI9Ct9reIYqYrTjgvFHJvo5ZF1LkB
	o8SgCvlQ/cEWdwr62bQfEFHgyS4po7vDEed72ZZ7qnuM0j+oLJZBGjQBxXf66Ct4XP/ryqegKzCHN
	OL315q4AuoMc/BpJF+AHzj91QfFDZELfyMplADQ/cNaO7SDwPHQ+Gn/4IiUtyhZzRQaTrJSK2SPHb
	enFfz0CHEa0CVB9uIjIdJKYLdyjE0iu0WMeDvLfx9xLHspV69vRU/TWpCIef1jnaKQRBudvQL3+rr
	uAn6+9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDK2-0000000G2XA-0ESK;
	Sat, 14 Nov 2026 12:57:34 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJq-0000000G2QR-0xB2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:57:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CC911201CE0;
	Sat, 14 Nov 2026 13:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vURHFJpqxdNji4XYAfQR0vnMtn7b/TNM3hv/Ptn0Qv0=;
	b=V6pRcREOcS8DazD7+nUWOzWbx4mrJWgVIZ0rFjXcdVtBBnHMBpU+f/9vA0Q20cMGj8gNPh
	sId6A1UrHwcN7k1SlknbyERxEkMNi9fJDsMuPG7x6rnmDLv41H6wj72XZI+AyQjGzr5oVY
	D8cAV9/p7T4iMn9Kfk2Q05tX4LaldCaLT3YGLMZHocvDqU1jjJTxN1K20Cjf92BtWo1ZgY
	L43OXOUcU1ofPko5/28oB2cJ/df3sAqB/F1bAPILMJRSGokcz4Y4YTww1/VO3yltl/t/NN
	/5OldG5gHQUJYdfvvgU3iA7ctet0DeiAU7BNII1TyGzO5uAdK5Cgu9a28zhLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vURHFJpqxdNji4XYAfQR0vnMtn7b/TNM3hv/Ptn0Qv0=;
	b=OvoRCl627zMY2S/Yz1ukLl+v8T4j+L0KPaiZHAFavpv5ae8u6OejyPgE/7ndVSY1VeDarc
	Ls5okLdNAmnHtb3akC9DJ2hqgAQ+EL0pPb9Efxn9MjnNdVTsl2WRbyt7sWJoB6pORazwHR
	K9zyY0x5m2B92/ViGdQLXrblBm+I3mm08mra5HHZY6X9CgVJ3s0KUmLz/M+uribwnmP6CY
	84GZ5N0gm9NSgAuHZbxluBCD1ecuBACCWMXAAcijrskHblK26Kywevjck/1zH+SQU1tUEj
	fNV0HGaO1R1OhjdKN+EsBUCXdK5KoA7/z65SMX4WjVhHbzA0A/kcf8/l/GZ2pA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794661037; a=rsa-sha256;
	cv=none;
	b=YjMGpMMkkie6EmcNdoiNMsbyHeDr5iwrD5Hv2m3OLj9ZJ31BVrWF3JtuPipQI2hzAUUSzV
	rcw5Lewt3pD1mXXhZjK8F8azBKjJ6BOe6j1PgVgv2eF/OtyKkvPOY1RWfNJKGjK6GWLYYt
	RiUrv/RL0IiK8AnNIeZKIMu6m980RkaEMezw+HEVcqJ/P9jXvTfNAYfR9Ze/WvGeDp38M7
	DyMbmcSBr6rPccVzws66HoUW81IFeRUZBD93fYjqZ6FFak77FFHu9DArS7rVLRMmqne/PT
	wXoEAo6+d5idmizcWzvoaoWEcIa5q11WF/LhA9pzw7WpRSr9UmcF9NVXcZyJWg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSDJl-0048pS-2I;
	Sat, 14 Nov 2026 13:57:17 +0100
Received: from hardanger.blackshift.org (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 5B4785EB9A7;
	Sat, 14 Nov 2026 12:56:23 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH can 0/4] can: fix probing and use of
 device_get_match_data()
Date: Sat, 14 Nov 2026 13:56:13 +0100
Message-Id: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wrCQAwFf6Xk2QVTWm+/IrLEJLYRXGV3LULpv
 zfq4xzmzAxFs2mBUzND1smKPZMDbhrgkdKgwcQZ2m27Q8Qu3OwTxEXWOGiND6o8RqFKAVH4yHL
 olffg/1dWl3/tMzAluPzH8r7eleu3CsuyApeWB7qCAAAA
X-Change-ID: 20261114-fix-device_get_match_data-11dc9cd85ec7
To: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
 stable@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.17-dev-d7211
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=oxSiDfJJ5FKPdCOEbPDPir49JWXUKfRJ5chn629wb4c=;
 b=owGbwMvMwCV2xirl17qZay8xnlZLYsj6EVVw55uF9HbLnxmNq65PP8Q05W/ut9tvdIPfJZ84M
 GnvqsBW5Y5SFgYxLgZZMUWWpT9OKAoEOpT2vkyYBDOHlQlkCAMXpwBMxNCY4X9RRWYr89G6X78v
 WoikulRLxLBkC1xP8jZK8f/NxBL/qI3hN8uK3ov6ufHJptk7f/yadPKAgur5v2e4tG9XvuB9O/n
 YGUYA
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045722_750791_0BA88D84 
X-CRM114-Status: UNSURE (   8.93  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With patch 5e6c3454b405 ("net: can: Use device_get_match_data()") several
CAN drivers were converted to device_get_match_data(). The author assumed
that error checking for matching and match data is not necessary.

This misses the fact that that drivers on the platform bus can forcefully
bound using driver_override and device_get_match_data() will return NULL.

By using device_get_match_data(), this change broke probing for
m68k/coldfire, which still uses platform devices.

This series adds missing NULL pointer checks and fixes probing for the
flexcan on m68k/coldfire.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Marc Kleine-Budde (4):
      can: c_can: c_can_plat_probe(): reject devices without match data
      can: flexcan: flexcan_probe(): fix probing for m68k/coldfire and reject devices without match data
      can: xilinx_can: xcan_probe(): reject devices without match data
      can: rcar_canfd: rcar_canfd_probe(): reject devices without match data

 drivers/net/can/c_can/c_can_platform.c | 2 ++
 drivers/net/can/flexcan/flexcan-core.c | 5 +++++
 drivers/net/can/rcar/rcar_canfd.c      | 2 ++
 drivers/net/can/xilinx_can.c           | 2 ++
 4 files changed, 11 insertions(+)
---
base-commit: ead6fa9a0ab194f02a2f36d634b193e9c5f9a1c6
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261114-fix-device_get_match_data-11dc9cd85ec7

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>


