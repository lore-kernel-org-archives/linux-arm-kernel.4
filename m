Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M7PJcYVl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KlUZ8iOXpvQJNsc9I3ifS0i47syyb6w4JS8lphnBwTU=; b=M7PJcYVlFgCrS++G9RKt8z4CbV
	h6/pQclnV7gQq9ZYlSLM77K/5sXrc1q9QIsFt7VMm5DmB7/Fh8+Inhy/KmV9gn8qRJhAhTXKAcz6a
	mM5OZn4rRxh7U5/cdMKHYLpDz8m2CqKTLJOYdPJUb/izcsz6PNKOR0yzwMHJGga2wYZc/ZjEU5qBp
	C7tvY1gQ0XWosyPTko2vO9aDOPFJ+c3+Luza5z1e/Mx21Q8WrLkvHedHI/vlfSOyqW03cUjOuxV+e
	EMHAz/pRXfYE9WqwVi55/qrar08Jm3BKtwxd3JXR0uTOKDZiqaq3SVWQ7gfrGpkdVJ+SrktEFIdGF
	neUbrDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZJ-0000000C27F-0ZmZ;
	Thu, 26 Nov 2026 03:54:45 +0000
Received: from out28-1.mail.aliyun.com ([115.124.28.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZ5-0000000C22z-1cJm;
	Thu, 26 Nov 2026 03:54:34 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1034225|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00381075-0.000424786-0.995764;FP=17238604813167455461|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033065158064;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kASpfN5_1795665263;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.kASpfN5_1795665263 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 11:54:24 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: rp1: fix RT sleep and clean up map freeing
Date: Thu, 26 Nov 2026 03:54:18 +0000
Message-Id: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_195431_591688_07941C6B 
X-CRM114-Status: GOOD (  10.55  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series contains two independent changes to the RP1 pinctrl driver:
a fix for a real PREEMPT_RT bug, and a cleanup that removes duplicated
code and a small leak.  They do not depend on each other.

Patch 1 makes the gpio regmap use a raw spinlock.  The gpio irq_chip
callbacks run in atomic context -- irq_set_type() is called with the irq
descriptor's raw spinlock held, and the driver itself disables
preemption and interrupts while touching the registers.  On PREEMPT_RT
the gpio regmap uses the default spinlock_t, which becomes a sleepable
rt_spin_lock, so writing a register field from that context sleeps and
triggers "sleeping function called from invalid context".  This is
reachable from ordinary userspace: requesting a GPIO line with an edge
trigger through the GPIO cdev ioctl ends up in irq_set_type(), so any
application using edge-detected GPIO lines hits it.  Other pinctrl
drivers have already adopted the same fix, e.g. armada-37xx.

Patch 2 replaces the open-coded dt_free_map callback with the core
pinctrl_utils_free_map() helper.  The local copy only frees config
arrays of CONFIGS_PIN maps, but the driver may also produce CONFIGS_GROUP
maps through the generic pinconf DT parser; their config arrays would be
leaked.  The core helper handles both types and removes the duplicate
code.

The RT bug was reproduced on a Raspberry Pi 5 with a PREEMPT_RT kernel
by requesting an edge-triggered GPIO line from userspace.  A full read
of the pinctrl debugfs "pins" file (all 54 pins) produces no warnings.

This patch was initially drafted with AI assistance and has been
reviewed and modified by me.

Xiaolei Wang (2):
  pinctrl: rp1: use raw spinlock for gpio regmap
  pinctrl: rp1: use pinctrl_utils_free_map() for map cleanup

 drivers/pinctrl/pinctrl-rp1.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

-- 
2.34.1


