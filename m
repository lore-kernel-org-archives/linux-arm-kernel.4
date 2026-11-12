Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FC606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZxIdCAwh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S/ivFwGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BJFoLHA4CokahnP1ZRy2zdB1+C1TptbdFuQdPlx33CA=; b=ZxIdCAwhuxau20oGhaACHQPLKY
	CeLEFoAyZ3mqIkaatpsFc8hWN5q1aH4Bst8f+Mr/v/rlNqin8GUtDE1CBDK0N8Ztuw3bwrJBibqVn
	iCvzQd+nCjsVMDVhZXzBga1yrac8vOYTFWWuQVSCMFQvJDg6BEMgH/Ik4+XByW1lfSL9bNYBkGWMh
	7cGzkAmiu4lSszydRrSVr4MLSp1GQoBbMOteYr15TUbHguM9EUHJoUZ8jQc9umPL7dtkMVl7pIql+
	pw/E4WP6sU8Y+NKT2un0wWhS270mWfcjRWVMjQAuQw3Hxn+7+1M6MycrkAHiCITZ2p13qTtmfI2Jd
	NCUhyP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaZu-0000000AxIV-1RvL;
	Thu, 12 Nov 2026 19:35:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaZt-0000000AxIN-10CX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E76741703;
	Thu, 12 Nov 2026 19:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A011C1F000C5;
	Thu, 12 Nov 2026 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794512120;
	bh=BJFoLHA4CokahnP1ZRy2zdB1+C1TptbdFuQdPlx33CA=;
	h=From:To:Cc:Subject:Date;
	b=S/ivFwGCvrQwoCF1l3EFepxp5IsPdDQ0nL5W3SpTiQqio+nzAehtzLdf8AE6T9pTU
	 0rCJHppqMI22GrL8UXG85Hw+qvSo5XBaUUmw7k3aeLTB2GW7Wx/7v6kggO3WWBj72d
	 eQ0NNo/kJjqVA32w8yqtuEUcTfpu00u2fKC2o6mJ9UQTrG8emGvpTPc3BP+sjeVrky
	 Ao1NNI8JCf05K/gpSEk92jN2m9SDAhvIvt+m5emp8okoZcrwOqaWZuCi/lLCBnXAjL
	 yYVP7pEX1Bg3nvRhBBbpPo6WiWzkvJPNdaDOQ76SwStlRMd7bZhCDfcJB5rzO8oOF2
	 YeHpeeTy2NQoQ==
From: Thorsten Blum <blum@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: paravirt: Mark steal_acc as __initdata
Date: Thu, 12 Nov 2026 20:35:14 +0100
Message-ID: <20261112193513.2655-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; i=blum@kernel.org; h=from:subject; bh=Ze87YzqDESuyh+YjCvx6KrexS5wUkfEUNws1BC34Irg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnfRD5e+LD+3IpPE8L37v9eWh/LcqGlurqM59TLtJj9J T5vONYc6ShlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJKEox/DMrdP+7kNdSksnf 97Dl9dSV/74/Kj5RL/OG+YPEgoUXL8Yy/E/7eaHwpPGKyM2r5zjqvbhZx5jydP6ntteZkkZ1ek7 Xv/MBAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

steal_acc is only written by parse_no_stealacc() and read by
pv_time_init(), both of which are __init functions.

Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 30bf61d031eb..ef77fcab7f61 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -31,7 +31,7 @@ struct pv_time_stolen_time_region {
 
 static DEFINE_PER_CPU(struct pv_time_stolen_time_region, stolen_time_region);
 
-static bool steal_acc = true;
+static bool steal_acc __initdata = true;
 static int __init parse_no_stealacc(char *arg)
 {
 	steal_acc = false;

