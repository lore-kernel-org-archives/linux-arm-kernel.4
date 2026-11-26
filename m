Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgwezpsg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lu5JrHAc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Oo9+vrYhAJWcCP9yTjV9mqNzkHZ2WVXfX/Ghz4OifHY=; b=cgwezpsgdtwnsyHqbu3zGZti3x
	Pfwd7//HP964kNK2kOqMox6eVh3hldaYfedFrCGfNmflG/NLWXIagZx0g88eB4bvqiAzH2JSiGWmX
	ZlDDONz03JQS5cpBfDcEnj/GQAJOoVsXKVyMTE6vfiuBGkQfa7oF3RcTGEu45yuyhqhbq+StyWSQK
	5Jx6NoeGfhWbobqI6ab34Csfj68D8XbqL/0EBdjtxR3frWoMwo8+Bi4ANuKpg06aw+sKPJt/eCFpp
	d/nDlXg2QG7fywpFXs4o6vjCjZImnA0qK/Qb9uOcJ9BLNfqKLt699bsHZsHTBhZg3DwY3lSqdvB08
	a+xqF2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfOj-0000000ENRo-009n;
	Thu, 26 Nov 2026 19:44:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfOh-0000000ENRV-35S5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:44:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F156261836;
	Thu, 26 Nov 2026 19:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964391F000C0;
	Thu, 26 Nov 2026 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722286;
	bh=Oo9+vrYhAJWcCP9yTjV9mqNzkHZ2WVXfX/Ghz4OifHY=;
	h=From:To:Cc:Subject:Date;
	b=lu5JrHAcqLjCYmqJ20tk1pnHtdSHfqZ9uMPiI2EfFJ6SDRi99vzBf2PiuiIu7owRZ
	 3bMuk6sPZgjzpHnyUsQgeRENnPfVjHd3oDp5Ce2G0X9dnH4LYYHAh1HLLwJ5wm/uMk
	 N8hIdkrEaGjZHdBP8HKLAiaqYqDjbCDo4MNtWT/9YISxz4J1fJ4K/GOhQh7SK0t2G5
	 /pm03RVfH55UpDbjXFB6+M8U9zI07QJF8zoPReso5C6wpAM/bguhiilcDk+aBD+XsI
	 mvJADiSX0Zdh4wqIXTr2gVJuzxhNSLXUZtqoj9EeklYfTmWOmZvS3PxQsvLb0fXlae
	 pVdpL61XIPXzw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.4
Date: Thu, 26 Nov 2026 20:44:41 +0100
Message-ID: <20261126194442.8026-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.4

for you to fetch changes up to 60521e4ff9e7f1b41758f387842d73667a7f0410:

  clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs (2026-11-07 18:13:36 -0600)

----------------------------------------------------------------
Qualcomm clock fixes for v7.4

Fix Glymur GCC power domain handling for PCIe and USB.

- Use collapse voting for PCIe and PCIe PHY power domains shared with
  other masters, including domains enabled by boot firmware.
- Retain USB and USB PHY power domains to preserve configuration and
  fix USB host controller resume from suspend.

----------------------------------------------------------------
Jagadeesh Kona (1):
      clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs

Taniya Das (1):
      clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs

 drivers/clk/qcom/gcc-glymur.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

