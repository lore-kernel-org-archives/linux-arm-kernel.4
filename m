Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F065606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SkYi+F34;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hP7rYJvk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xuExEJ56VvYhfQ8sUzmYzljLVVprjtHOk/85uTr1Cq4=; b=SkYi+F34SVP3cXDSe6CZetguLX
	PG1AqVGQ06l97KnWmJXayWbhwEB3E+QTWKqLdA6dbRNRVPGV27wUXnruVgZL7M25QIJ1Y/zFRTD78
	gmDN9iq/GtjvfCYQ4Yb8ZXbCD0ChKdXE1w3cPKa0niTQSxE4qj/MXskPgsVsxlaalnWqHFxwlruRD
	lYqN2q6j5agajhEFqKjZPhDum9mrxMPStBanQ4M6RT38xcelx8Ds2DSMkP3i28Cv7poYfqNiuLkV1
	tgW45+zx32afGJlK2u8CnWZy5B7sndYbLY0MK7Ph38LfMs8X1nn5dB1yzxLnWkxW3b0QOaLo0C48B
	F1fSOi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEz4-00000000blM-42ch;
	Sat, 28 Nov 2026 09:44:43 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEz0-00000000bkg-0KZw;
	Sat, 28 Nov 2026 09:44:39 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083c;
	Sat, 28 Nov 2026 17:44:34 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	eric@anholt.net,
	swarren@wwwdotorg.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] clk: bcm2835: Pair clock provider registration with removal
Date: Sat, 28 Nov 2026 17:44:33 +0800
Message-ID: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218acb9703a1kunm9e79d88e451fd1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEkZVkpCQx5OGkseQxkfSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=hP7rYJvk7lIikGfOic5yzMqo5ZstJP6qd2I5MVYwuNB0TJca6O2yczxAnyB09s31mXzazuqPj7zmA7HxvJXM7PGxm7H7VVMnXGxy27962KBnchcEozstLoNFNuJFQ9gTxFhMM5FtlnqFdEilT+flTeIAeAuBmFNjnWnCHC2F6HU=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=xuExEJ56VvYhfQ8sUzmYzljLVVprjtHOk/85uTr1Cq4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014438_489817_C9CF4CCD 
X-CRM114-Status: UNSURE (   1.00  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the OF clock providers on teardown in the BCM2835 and auxiliary
clock drivers.

Guangshuo Li (2):
  clk: bcm2835: aux: Fix potential use-after-free on unbind
  clk: bcm2835: Fix potential use-after-free on unbind

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9

