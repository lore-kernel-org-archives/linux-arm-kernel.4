Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F19606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3sprbAK;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gZjZ9faR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fs7O+eNvSRnORnlfh+nW6WQaWDaKnXDIBeTMvJDr2Ik=; b=S3sprbAKuS4hZ/7d4YGu88mTQa
	b8oAy4pa2D33IS7CUJl4Jr6qe7PBloYnJXbYSuzJz4I356x/MUgSR40dh3I2sTxnRyxxzGveygdPQ
	XfUZLlR4UeYd6fAT0yrf2HHbQuQ79KhOjGOi5quvTgohEeKPtkZLlcTokpOPh3yJfhULU3XBA4LGF
	Hwxt8vixO0aRMVl8PkmVC6Oi2DzryI5GdTIvKxHbuCieZaQ8eutYlUo8kbz3ujX0uOVr+lkPGMwyh
	O4G0vsl6T9vAogAqS7V4Lph8+/Tq6PREhLIh1Ld+Jl36HNBLiVmaPVA8q8Kow4/GAnq1wrh/xsupi
	CKIeb+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF03-00000000bzf-404y;
	Sat, 28 Nov 2026 09:45:44 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEzz-00000000byl-09DW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:45:42 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0882;
	Sat, 28 Nov 2026 17:45:35 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] clk: imx: Manage OF clock provider lifetimes
Date: Sat, 28 Nov 2026 17:45:34 +0800
Message-ID: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218bba9c03a1kunmf5913c094520b8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEtOVk1DGEMYTElMQx8dGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gZjZ9faR9SR3yMhZ9o+qYHpO6PHRjODg8jF6LlU6VPed+GNNstr8SbKKn3IEFYjlK1JPYd/FK8wG0n7BshZBmX9ceRsl1XplkJVRoT2EmDWFWtDyQXeq2TZ97xPUY8Q10zhPKpd6rqlDwdzVbCKKC0Bu7GUIbnkt8kTPRwVn+1w=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=Fs7O+eNvSRnORnlfh+nW6WQaWDaKnXDIBeTMvJDr2Ik=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014541_470384_BC633908 
X-CRM114-Status: UNSURE (   1.28  )
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

Pair provider registration with teardown in the i.MX8M, i.MX93 and i.MX
RT1050 clock drivers.

Guangshuo Li (2):
  clk: imx: Manage the OF clock providers for i.MX8M and i.MX93
  clk: imxrt1050: Fix potential use-after-free on unbind

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9

