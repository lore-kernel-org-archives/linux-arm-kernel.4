Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90893606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uv/KTh1k;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=estJGjvd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=; b=Uv/KTh1kWSFCZcCFGXsjK43QKV
	7HfvpMYg2MO0JUwTqEhWnIR25/28KygcdfSZ2iuPz7lUpQQrrsHmiNjUxd74DhhF0L5PCWJ6aYkig
	4ctQChi71uIoscUtBFBGJdpq8JBLyHwgQGvZp6IqW275HpV/zkViQMdvlYNuOCJol+ORH/eN5Pnhz
	3rHFi/Ig0ywEGtAXT38naIY+/wxK+IsTrsXLCAfVZzqUvjazt3ATCVmUYv23roMU57BXhauaaxf6h
	xHfDdH4uWl+rT9q6nYmfztAHl1JJAaXO73271A1HrYpkK1aKhhL9CG65E+ZeyaqX41Y4IyUzx4DN9
	rIMOITHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEul-00000000ajH-48OA;
	Sat, 28 Nov 2026 09:40:16 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEuX-00000000afr-0BNM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:40:03 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07be;
	Sat, 28 Nov 2026 17:39:49 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi: Pair platform clock setup with teardown
Date: Sat, 28 Nov 2026 17:39:48 +0800
Message-ID: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22186745803a1kunme5eaf005451bd2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUtNVk4YSx5CT01NTUhIQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=estJGjvdx7tWrwRpDY019KZme+DGgJJykCc7EuYPTYdqsumxY6UeiOEraqZ/ik2029QDDcZnLPHNmrBMwCdYRnOaVwC5U59xjqKd0CsvKO/ESQWLMTzsec/rOHeqVO1cQhPFUZ1tJe7qa76v9eFlNidqut5hItEAq9MiwOcqEuw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014001_356795_A7AF1681 
X-CRM114-Status: UNSURE (   1.73  )
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

Handle platform teardown for the mod0 and APB0 clocks and the APB0 gates
provider.

Guangshuo Li (3):
  clk: sunxi: Release the platform mod0 clock before unmapping it
  clk: sunxi: Unregister the A31 and A23 APB0 platform clocks
  clk: sunxi: Fix potential use-after-free of APB0 provider data

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9

