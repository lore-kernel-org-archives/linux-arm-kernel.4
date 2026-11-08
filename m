Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0536606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tfHeh0Ba;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtjN5ruZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zRB7rwqmRY2LuYlyLM/gqxBcgYofPW2PHvkbGtfLE0Q=; b=tfHeh0BapPKDdd
	ZccaPKGK7uIkpwpeFFfBSIl6Dwx9QOwTiXIVlmaqZVf61zRN7l4ZJ+3lq6ZLsrRRUa8VI6FOJUYLN
	C4osvQTHNtXLDffy0wtLOtKpr5PSo6XJNxZxIBulc0zyz7SAZAyjgQYfWES1TXuItg7AaJi5E9yY/
	OQ/JPXM07MqB0qft3BtFIzBf8y3IerRw85EOEvYEhpyWRCLxRoFlL86f7iPKzcp1HTjKRhjW7bw28
	4nVpsNbxqVcuH3PEms37KK/FM5Zth0+P60lHauRVYBaZK836/+9ESIX+RfmO559fmBWekIANflqlf
	7rxg/ymQ6/bxqtPS/nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxHG-0000000FmqC-0Bb9;
	Sun, 08 Nov 2026 07:25:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxHA-0000000Fmmw-0yBF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A87F661435;
	Sun,  8 Nov 2026 07:25:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794122714;
	b=jmDEABVIc2KwWtQ4TQf9LrPqRKz2rQxjlm8AsPVnh6KjFcnUHCPSo6i4CQKLlWxWIAJG
	 M5rmXuLpV/KiSR/PoyF0E1tt4GnQT69KH2etzNP1Iv+jpne/zMot2uYXPktht8FTGen2O
	 Us4psaTE+mpnf05jYBNs2igxTtCgLp/pBpysffluGRylmD+tel0ZJHcKJd6u/sL11a6F5
	 OaA8+dDixv9M/MS/de1FoA3LUMUbSj8mfp5LmhI7qjVIMQLHFgDKwJGB5c6kLPIIy91Fa
	 jf/43rbjQeX9na2gwfHxD5Cf9/6B32JA1V63lS2mTnQV0U6LprdRzyvYKVEnvXH3Rjg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794122714;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zRB7rwqmRY2LuYlyLM/gqxBcgYofPW2PHvkbGtfLE0Q=;
	b=ARiZyXBdrEvbxi1KTWQYD0cS8VVsjtM4b9Fb18paoq4Ryqg8XMhNrO7xkxzX3mR0/Nel
	 e0wShtc3Rpv6U7xVdNSz8Vzvwpc5DoHV17KXyqkkiucT0ZkACwb+lExBsJYjc69iUG8Pn
	 aoASS/k6V0GNkhYF4PFsaUwgvTUjhjR5DrB6tTRaMBpDVvfy5IIiEuAvnC5sSnDuFs6t2
	 XsisychgcGSXcbk9op6fPIc6OLplybiY99D8HXheuZ7OPWbbyu0NbKxMzbYrMoBCu+Ety
	 NtfdlWDN/mMStFZVOF9WGZk7EvtafzGkfzuNDPMBvN5F56jOCCle631mAwUSFoFS24g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C15981F008A6;
	Sun,  8 Nov 2026 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122714;
	bh=zRB7rwqmRY2LuYlyLM/gqxBcgYofPW2PHvkbGtfLE0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MtjN5ruZPNolCHioKUjEtBaz7Tj9rahkZ/Xe7SptUjGV7Ro8KjkFVC81eHdBhwv21
	 q7b04FZNwkxdFVFxWUR3AEJJwoMtFBV8kTaQl5qv1ITIySy/tUyXLF5iHcyCmcuoeb
	 ZJOA7sFXUWaerl+ZjEogMXiLqSmhcmO6ph6fIm95FoFrERN/UWdr6FZw/z8C0IwDWJ
	 On1mx7Vk2ItGxoLVVAlIdC4CswxmkZwzeVCKOKdFYXD+I80x7lyB9gnpoJ3OAWSR9y
	 C6O0IS0Ty3MeC7kctSw0xc5Te+p/R4JSKZaxEBF4LfAHioRupnh7Ev7kuuLmiXFm8V
	 PleCPHLrRT6Cw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4FB3147E63;
	Sun,  8 Nov 2026 07:25:12 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 07:25:09 +0000
Subject: [PATCH v5 4/8] soc: apple: rtkit: Add tracekit endpoint
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-apple-mtp-keyboard-v5-4-e2c97b82669a@gmail.com>
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794122710; l=1200;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=mLYyKOITM/jTtMK0WXkDAyPYTTFaFy9v6Ps6Q8WNUHI=;
 b=yiCbQT+t+5q+O7ZI0VPjarqlMZW8OnLxDct5ORNSpQHNzQgVz/BKBVFVL2gHYk0+7LVjY/IwC
 DuvqVYIDKt1CIhwTVmT0nT/RQEa0iR4Y/4CYzSy8yNTkdbc1UFPs8Lv
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

The TraceKit endpoint is a system endpoint used by MTP, AOP, and
potentially other Apple RTKit coprocessors.

Start it automatically when it appears in the endpoint map, like the
other known system endpoints, to avoid warnings about an unknown
endpoint.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/soc/apple/rtkit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..1059b4bd8732 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -22,6 +22,7 @@ enum {
 	APPLE_RTKIT_EP_DEBUG = 3,
 	APPLE_RTKIT_EP_IOREPORT = 4,
 	APPLE_RTKIT_EP_OSLOG = 8,
+	APPLE_RTKIT_EP_TRACEKIT = 0xa,
 };
 
 #define APPLE_RTKIT_MGMT_TYPE GENMASK_ULL(59, 52)
@@ -191,6 +192,7 @@ static void apple_rtkit_management_rx_epmap(struct apple_rtkit *rtk, u64 msg)
 		case APPLE_RTKIT_EP_DEBUG:
 		case APPLE_RTKIT_EP_IOREPORT:
 		case APPLE_RTKIT_EP_OSLOG:
+		case APPLE_RTKIT_EP_TRACEKIT:
 			dev_dbg(rtk->dev,
 				"RTKit: Starting system endpoint 0x%02x\n", ep);
 			apple_rtkit_start_ep(rtk, ep);

-- 
2.56.0



