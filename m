Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D69606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKZF77Dd;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gtV637yi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=02QniuZ8DQvIbgIq67SzSQoE/V2P85+ElmdDdal6/wA=; b=IKZF77Dd1NXp2X8JUcou7pajI+
	Wu/QZwZ1r4WPlmx75DmNKeHjTi+2Lr2JWRJO45bBVI+kSH4fEP86nHyYrZ78Xpz1UOH5Ux32pVhqt
	Z/jTllYOvZaeFs0kH633OH9yaVrGfB0pkQcTTppg8qIQYkKovV0DBkrphfgdCuOerzAkcSg//QW8X
	Ke6gMmQrCX+wOurPZgHJoo2Gkxc/+EbhQISrfi3HJnVOAi0ZpxYs3CsZkY+dnIYYoXwYVxyQz4BKj
	1T2bbPdc2DZrQbVJ/hv8zE5luw8dzx6BuAPIT2WphMMFKvCVC0jClsRdGnlyDQxX/gg0ihzqUyD8e
	S1HnP1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWT-0000000DLap-1HVS;
	Thu, 26 Nov 2026 13:28:25 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW4-0000000DLQp-453I;
	Thu, 26 Nov 2026 13:28:02 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcab;
	Thu, 26 Nov 2026 21:27:55 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: rafal@milecki.pl,
	florian.fainelli@broadcom.com,
	ulfh@kernel.org,
	noltari@gmail.com,
	alex.aring@gmail.com,
	eric@anholt.net,
	khilman@linaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/3] pmdomain: bcm: Unregister power domains on removal
Date: Thu, 26 Nov 2026 21:27:52 +0800
Message-Id: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180a92d003a2kunm345e734035d93b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUlNVhhITU9MGEwaGEhJH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=gtV637yi4/QRgcyBR74HfCYFQOwGhm6SKqyumxHEm0yN2rvlFviwESyNj5RvhTPK0IWRp4l1uI/nyi1mtrP57OaB/GHSb3CTa4DPI/03Jdt7V5N7L60FhzzLZbUqxtxkmwKC8nRY6GOnunFB/jE9bRS0NMPW2NrhJR847NID1Iw=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=02QniuZ8DQvIbgIq67SzSQoE/V2P85+ElmdDdal6/wA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052801_454838_03E0010A 
X-CRM114-Status: UNSURE (   2.37  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Tear down the registered power domains in the PMB, BCM63xx and Raspberry
Pi drivers.

Tian Xuechen (3):
  pmdomain: bcm: Unregister PMB power domains on unbind
  pmdomain: bcm: Unregister BCM63xx power domains on unbind
  pmdomain: bcm: Unregister Raspberry Pi power domains on unbind

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

