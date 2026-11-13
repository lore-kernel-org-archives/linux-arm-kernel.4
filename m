Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EVN7P6x0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqepA2xz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hGCfbyCJsatkOZcGyPvaz22z0CZVHI0yVRmeT7Qfv/0=; b=EVN7P6x0paH0mJ/IafbjqAU6kL
	FA6hq7c/D0UBwzbjviCf0sjRNqTKd660WFZ18nv+WLkYQ7RNW1bZQUxgx3E0jBxoSD8cqLvN1uQKV
	STijJAlcXsZWtlkL0MIvwnwI2GcJ6I0YAAsSZAo8dXBO3e/9Brq/vYPaHhPkWqZrq2PhzfTKBxu0N
	HrT503VI6h5zCaQZ3azhyGzSZCQ3WMDddIOoSrAK1qq4v3D2UGcJJPizCznRjc6kPLd3N3w3rpnBK
	dv/QHR189k5GSMG1PzZtX4V0iGYHhfRBMjArudKCewU2bhpMf2ogBNjS9FWAC2Rxd0i2TbXZrJuxQ
	a44Pewww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlYO-0000000BsR7-49Fe;
	Fri, 13 Nov 2026 07:18:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlYN-0000000BsPe-2BK7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:18:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0157408D7;
	Fri, 13 Nov 2026 07:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8648D1F000C6;
	Fri, 13 Nov 2026 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794554310;
	bh=hGCfbyCJsatkOZcGyPvaz22z0CZVHI0yVRmeT7Qfv/0=;
	h=From:To:Cc:Subject:Date;
	b=VqepA2xz0eaGF4+ni23s0aMGQdeIqpeCt8t8EIaAE//wNxgHc996tFmoDFJUsARWT
	 GzdOPDG/BdruxK0YOfMj4eQ56a9lCF+VAeD7mw7xx3rXgJmHfexzBDy5LB86QB16Xl
	 eIQrEJ2RurtWs2WKush7eRFxjeGazR7cax7rjLkpx9OML3Ot5rxBrKpOTh3rD696yp
	 p+SV5tEHrZxgNXvnv1S/VoCozF475SjRmTR7QU+M9LuP4AaDxJPg6lYu9P1lt/ghlE
	 nq/+YzbHi4zASXTv34M9wpvmclLJTjY2EhferYGFweAgMR8igiPnGU/RKxn1D4982T
	 vWpOJjdSjMsHA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: fixes for v7.4
Date: Fri, 13 Nov 2026 08:18:18 +0100
Message-ID: <20261113071818.14923-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=krzk@kernel.org; h=from:subject; bh=QbdDdxnPdZV3D1DrHdQyyiRI9zlwNeF0YbmXq17qR/s=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9rm645q+UnPMfPgsn7fdEiEBwkwRsQErpRJbw 7KTwI0QBeuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCava5ugAKCRDBN2bmhouD 1yZ0EACZ5XXxrXy3WArKICb+kjvjDZjd4C0yMcueBsvZoWd9G0blpYbagdLcuk3q8GDrBVE8DiN Z8rtfJyJraVWhqCrbfGj6HBGdlveDfj57+KRfoRYqWEEuohGk03m4HXLSX1TlbZGfqSJoj17Sbt UtCYxVkJFv9hjs6P/B4+1tGJ5UhBPHu/4RdYBKDgqW5nECPQHC6sSbom98PdFhFkvNPaOcppBp8 gdmRrZNBIMay10d2YfHXVaqI3uQ9cKMtVZtzpeVV/7/g3lhb+YUwb6L3n+acE/afzfUBJql8b42 XjyJT4+Li6RowkXQvQflfHShqLeLa/G/RTtm3rLZbFyqLRDQlnk8xy4CDXAhUC3nINcLBtCpm6V RNlQPuNW0tng1PlotrpVQiXzwguafCQQAjKQ3u9k4v67vm2ZHGS+DF/jmUt7SKzpCVd1o6RfFfF Njhdr+mxk3CI8heQV4NiX6Zttm6DWqGVgMvZOY0i0bAwNjRRxyAGlQi2cZAdZ8z/jxJ+cJF0KPp Pibm7Mz9J5LY1ge/TGY0ONUCLRErpIaHoruNePPMWEtYABohy67xw7mZSSrTZevyBM61eqIO3RJ 7TUPZeBLCQ5omARFwnf5HRb1Dwn+J1YtZfzPuQGJpZzCyrt+p/RMYmt/oJbSFbM/oMF0JfsHvMo r9RouQfIELHujVQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.4

for you to fetch changes up to 5fbe2d229bd3738ed63c7c9177466ad6bc130f18:

  clk: samsung: exynos5-subcmu: Defer probe until power domains are available (2026-11-02 13:24:59 +0100)

----------------------------------------------------------------
Samsung clock drivers fixes for v7.4

1. Properly handle deferred probe of the Exynos AudioSubsystem clock
   controller.
2. Fix integration of clock controller and power domains on Exynos5250
   and Exynos5420: be sure device runtime resumed before proceeding with
   probe and defer probe till the power domain is available.

----------------------------------------------------------------
Marek Szyprowski (3):
      clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
      clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
      clk: samsung: exynos5-subcmu: Defer probe until power domains are available

 drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++++++++---------
 drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 13 deletions(-)

