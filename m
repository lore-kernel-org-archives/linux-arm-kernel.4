Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4519F606A895
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=upd7Axwv;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ToWeG7Cl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HxSisoivI5TlFI4z/juRf21tjtS6x9EqwvdGSd+qfGQ=; b=upd7Axwvj4X5o0
	7ZSP9pzXObqOqb+N4UC73+1v1mwBC1HSOldxU+ovsjxLdFwrbJcHf2mtaMHqZO+QSIFyTVWoq5KY7
	uMksAZxpNpnG8xOCF2s0Re9M+Isy7Zzs3q44ahncIV2VcRVN1gkock6Nie4X0XaeVuAK8qJ/Xhxk8
	4rvclugtSJguJN2ds05St/79t/gfBxUXNg4eEwqIhPfXCt9VPQzvIJaIKDOZlJUjF14mvB2tUIsnO
	b4M3YEpCBy5x+waEhYEuCKwshpZGQB3PMHF4C0YF5/NzUexkA8ryD9ao3xudV4LbLz4hjANaLPkCk
	rSNnBNISndHS5SVQ9BGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJs-0000000G2Sa-3AVP;
	Sat, 14 Nov 2026 12:57:24 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJq-0000000G2Qe-0v2X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:57:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EFC8E20233F;
	Sat, 14 Nov 2026 13:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxSisoivI5TlFI4z/juRf21tjtS6x9EqwvdGSd+qfGQ=;
	b=ToWeG7Cl5QvWbnVQAhaupDApGNCZFU5mdjC/gy9Pn1h2r+ikkeukbTVYcyAdYEB8vACJZt
	gKFCBrZnF4voa/MAhYSowtBOkcm871g9ngQwF+kYF5HFb+lbDLsDPpCpBBHW0XoFgawB+m
	EkRUDRzD+VRQPD+Ad2RsrmAwhhpbHdpbdi5trcqIUyzNNV840JW661OVnOeVVDy2stb7Ol
	FsJ8j5FzBdhO5xSIrMuFYRvKdMs5rqRSm/pHPBb1TyMabaFgqDScZVUg7k1U/g+9h8OFtU
	PJdQMtHK5RHib83g3nptJUen9/Dx/CBTsKcySe0RCheqUudg+ZiywMmTsRl6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxSisoivI5TlFI4z/juRf21tjtS6x9EqwvdGSd+qfGQ=;
	b=aW/wOAbdYb1t9yMHq51KJLYHhROIJeoWra05g7EmyONJ2KIBan73v/cMtfVp+NZfDupib3
	tmDOh2//B/EnHGuTvnE6aqANE/j/4zefSFdL7RAQChc8UZBVRPtkpp3UIOMPg7UgVXhrXk
	DXWRjEn5EyFhqo3JZPCbMWkfrWV5FCYVmyhHdBAu30NF3fQ0XT9VOUWb9/Vafa1e2xKdHx
	EktfGU69F68mxqGmIrRABX2ouNv8JwFZfgIXvyFj+XVdXV5n3EB8b0qDf9y/oPzL41dvu0
	RtJgzrLzUT26/x73HXaGdeNfQsji4xyYLYPNBqSxqVeMnQ3vDX27QrOO24oi6g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794661037; a=rsa-sha256;
	cv=none;
	b=Uis+tfytRoDHgsVgsIatCrCwad0AYBMEcbGcBaqpp1xa87Y59iMOAG6wpREu44zdo07mr+
	K/2NBOTO7humIM1lDYl3ObuwRywLaXRzC54Z5PtIhaqt5njHru8RyEbEy5tJ/knBvyWYln
	eB63jGErnvIVJ9DRq6P/r6Aaywp7/PS1FqWXU2uoTxJKG4KG2mxH9MjOoATBAjnEULq/Rt
	7SUv9Ap23+tOtpZywd2KvIJ7f3G1AGbRMQc7m6WYOS1mZpBgtCbu0nMJ86VqEaMB8Y+fJ/
	ucs3wndOV6vF4C3q7Uxn3uIDYc6WIsdy+o0096JmGbLq+aa/7DN7gLKF9GHCTQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSDJl-0048pW-2P;
	Sat, 14 Nov 2026 13:57:17 +0100
Received: from hardanger.blackshift.org (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9A4165EB9AE;
	Sat, 14 Nov 2026 12:56:23 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sat, 14 Nov 2026 13:56:17 +0100
Subject: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
In-Reply-To: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.17-dev-d7211
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=3iAgGk0Jo3GmyGbkpHqH1FzdNo7ko3o9hbReVSOW0Y4=;
 b=kA0DAAoWzDpk+q6ZrdIByyZiAGr4WnWg+jsDpc6Flau3YI2l9fSmk/KTyN/nNSdH3tkYgRsnv
 Yh1BAAWCgAdFiEEpfjIIRBRQHWN6WCSzDpk+q6ZrdIFAmr4WnUACgkQzDpk+q6ZrdKd7QEAnS/n
 Tvf0oEYT2d7RuRXM0y7CSHrEt4/Ftdw5hdsxTeEBANQK5pNe/GG7jazkeUc1sws7K6cVlWMPGxn
 kuMLVt3UD
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045722_711299_C89FE1E8 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A device bound through driver_override need not match an entry in
of_match_table. In that case device_get_match_data() returns NULL, but
rcar_canfd_probe() dereferences the result.

Reject devices without match data before continuing probe.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/rcar/rcar_canfd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 000a6433f46d..9d463a9c1766 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2113,6 +2113,8 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	int i;
 
 	info = of_device_get_match_data(dev);
+	if (!info)
+		return -ENODEV;
 
 	if (of_property_read_bool(dev->of_node, "renesas,no-can-fd"))
 		fdmode = false;			/* Classical CAN only mode */

-- 
2.53.0


