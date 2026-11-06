Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB8606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siQurEoT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s81Qxk279B3OZvT8HyIcxZsvmqYvi7yEZFqL8sa0/fc=; b=siQurEoTsRL5Xlq0D+Bt4tTGOq
	PvCLwDIHcQndVyROvynMUprhIlgIy93GofhS0L3JaamIEditah20dbuzfDN7JTZlTEYryX8VXFa1O
	6Qh3pDEBTNuzDa4D/vkrS3yxEnBmLCyN8oofhxsaCUy6O4wcJlvofi624RS+0uNTMrFujg+HEAl+U
	14kQTKj5T6sTkQPIyUKXR76YlozqHvNVGC2CvTH4aSumkES2PnztFfqAytuQANofKMHY7kuJJ3eJF
	ySiQrN1H678j7IjQwtMGPFWTA2P5xcCjbnIOArYEsBKQB5L6eczYXmLJkJ6HxbQhjh8joQ8gnw65d
	sv43UpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMTg-0000000Cx9e-3LfP;
	Fri, 06 Nov 2026 16:07:44 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMTb-0000000Cx8h-0CuJ;
	Fri, 06 Nov 2026 16:07:42 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jLkbR68lnz8Xrrd;
	Sat, 07 Nov 2026 00:07:31 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6A6G7LSP074678;
	Sat, 7 Nov 2026 00:07:21 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 00:07:24 +0800 (CST)
X-Zmail-TransId: 2af96aedfb3c6af-a8634
X-Mailer: Zmail v1.0
Message-ID: <20261107000724697MsR-XmE4V-ADPPMr3wGom@zte.com.cn>
Date: Sat, 7 Nov 2026 00:07:24 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <ukleinek@kernel.org>, <linux-pwm@vger.kernel.org>
Cc: <laurent.pinchart@ideasonboard.com>, <heiko@sntech.de>,
        <ben.dooks@codethink.co.uk>, <benjamin.larsson@genexis.eu>,
        <nuno.sa@analog.com>, <xiaoning.wang@nxp.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gcHdtOiBmaXggb3ZlcmZsb3csIHRydW5jYXRpb24gYW5kIGVycm9yLXBhdGggcmVmZXJlbmNlIGxlYWtz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 6A6G7LSP074678
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 00:07:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEDFB43.004/4jLkbR68lnz8Xrrd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080739_250986_98AB1B6B 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five independent defects in four PWM drivers, found while reviewing
linux-next next-20261030.  Two are 32-bit overflows that make the
hardware readback report a wrong period or duty cycle, one is a 16-bit
truncation of the on/off counters, and two are missing clock or
runtime-PM cleanups on error paths.  All are reachable from the PWM
sysfs interface or from the hardware readback path.

The series is ordered by impact and is independent patch-by-patch; each
patch applies on its own and taking a subset is fine.  Patches 1 and 4
both touch pwm-dwc-core.c but different callbacks (dwc_pwm_get_state()
and dwc_pwm_apply()), so they can be applied separately.

  1/5 pwm: dwc: Fix 32 bit overflow when computing duty/period in get_state
  2/5 pwm: airoha: Fix 32 bit overflow when converting duty ticks to ns
  3/5 pwm: adp5585: Clamp on/off counters to the 16 bit register range
  4/5 pwm: dwc: Balance the runtime PM reference when configuring fails
  5/5 pwm: rockchip: Fix pclk leak in get_state error path

Shao Mingyin (5):
  pwm: dwc: Fix 32 bit overflow when computing duty/period in get_state
  pwm: airoha: Fix 32 bit overflow when converting duty ticks to ns
  pwm: adp5585: Clamp on/off counters to the 16 bit register range
  pwm: dwc: Balance the runtime PM reference when configuring fails
  pwm: rockchip: Fix pclk leak in get_state error path

 drivers/pwm/pwm-adp5585.c  |  7 +++++++
 drivers/pwm/pwm-airoha.c   |  8 ++++----
 drivers/pwm/pwm-dwc-core.c | 12 ++++++++----
 drivers/pwm/pwm-rockchip.c |  6 +++++-
 4 files changed, 24 insertions(+), 9 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

