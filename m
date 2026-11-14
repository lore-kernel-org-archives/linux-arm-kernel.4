Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F968606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yeEGxfZP;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Bvw5LNZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9gKGnztOczuNd4xvzEZ+s0v96neMAAhFQuwPjwgllc8=; b=yeEGxfZPpI5cSC
	Sl4r4a9LLl5/bp6hPuPba88qpKIlUxTsVPE3QA9BrqBPgDPkiDw7lMtc8BdFcX/OABO7g4QWVzE33
	/Ha37+ZJnJxP9ouH0hiuQKZXpM+PsFEj6t3Gt26Sc841hbY0yCaUOvAaXqzdHLnh05Dd25IIxofzK
	xiRIzwHhuq7R06UeYJiZ0cQFWUdz1SluR1dqeA48RjaH0B02pvmKCRrVREvbi0Vk5jYZrXuKc5ruA
	0yuRxe4njcU6/EB23zPNPrDQvcW2r1oqQtyzY+TARkJSLnJlT3tYyXgz1mg4V7J4zHs4JJRh6iL7v
	71D4yQFPmreLNVSQ7zaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJs-0000000G2Sf-3d96;
	Sat, 14 Nov 2026 12:57:24 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJq-0000000G2Qc-150O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:57:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E331B2022F0;
	Sat, 14 Nov 2026 13:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9gKGnztOczuNd4xvzEZ+s0v96neMAAhFQuwPjwgllc8=;
	b=Bvw5LNZT3LIMcWhg6Z5zlEYJIpLrF2WXb6ahmJFG/DF1NsLVVy1wyhd1CowDPghL+HPyTn
	zImFi1qwQKcJWJei24swhHuyS5OXhWusWZ6SfTtpmbibqe59a8/FLQQP8U6fQN4PFXu8d5
	/BTL/9OmE7JuZ/SwMfMeXiBcVkGdsNyk/ouF0bM7yeD0nLdzDsP05I6b+bEjUGke2ds9zw
	zzEwnjVy2He7q1beYOjEahQMgl8wfqpmkl3MatLHWXhDnBXk/YtoQqIiAy1t+fVvi1IMup
	M0kUiQ50ljTQdxBXzKhcpd2Rhh/gx1KEJQFo+NMtMHr9O1vEPKuZ35/tg+fRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9gKGnztOczuNd4xvzEZ+s0v96neMAAhFQuwPjwgllc8=;
	b=IwH/ZkVOe9l2nM+F/FE+S5mxd8OI6zAaBPvsP13ilSAPcjQ0lUyNP8AlH2cLPZPmE3HJSY
	DltqBp3ZqdugaCe9weugssE0lBVmyWVY7oQl4xrgQ1KllgZquu2NEFxdTWQT8DTUirYNNr
	T2pGK8ue1dm4Y3CblBvGW5hMomt+7lwOvBY782WmBkri1VsnrsMZ+bHDOVZj3KflNyFHLl
	1BY3enMl/eVz9KytmOgBJ2733z44W51ZXaplcvJ1KZFiky6mPyfjcMqpE/KtipWAjNx8Qn
	lTg2Gnh4Le93uKcSVE/z+NpkilT5fyrJQEZrs8K0u48aUZFVwQJosM7H85cA4A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794661037; a=rsa-sha256;
	cv=none;
	b=EbjRPEJTPdZcSSpHG7CQeiBrUNj/78RW8BAz0FJ90aVuJJgpIfzOhWV/2zShRLKSQ0k1AP
	ZzBIbVUy6oVQg3bQjNZJFLc6nmiKCLkn2JoeJpJpG6c9lfRdm0KAxQ9L1use568E9+Foeo
	IGJWkzaufcfSxVp4dvpnJFrw9nVchtS+71GJLVwdeKH9z7qCV/2T65s1mbvZ0Ghl4UaqFH
	K06Fq+VdYpQOjIol1UTWYyBUKbt2KZMqkXKJH0QibayrFKLTSP7y9nYYgMcNz1RBMrS17g
	fAHX2OMDeUWQSFncLPtLfX/NGo9OJXSftaR59nQU3Tz7EZrV6S3ZANQ6tRyX7Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSDJl-0048pU-2N;
	Sat, 14 Nov 2026 13:57:17 +0100
Received: from hardanger.blackshift.org (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7BBBD5EB9A9;
	Sat, 14 Nov 2026 12:56:23 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sat, 14 Nov 2026 13:56:15 +0100
Subject: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
In-Reply-To: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=x2DoOAMK8qYYiTqT7rP4+/o++VZfdsYk6nV6J+hmNmM=;
 b=owGbwMvMwCV2xirl17qZay8xnlZLYsj6EVX04eNjRq7F+xbm96Z8qZO02jdpa/H6Xj67IpXjw
 q89A977dJSyMIhxMciKKbIs/XFCUSDQobT3ZcIkmDmsTCBDGLg4BWAi84sY/lkKzc8tOrKKL45L
 /htbg1dZthH/NSFenTS23zz/Uq4dtGf475uXeKpMaJK28NzK0wqFhjn8KV0iqTqnfh1U+fj6urs
 aMwA=
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045722_715279_B8C1058D 
X-CRM114-Status: GOOD (  12.26  )
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

When determining the device details was reworked in commit 5e6c3454b405
("net: can: Use device_get_match_data()") there was no replacement for the
previous handling of non-of instantiated devices via the device's id_entry
which then results in a NULL pointer exception. The only in-tree provider
of such a device is arch/m68k/coldfire/device.c.

Restore retrieving the devtype_data via platform_get_device_id().

Also a device bound through driver_override need not match an entry in
of_match_table or id_table. In that case device_get_match_data() returns
NULL, but flexcan_probe() dereferences the result.

Reject devices without match data before continuing probe.

Fixes: 5e6c3454b405 ("net: can: Use device_get_match_data()")
Cc: stable@vger.kernel.org
Reported-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Closes: https://lore.kernel.org/all/20260618140147.142489-2-u.kleine-koenig@baylibre.com/
Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Closes: https://lore.kernel.org/all/20260528-fluorescent-sage-ladybug-43261b-mkl@pengutronix.de/
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/flexcan/flexcan-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
index 86b40abe9e76..2bb9e4184eb5 100644
--- a/drivers/net/can/flexcan/flexcan-core.c
+++ b/drivers/net/can/flexcan/flexcan-core.c
@@ -2148,6 +2148,11 @@ static int flexcan_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	devtype_data = device_get_match_data(&pdev->dev);
+	if (!devtype_data && platform_get_device_id(pdev))
+		devtype_data = (struct flexcan_devtype_data *)
+			platform_get_device_id(pdev)->driver_data;
+	if (!devtype_data)
+		return -ENODEV;
 
 	if ((devtype_data->quirks & FLEXCAN_QUIRK_SUPPORT_FD) &&
 	    !((devtype_data->quirks &

-- 
2.53.0


