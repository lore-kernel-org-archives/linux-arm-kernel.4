Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZoX+jtjs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DZS77L59Ek2ViaC60oqLxuW4xt6QbgAdQEKfk+T5Eaw=; b=ZoX+jtjsDZTMexfIRsq/D4qs2/
	zpBceESGbp/BSgxfij6f/3zTt67qSeoC3L5VLG3bZ1SwttkACad2wZKYcZAOgsZiMwwRxsCfY6ZbR
	/Y75Um7//12gMPzP3CA2HpzYnwHQLVrzdYPOPcczvOehRjm9zEItZfB+llAv5AgypNjyiTzxM2a6R
	oJaA7eXH6vTrwVpcJkXBYHvvGgOGfYEtOzWQwW/cncyLpDoAaEuYrRQoXonjbX/v6RB2Z7cs3/N/Y
	1U3gHmazG9n0Ni/BNHb3n4VJBmg9ZXCBYWF2iePRmFi4EGwgRWlD/xv/qXUMmH1bJHubxZxxfRoJT
	kuvQc3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOfD-0000000F5zV-0WuH;
	Fri, 20 Nov 2026 13:28:27 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOf8-0000000F5yW-2sVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:28:25 +0000
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B8517BCF4E;
	Fri, 20 Nov 2026 14:28:18 +0100 (CET)
From: tumic@gpxsee.org
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 0/1] i2c: xiic: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 14:27:30 +0100
Message-ID: <20261120132731.9920-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_052822_899024_10C2E539 
X-CRM114-Status: UNSURE (   4.96  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Changes in v2:
- Fixed copy&paste error in the commit message (XDMA -> xiic).

Martin Tůma (1):
  i2c: xiic: Fix broken PM suspend/resume

 drivers/i2c/busses/i2c-xiic.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1


