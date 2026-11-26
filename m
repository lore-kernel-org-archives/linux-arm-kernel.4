Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ckoJgdkr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orKEvC1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=; b=ckoJgdkrhN/Orw4mzyclzHhe1f
	MU8KOvfgP2/J6omQK2DME7pLSL8uwSdwRcWN6VjeEV/lty4v2gV93GQPXuH3KkovbhC3Z7Hr2X2tW
	inrY+huceg75o+s5D39jGwpxr6OI8hiH64SXVE2kn8T+x1BK5oDgsDq5p1GFWa6e6UxAIvU2qzdaE
	lzEBgT4m9h2/KUO23uEADDLnasc+Q4IJms70OJrRSDyLI/0DIj6sMzKnU7v8837FjwVXctPapzqjz
	j6OqIMuhGnaeP/nOcUPXApzfbzgTpHFfJUjO8F85OJt89/VjoBU8NDpzEOjb1v4uapB4mez0MfZdV
	ad1wj2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf4M-0000000EHsN-1vys;
	Thu, 26 Nov 2026 19:23:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf4L-0000000EHsB-3BQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA4B060CD2;
	Thu, 26 Nov 2026 19:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9651F000C6;
	Thu, 26 Nov 2026 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721023;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=;
	h=From:To:Cc:Subject:Date;
	b=orKEvC1YnJYVi5pt1voRgoQIgurMzCM8UYYY72SjMwF0NLOnOPV7VMvbtfLek1gc+
	 1Epw3FEtta0CvwVsOXfruqpdrfTWkuzcA2K+jn3sORRnbXxOT+m56nIbgO7l+HaL44
	 57Q+hTbt1CssD1veNwnsjTksNrJdrZSp4Y5BTTXVTwIJJypHhZpwayTzCHu0CjiwmF
	 P785mRWLpzHMLmIb3QNzA6Y+281PQVTe0e2u/FwnQLs90PCB4iWNsLfhwyxw+ELTXZ
	 BrPsuBrmVjEiWvxhf1fBhUIpAZB6cwyFkFYg+z9JV6H5417l/P2NdY147flg2obO+a
	 TerWkHeQQX28w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.4
Date: Thu, 26 Nov 2026 20:23:33 +0100
Message-ID: <20261126192334.5073-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.4

for you to fetch changes up to c44eef6401b625f292f51e854e5a829e2e6748e1:

  firmware: qcom: pas_tee: handle a NULL resource table (2026-11-07 21:28:49 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v7.4

Fix a NULL resource table dereference in the PAS TEE service when
restarting a remote processor whose firmware has no resource table.

Correct the RPMh RSC read request length for version 4.5 and newer,
while retaining the existing length for writes and older hardware.

----------------------------------------------------------------
Jorge Ramirez-Ortiz (1):
      firmware: qcom: pas_tee: handle a NULL resource table

Maulik Shah (1):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request

 drivers/firmware/qcom/qcom_pas_tee.c |  5 ++++-
 drivers/soc/qcom/rpmh-rsc.c          | 14 +++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

