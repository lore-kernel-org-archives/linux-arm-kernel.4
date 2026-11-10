Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888760A2605
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cMIk/dz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEiy/VpL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=; b=1cMIk/dzolL5nNRkfNfr2Kpx+N
	w2FEuM0Y/0k184B3qClt18YPfgpzmGHCDa4sf8uvzDm2CD45TYu7hQI16Y9W8pglv6b65Hm1s75cs
	vYlPIdUWHswfpoojghLSCzIEalmViJtrRZqEMash5NsymvLIPtlScbeh4Va7Q5SWzNb8AuOAo67/e
	4eB5rEIccQi3rA+f2A2JOA2NBKL80g85wX1UMrc0S6wNEcf+bEi+pyz+xMcWjPOr5wtVZqV8QskA1
	9dVghisiGprvez1dgVrflIIu52qI1RRxzMpEvYdsJ0HGs1hl3ZmH/R5S8p1nIhNGvcJLF21aWQlCu
	OGXkRp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjFr-00000003TVP-2U3A;
	Tue, 10 Nov 2026 10:39:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjFq-00000003TUc-2JYF;
	Tue, 10 Nov 2026 10:39:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4374D43D51;
	Tue, 10 Nov 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794307146;
	b=Xi47REbIc58XJ6addkbCt1S13GrItDYrprzt3pgqmr0LnWeVy7+1Ri96taFBLa8mMHZ9
	 YY0ekSYPqzo4ju5oAvenRuzf6mf5wUh1TgJTfmr/4Q/QxBKuXouM5NBiHH5qZ96MAlB5J
	 jGWjumK0MzxkQJ4IGiqVnyRGNlOLGESZmoVeUyWeGXjuuxh2RxjIzZ4mvf52RaSuui1pl
	 ZbPngEcOJ5M2iqXTt6YWTeuMqSBq+UdOFvC+a3Yfm8wDda3jcaCuc/qXdj6Q42yOUSVgi
	 DmeTbPVGb2fdAuFW9px7PJdBrbk+jreUa7a70xByEuSfXyf5L1ozIO7LSRGKyE2odnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794307146;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=;
	b=r/YIG4W3ZXJsCBG15EewY84tXyVSymaSfldqOgbiUl+/89ijmjDEBA0GRsrYQdsbn0cs
	 cRCq7D2RGWgWkN021tQ/aVFJI4hz+Ol4KiclcimOlUx5RsLSeKDvcuwfhi3mffQHvp77l
	 gVkf2Y0UDwfC8y0s4O1xUeu8DqUTLXoVA7NWaZNTGVzKTJ6uppxXAG4xuNzEMgoLsTOdA
	 twnN93baA+ne9PHqcygACC+K3znF4oVlfz/D9H7fNYSvX5iEKDHhkdzPYjt6b2wgrjf68
	 7/FMz7QRlCWJxSj+dXJGkRYT6us9Ix9r++oVbBXUiB2wsaVBOciMGMMChwXYhXj5Ivg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C51F01F008A5;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307146;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QEiy/VpL2zphZSdfqmM6MU42g3GfzaT+1HDqdGklsbDSuUtJPVbmZhmaQHpFOQv+Z
	 n6pRUwRRo8kMoZJlhe6jUeP8oqsZ8+KpP8cRchNUQCe5Uqgl9NcDUgIqUX4KNNmrQf
	 aX42/ladmuaUJ0f/rNCLuCzN0zlCIvesKQuko9RS8oEDOzyAZCrsjYSTZBDoEBPfkq
	 EmOLzhEUdGozWoCcvpIzAnwxGgHnVLOK16YS2W8zHCmXwsaWYmqB3FitT0w88uJsh/
	 BBj/SVyxJ6+p3T2Sndwsiq7UlSLCfXv0At/iH8d0KxyT5WxAN0EfKC6TL0s+jEAExo
	 zoY8x9wOQP6rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 50CD848AEF;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:39:05 +0000
Subject: [PATCH 2/3] usb: typec: fusb302: Toggle with the default Rp
 current
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-tcpm-attach-reboot-v1-2-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
In-Reply-To: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307143; l=2135;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=G9r74JoIhZT94dJ6tTMGjq0F8LLdb74sZvrJnDecsR0=;
 b=4ve0PIDBEv9KVX3vtBywpv6RlFkDS691ExgWB7vxo6V65qFCXSE+QaqPlcyo0s4kkMibchjm0
 X3umfOMvTA2CVsw19M4Eit8Q5x3c3ta13/EZwUMa9evBqZWqzHwYkYZ
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

tcpm_start_toggling() programs the Rp current that tcpm asks for, which
is the current of the source PDO (Rp 3.0A on boards that can source
3A) when the port starts toggling from Unattached.SRC, and the default
current when it starts from Unattached.SNK after a detach.

A Genesys Logic based USB-C to DisplayPort cable connected to the
Orange Pi 5 is often not detected after a warm reboot: the FUSB302
toggle state machine raises no interrupt with it while it drives the
high Rp current, but finds it within seconds once toggling restarts
with the default current after another device was detached.

Unattached sources may advertise any Rp level, and tcpm sets the
configured level through set_cc() once the port is attached, so always
toggle with the default current.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..53c5671fe45b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -942,10 +942,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	}
 
 	mutex_lock(&chip->lock);
-	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
+	/*
+	 * Look for a partner with the default USB current advertisement.
+	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
+	 * cable) present an Rd that the FUSB302 toggle state machine does
+	 * not detect while it drives the high (3.0 A) Rp current, so they
+	 * are only found when toggling starts from the sink side. Unattached
+	 * sources may advertise any Rp level, and tcpm sets the configured
+	 * level through set_cc() once the port is attached.
+	 */
+	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
 	if (ret < 0) {
 		fusb302_log(chip, "unable to set src current %s, ret=%d",
-			    typec_cc_status_name[cc], ret);
+			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
 		goto done;
 	}
 	ret = fusb302_set_toggling(chip, mode);

-- 
2.55.0



