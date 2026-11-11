Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72172606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKlu01zz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ubiggs0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KzN50YqFiwiu68kTHVRL6CYOokJvbanKQvbx9hoBfYA=; b=MKlu01zz7KKVEbVUHGzKmJgBFZ
	Y0L9svi4BWBP8z0Zflbh19DX7WR6wFmn8y1pz5rhnzNF9hKObe2AW23YUADT9An5EgaeRgkNUmAbV
	C8jm9l4GFvs3eIOfRzQMMwbXUWu/63RYFQ7uS5Y/F/HfGg+6y93uidjKYHr/30xoT5/7Mp3+dg+Zu
	vs5F7VmreuNn3WW5uKJKgOc+vKe8D0z4WUgcd7KnMuvw+nATBTkoCc8WhqLeMUs0IGSkdyjTu80uJ
	6wTNWuhPByOZMi/QeehBnGf5DuwIX47xU/Cs7bHZPFwQh1E2TT9PApDR8ruFVFdr/iPyI1we2GxXb
	Mk4mMDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxiO-00000005PXs-3ntA;
	Wed, 11 Nov 2026 02:05:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxiO-00000005PXh-2HQd;
	Wed, 11 Nov 2026 02:05:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DE71632FB;
	Wed, 11 Nov 2026 02:05:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794362731;
	b=n9NEM8HaDfVYSrM1CNZE2LWQNu2p/xSLeba8CE1SNexxVlUexhJwchLCPZ88of6ciDcT
	 38A77nRjkfxWSNpt15tQZwXiNAy+PWqb+YRS9CpmmrVh6gNElxJo/x3kcdwnXUqGaPL1a
	 6KBiUJP53liUcarz9zyz5vUzYPRmK8c/2ueub3MK68KGZ9x4MLLVvoLoQvIjRMVBnnuu0
	 B/sNqEi2tDEnm3lbWRK22j0JyH7RzT9l68/Fc2ahEf+J5ZPCaFFDKaIDAeggLZIvWUNWi
	 7SoT49OQFQg9VGeV/XdhF5wbREiJ9ckmAqu90knGpkLilWiiLy3Ye1650yQ24YiTBbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794362731;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=KzN50YqFiwiu68kTHVRL6CYOokJvbanKQvbx9hoBfYA=;
	b=cMBm/odqB9HvGH597R3ARkl4yhVCmj55RhLTN/ZvGRmHILBlK8Dwg1hmRLMYoC5+BvyN
	 EYx8gaW+ps7NU+ry4EvIiYzvdRPyfhuO3QOq7q2ioREX9p89TeVFCMXm3fjxfjLxfjF2H
	 ABA76H3EKQzAmJuJ09IosWYQypMj2XXij16/IMI6osxQ/ErOsp31oAXYZQzU+LJN8H5ij
	 +lLfz/8pUoLC/1bLgMHKBqU9+CzXhFwsm1LsOrSegI17Q8VF/a2fs53lar+gVNdiJmgi5
	 oGRdQ22ajMdC8kGWPGKYySuAT+NfqSUoz6cJgl1o7BQUrIhRGXDv0ckSRNHRe6EsCww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D12C71F0093C;
	Wed, 11 Nov 2026 02:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794362731;
	bh=KzN50YqFiwiu68kTHVRL6CYOokJvbanKQvbx9hoBfYA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Ubiggs0yBMCSz4utkQ9rAQdDEqNW991M09htlgjLbex8vs4XaASKVj/5Dv6lVRyK8
	 OLcyisIRO49qpWDLuUpV3zSvS1dyGVXaKvP+U4XXTVjBjDKcMNYVwTwI4pl3mKb520
	 cXKGNkqBhFNbKD0t8ri+TWWvhVAcommCsx3wJJQnkPU7/ylGFtP3ADS86262Qxtqgw
	 NTtApnAX2Jcony5YT60KEVhPPMVz4P/d1BvzoIqw6lWRoTwU15+fVqkXbC711lKZEo
	 tFCIDhnR7Mh4FqUyhYWmXxPPoG2t0XJU9oBvukg5NuTTha3HJxk+qLmcAR3SMxucLL
	 BIYWcQpmFedeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5DFBA48D22;
	Wed, 11 Nov 2026 02:05:30 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 11 Nov 2026 04:05:28 +0200
Subject: [PATCH] pinctrl: rk805: Add the platform module alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-rk805-pinctrl-alias-v1-1-e0c6cdd5b823@iav.lv>
X-B4-Tracking: v=1; b=H4sIAGfN82oC/x2M0QpAQBAAf0X7bOtcHPkVeVhnsdHRnqTk313mb
 R5mHoiswhHa7AHlS6LsIUmRZ+AXCjOjjMnBGuuKBOramAoPCf7UDWkTiliPpqHSOucHglQeypP
 c/7Xr3/cDlZuxA2UAAAA=
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=Zndba/YdME6GY+mxEHq0lf95NjIbiNPv7gf3rw4Jcj4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmfz2Z2pj24epDrzR62HVc+Wr7yZ/Bw37x9jeT+b6/tH
 TKT5a4zdpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJzBJh+MV86o3L96szfuwu
 kg+7F35kY5XC8bgWv9bNs2O3cbddvL+HkWGJ14Zf3UsfTMkPuLS8LPP06eW2XMbas2c6H9Kf/m/
 i4SAmAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The rk8xx MFD core registers the pin controller of the RK805, RK806 and
RK816 as a platform device named "rk805-pinctrl", but the driver has
neither a MODULE_ALIAS nor a platform_device_id table. Built as a module
it is never loaded on its own, and everything that uses the PMIC GPIOs
waits for it: on the Pine64 ROCK64 the gpio-leds device with both
LEDs stays in deferred probe.

The other rk8xx cell drivers (rk805-pwrkey, rk808-regulator, rtc-rk808,
clk-rk808) carry such an alias. Add one here as well.

Fixes: ea479996c79b ("pinctrl: Add pinctrl driver for the RK805 PMIC")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on a Pine64 ROCK64 (RK805) with v7.3.4 and CONFIG_PINCTRL_RK805=m:
without the alias the module is not loaded and both LEDs stay in
deferred probe over three boots; with it the module loads at boot, both
LEDs register and the deferred list is empty.
---
 drivers/pinctrl/pinctrl-rk805.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 22f576337faa..694a47d95e17 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -700,3 +700,4 @@ MODULE_DESCRIPTION("RK805 pin control and GPIO driver");
 MODULE_AUTHOR("Xu Shengfei <xsf@rock-chips.com>");
 MODULE_AUTHOR("Joseph Chen <chenjh@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:rk805-pinctrl");

---
base-commit: 4bc88b10a232db13219667e69616f6d2250d5e5f
change-id: 20261111-rk805-pinctrl-alias-7d08a4266cba

Best regards,
-- 
Igor Velkov <iav@iav.lv>



