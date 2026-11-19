Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65F5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhnuAZZz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bnh+i/cr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EHxUC0X0axzUci22770M0FPdOltDMxUgbgGyif2X95U=; b=RhnuAZZzHRQbYy56PbaNZH+on+
	A+4N2cwUQZkLx/nDTBpLj2dOsmmmC3FPkseuLNu0q5W4iqQ2tfyc5ZK3ftOGcB3gamAwZjGGKj52W
	hKvnVU3DBQY7xVyQXRiqk3ZfypN4jZfVAuUp5hWBojwaWY0ihXP8By0qGzpA24lv9ph1i+u1iVxhQ
	svY6A7ZAu+jYHCCIHdq1vpjOVuGP8owRjnsqKgnp9OTPxtNRnOIqMZ3P1GZCvE6LCg86mO7WLaVWb
	aX11OoHPSXWxdDE0axLojS3kfRqdoC5yTofY2H0D3gFFBWfsChtJwWd4dufz1O7uqGB91nddDUwmo
	6uWoDp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzoj-0000000BcD7-0b2F;
	Thu, 19 Nov 2026 10:56:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzob-0000000Bc93-0svK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4F91575;
	Thu, 19 Nov 2026 02:56:23 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 385553F673;
	Thu, 19 Nov 2026 02:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795085786; bh=8mMBiVUHQUNmUsWa4GRGELUtK66iMuCNQuNUp+gE2Jk=;
	h=From:Subject:Date:To:Cc:From;
	b=bnh+i/crXyz857OVZWDdU8k1Px9zW+RwCWGJAcC15IK3Ewze6rKFV7UHLbVCfYCXa
	 8LSekMsVO2yQEzqDyLSg69jAGqnpOJ3NQPXZiChAdIeUEZsnjk+YmSMJfki/uuy2n1
	 SvaiR46FhlbDvHgYj6d7lKcj6QMyyKBoq+fraYRI=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH v3 0/2] Add test for atomic uaccess with permission overlay
Date: Thu, 19 Nov 2026 10:56:17 +0000
Message-Id: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02N0Q6CIBhGX6VxHQ3+TLGr3qO1JviTtCkOlNmc7
 x7YKi/P9p3zzcSjM+jJeTcTh8F4Y7sIx/2OqKbqHkhNHZkAg5ydgNHe4l2PA04UlRQKoMhFmZG
 47x1qM62t6+3DfpRPVEMKpEVj/GDdaz0LPO2+Xb7pBk4Z5XUFIpdClxIulWsPyrYkVQP8PM55u
 fUgepBlqqgY14UQf29ZljcDbbVu6gAAAA==
X-Change-ID: 20260520-poe_futex-ecb8c2276894
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085784; l=3089;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=8mMBiVUHQUNmUsWa4GRGELUtK66iMuCNQuNUp+gE2Jk=;
 b=FtLyKzSy/6NdvFtYzYrVdztOTG2veTYZlQI+xdApU7rFT+idmOzyk0miJr73lqXkDxTbtSDyk
 pA60T8lJtYNATfeeduuemH9m+OHChKJ8UiC3eFxVL9h3hThi6QbJJRW
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_025629_340837_0BB10DA3 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -4.4 (----)
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

POE is not currently enabled at EL1, but my series [1] protecting
page tables does exactly that, and it has revealed an interesting
issue.

Regular uaccess uses unprivileged loads/stores, which have overlays
applied and are checked against the user's POR_EL0 as intended (same
restrictions as when accessing memory from userspace). In some
cases, such as atomic operations when FEAT_LSUI isn't available, we
need to use privileged L/S with PAN disabled instead; overlays are
not applied in that case.

Once POE is enabled at EL1, we have to ensure that overlays are
still not applied to these accesses. Otherwise, they will be checked
against POR_EL1, which is completely invalid as kernel
pkeys/POIndices are unrelated to user pkeys.

If PIE is used, then we have to ensure that user memory types do not
have overlays applied in POR_EL1, as Sashiko reported [2] on an
earlier version of my series protecting page tables. Patch 1 tries
to preempt such errors by adding a comment. If PIE isn't available,
then... we're out of luck, as Sashiko reported later on [3]: we
cannot prevent overlays from being applied to user memory. We'll
most likely have to require PIE at least when POE is enabled at
EL1.

To avoid accidents in the future, patch 2 adds a kselftest to ensure
that atomic futex uaccess (which uses privileged loads/stores unless
FEAT_LSUI is available) does work on memory mapped with a
non-default pkey. 

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

[1] https://lore.kernel.org/r/20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com
[2] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3
[3] https://lore.kernel.org/r/sashiko-outbox-207324@kernel.org

---
v2..v3:

* Patch 2: free memory/pkey at the end of the test [Mark B]
* Added Yeoreum's R-b (thanks!)

v1..v2:

* Reworded the cover letter and the commit message of patch 2 in
  light of Sashiko's new findings (when PIE isn't available).
* Rebased on v7.4-rc3

v1: https://lore.kernel.org/all/20260521-poe_futex-v1-0-1da286b8f9b2@arm.com/

---
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Kevin Brodsky (2):
      arm64: mm: Add note about overlays in PIE_EL1
      kselftest/arm64: Add test for atomic futex uaccess with POE

 arch/arm64/include/asm/pgtable-prot.h         |  7 +++
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 70 +++++++++++++++++++++++++++
 5 files changed, 86 insertions(+), 1 deletion(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260520-poe_futex-ecb8c2276894


