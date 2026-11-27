Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B92606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=maykjgBs;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=guYxVVeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vpyy6zemv+YuuqJrdJ4wj3yo8jYAVZ/C6m+mZJr7VhA=; b=maykjgBsRu7Osuv9MvywEZQkTl
	dPSDNEsuSuyL8WzIVGnnS0rCvNXkb6xh3uG3KFow/9MRdxpZXXQGiDB3zEDtwkVkn9gWkiU+qgHI6
	NvDHlgPIhm4MYkDZ5MioHLJtdpAz/z3X5w54CHfcdwGfebv1TvJnzXYa+gi7OffDXqwYJIyYsB41d
	fF1M9GpWKdvRUoMwqMmzD4YSHHwqTRTTY6TUyU3x8LgRmaFwIk9y3XAXl0AR3KscMjwE305sGFksa
	5xclYIp2sHeKhhBPNVd9tUOBQ7FfqOnfVSh3GBNID+BqqkWGSwDjWU1E0jQo/+wdLYkvdDv2Mv3hD
	O39imhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD1-0000000FpSQ-1rm7;
	Fri, 27 Nov 2026 11:33:43 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCp-0000000FpJT-3DQD;
	Fri, 27 Nov 2026 11:33:33 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56429982d;
	Fri, 27 Nov 2026 19:33:27 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: ulfh@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jianxin.pan@amlogic.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] pmdomain: amlogic: Add teardown for EE and secure power domains
Date: Fri, 27 Nov 2026 19:33:24 +0800
Message-Id: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc81fa103a2kunm351106c8395dd3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTh0YVk1MSR0ZTkxKTB5LGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=guYxVVeIdIVSPNNE9ee9t77nGKoQjgpSKtxeiWZUEWbsvqnjiaRShOPowLqtmWgsGJmwQWOf1ITb9gsRJcXzrkKvutoquuFRL8qFMt3Vk/kJeiYJLcohpyeSjsQm9zjrgJ6lDeXMioYpA4+JzidvwVqsBUaDm1W9TID+RIMuAMU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Vpyy6zemv+YuuqJrdJ4wj3yo8jYAVZ/C6m+mZJr7VhA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033332_058703_D1125A50 
X-CRM114-Status: UNSURE (   1.13  )
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

Unregister the domains published by the EE and secure power controllers
during removal.

Tian Xuechen (2):
  pmdomain: amlogic: Tear down EE domains and their OF provider
  pmdomain: amlogic: Tear down secure domains and their OF provider

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

