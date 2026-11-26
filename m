Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA74606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GQKREdIQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMxQHLNQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NAzHHL0UhEEN4C/38/am72G8TgnWEWzCBdt0PpC/bV4=; b=GQKREdIQ9owJcUSM/0Hll+ZYjT
	B2PKWTQHSNugiOLCe6Z20bOF3sBidyuEls8meqeZd59cxySVDVCkGknmlc+egI3e2J8SsO7/exWnH
	2RdeNQ9/3bplyr+KugmGzhe4Eo8GOwPaEy9ukEfDA2D0IgUV1Cxo7Zi4lHD56W+b1RT8Hx2R+vGS0
	VhG7aAaVPDd+0CqsKhSdpccfM2ZaZt1GgS1UovGUK79lCbDD9G1HMK7BnVUqCLyu/u0PrAxwELHVU
	ql5OzUukUIDQf8dDAPbUuQE/i09OVFfvkPikIwrgFpjFdVvYCiMQkBhuaoQRCXrO86qhQWv5IEIoe
	xymMJYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdq-0000000CWKX-1Hc5;
	Thu, 26 Nov 2026 09:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdb-0000000CWDE-3rME;
	Thu, 26 Nov 2026 09:19:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9DAB440A2;
	Thu, 26 Nov 2026 09:19:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684771;
	b=0gVkefn67me/d93uiYjkpW/78M3XHNTlecD7twsx4ScyPpuWHT0G8K5MSH1Uye50otKJ
	 hspTcuj0tCYlZ9eJjHylgZV8jdiYcSqY2msFHAOYvm84m9UBCI4pJWxgQK2w5H4SafJJs
	 K3ToZAoJS9xW+HXo2Ai1bilcNWvBlwUonzZPPtpWIxQKKtLu8Pc/8lmzFVXvv5kWKj6ji
	 BHlqheDCkVmWAYJb9+zF4dqxP+KCFx9JxP7gIAlSIqTvNNR5WN46FLH8kqSNyVB9ONIcL
	 pkzftmeGfQDNSIvQhr4yAb6PKHwhlScYkYjfpRRLcIdqiKFSeQxU+g2ED9kX7w8tQdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684771;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NAzHHL0UhEEN4C/38/am72G8TgnWEWzCBdt0PpC/bV4=;
	b=LsrOU+isVtkEqTI7abZuemFjSOqIblrdI8Ii7qtetrZBpiKtcnbcakF8zNNrrvK5exOj
	 UCycGQTgN12+MKZPKgfZwd4lH1o6S9yCb5A3u8iLlt+VMoJDmMkdXMirVJqmIboAc8eID
	 SgzotHkoKchtYWTd1EAyA00l5gA+IQ1IukIsVx2B5CdVI5q7PExrFMrvgF4CZF23F0h7K
	 WWRnAKtVSWTIK5+ESfbsgUniAsoytqMhyXF+PMfHSs9wrHW6dFb25/G4730OsBDXR3H0W
	 lsbXlAF0etFOrBv3Z+Az6zVUcpOCi2QhdO7DNNWDt/7PxMMoIqeZinwoeWyC0dmz6jg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FFE71F000CF;
	Thu, 26 Nov 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684771;
	bh=NAzHHL0UhEEN4C/38/am72G8TgnWEWzCBdt0PpC/bV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EMxQHLNQxci8EQbv7G1xUMCaFbWF5mOMx4EtP/vEfnvLVWWqTSQi0aMVNX71R3A/J
	 8KOq+5hvYhR1Yciv0XLIrz57sQ4G8K+r0mW1PokMehgWfnI8EVCDDLbsxr4A8Yc737
	 scdXYQ7eNeG/yM4TJwZHTH0IpppA2xCNg2OUAJRW+3MT0wRIdvkzFS+sSnC9nm+sEZ
	 ClFuDd2uDd7Yv7P5t56U0XzQ6GP8Cj7WqKsJshmlxTrURh+B1yAqNwI/tiQAayBJ92
	 2MFP+4U5WRSZSUzyytywyV8bUbis/qFlH8GEsfmc8avAzVt/5HmKQfqrHuI/6QEyk6
	 8eoGKNMK2noUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EDE0F4D342;
	Thu, 26 Nov 2026 09:19:20 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:19:22 +0000
Subject: [PATCH v3 2/2] usb: typec: fusb302: Toggle with the default Rp
 current
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-tcpm-attach-reboot-v3-2-1c97dfa5024a@gmail.com>
References: <20261126-tcpm-attach-reboot-v3-0-1c97dfa5024a@gmail.com>
In-Reply-To: <20261126-tcpm-attach-reboot-v3-0-1c97dfa5024a@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795684760; l=1959;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=FMswpD7V3DPAN3VSP6u/NBb3U0lujecrXjPnwM/C3ww=;
 b=IkegyDSSVxo1YrjdpWsl/T4MeCRH2GmVL0WbsdLAscAQUIppgLhut10FHxllTrHU0NTalXkjo
 fNHD/lY9irXD+lYlJE95huL9zqmw1bKc3kjbW/Jcqtw9+2tM0ycNw9g
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

The FUSB302 does not detect some sinks while toggling with Rp 3.0A.
Toggle with the default current and set the requested one on attach.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 83bd287dadc7..64d02cc0ecae 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -97,6 +97,7 @@ struct fusb302_chip {
 	/* chip status */
 	enum toggling_mode toggling_mode;
 	enum src_current_status src_current_status;
+	enum src_current_status toggling_src_current;
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
@@ -942,10 +943,11 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	}
 
 	mutex_lock(&chip->lock);
-	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
+	chip->toggling_src_current = cc_src_current[cc];
+	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
 	if (ret < 0) {
 		fusb302_log(chip, "unable to set src current %s, ret=%d",
-			    typec_cc_status_name[cc], ret);
+			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
 		goto done;
 	}
 	ret = fusb302_set_toggling(chip, mode);
@@ -1357,6 +1359,12 @@ static int fusb302_handle_togdone_src(struct fusb302_chip *chip,
 			    typec_cc_status_name[cc2]);
 		return fusb302_set_toggling(chip, toggling_mode);
 	}
+	ret = fusb302_set_src_current(chip, chip->toggling_src_current);
+	if (ret < 0) {
+		fusb302_log(chip, "cannot set src current, ret=%d", ret);
+		return ret;
+	}
+	rd_mda = rd_mda_value[chip->src_current_status];
 	/* set polarity and pull_up, pull_down */
 	ret = fusb302_set_cc_polarity_and_pull(chip, cc_polarity, true, false);
 	if (ret < 0) {

-- 
2.55.0



