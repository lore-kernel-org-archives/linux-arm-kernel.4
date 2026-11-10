Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E86606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m5RB275k;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZEKGhX1A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n7wwb0uzmhfZxhSJHZrgJrb4K/zWUbcQx/RDNUytUQA=; b=m5RB275k3wIIPL
	0JNpdq9RpK9zOHWRHdNvbG7RBGHkEOx2YVi9Uq5Wggk+etCGqVKc0uzdIXmBQ63/U2e4x2u2JmOKH
	1uYc+Y8ejj7bim/Thqr3p5SU3lj7850Sx3GSWvtzTH+tNudZU1GP5iXf9SxW1giLSAaWuM7plRMx4
	CpC5ZQyP/VCS3GO/pfHqb5/+8MPk9BpW7BriAbUQ/yzGY+zHQ1tjaAaulXRKiiqEMesw2HAmGeY9d
	cAonh0ByyaAeqRpxuaQi8/gpFn3QXARjSoDjLS4BqLNT4+Nh2vxqeGBB+u5+u0+Ahavcv0PsP52X7
	YX99y5KxwoijqoRcMx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgKd-00000002umK-2Px7;
	Tue, 10 Nov 2026 07:31:51 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgKZ-00000002uln-3khs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZEKGhX1Avnq50VfJEKCf1mOb+GdCs5V1+zERw14z0wP9wjbMo79dnJKcLbdpAwX3+SkCrc03X05Op
	 HYPoWKIQceTWA+iCKDpHYf1Fs/I0+wkeRl2IAV/3bQGN7cbwPZvxj9mif9kt7S5nM6i2svQjH+5BAw
	 dhmsV4nzjc/nBs88=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2c85d6a8-c9c19;
	Tue, 10 Nov 2026 15:31:43 +0800 (CST)
X-RM-TRANSID: 2ee56af2c85d6a8-c9c19
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af2c85c276-ac084;
	Tue, 10 Nov 2026 15:31:42 +0800 (CST)
X-RM-TRANSID: 2ee26af2c85c276-ac084
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	jan.kiszka@siemens.com,
	diogo.ivo@siemens.com,
	haokexin@gmail.com,
	horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in prueth_probe()
Date: Tue, 10 Nov 2026 15:31:38 +0800
Message-ID: <20261110150500.3142-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179429318364.488859.2256720144223130993@kernel.org>
References: <179429318364.488859.2256720144223130993@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_233148_624144_27EC282C 
X-CRM114-Status: GOOD (  11.52  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Please find below the additional information requested for this
series. The same information was provided for the v1 postings of
patches 1 and 2 here:

https://lore.kernel.org/netdev/20261109093000.54321-laixiangwu@cmss.chinamobile.com/
https://lore.kernel.org/netdev/20261109093500.54322-laixiangwu@cmss.chinamobile.com/

How the issues were discovered: manual code inspection of the error
paths in prueth_probe() while auditing both ICSSG drivers for
probe-time resource leaks. The port scan issues addressed by
patches 3 and 4 were found in the same audit; the use of the
uninitialized reg value was also raised during the review of v1.

Whether the issues were actually triggered: no, they are purely
theoretical, all of them require a malformed device tree:

- Patches 1 and 2: the leak triggers only when the "ti,mii-g-rt" or
  "ti,mii-rt" syscon regmap lookup fails, which does not happen on
  a valid DT. probe() then fails with -ENODEV and the references
  taken on eth0_node/eth1_node are leaked silently; there is no
  stack trace or error message pointing at the leak itself.

- Patches 3 and 4: the uninitialized reg value is only used when a
  port node has no reg property, and a reference is only leaked for
  port nodes with a reg value outside 0/1 or with a duplicate reg
  value. On a valid DT (one port with reg 0 and one with reg 1) the
  loop behaves as before, with identical reference accounting for
  the accepted ports.

Hardware the change was tested on: none, the series was not tested
on real hardware. Patches 1 and 2 only re-route two error branches
to the existing put_cores label, which is already exercised by the
other failure paths in the same function (e.g. prueth_get_cores()
failures). Patches 3 and 4 move of_node_get() from an unconditional
call on every port child to the assignment points, so for ports
that are accepted the reference accounting is unchanged, and the
new error path only releases references it has just taken.

Best regards,
Xiangwu Lai



