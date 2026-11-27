Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE9E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g6EqNoAi;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=amaoRmQm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CiPchp7Zot0ITrMRYUd3u5Ovf4akoG8PMlDnhUlKbaM=; b=g6EqNoAiK8LLbS8ogxtTGaMCs1
	CxovTddWDxGuj0I8Wke3GvTDyWZ3mS8jr41B/Bc2amNi1DmE14nmbi5ECIhpuQhU/L5MRYqq/YAVt
	h1LD5GX5ITdnfPl4dwwGHpojKwInb6gztjViZsoiSGIdltzEFgEbIK8dAgqqepeQ4WHtYyORDVBnw
	RHs3Une6rx3OuGhhBf1wzkiOF4RrLEwhJo5ZN23pkgQxMNKmEUemTLpspcHOA7go7on2S3e81IdiI
	Nxdb+xMpkvP72PbaqUBKLKPMPX7qr99ZRBuG4mUa8I+Vih3jmieKJs/3IU/B08zSPQOp9pLiv96+4
	neDlEVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD0-0000000FpRY-49hc;
	Fri, 27 Nov 2026 11:33:42 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCo-0000000FpIx-0o7r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:33 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299829;
	Fri, 27 Nov 2026 19:33:23 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	t.figa@samsung.com,
	kgene.kim@samsung.com
Cc: alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/2] cpufreq: Add remove callbacks for s5pv210 and SPEAr
Date: Fri, 27 Nov 2026 19:33:20 +0800
Message-Id: <20261127113322.390337-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc811fa03a2kunm5097e7d4395dc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUJLVk1MQxoaSxlIQklPT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=amaoRmQmmCoIgf8PwX4NRM/TuCbGLYLESirT/4+RkH0rgobQYf8CJskSQJRd0Sgad6sW9zFf/vepKXUBfmQvhk5Yr/squLa2rmwUZj80Ro7Y+xH647rm2t3XrGiesRwWrWa93VYVZmimUpsdh3dCqGbUTdJau1hPFgSovBO07DI=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=CiPchp7Zot0ITrMRYUd3u5Ovf4akoG8PMlDnhUlKbaM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033330_480631_B73B0016 
X-CRM114-Status: UNSURE (   3.85  )
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

Unregister the cpufreq driver when the S5PV210 and SPEAr platform
devices are removed.

Tian Xuechen (2):
  cpufreq: s5pv210: Add teardown and unwind probe failures
  cpufreq: spear: Add a platform remove callback

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

