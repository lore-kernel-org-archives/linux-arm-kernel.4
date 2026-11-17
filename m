Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90925606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m23XgAjD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e5akOanX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W1XUrXb0Axy6Uwz0DDSqe48SEQbs+/1sUxhzTtuVo/k=; b=m23XgAjDhWeX56U309o/BENIkf
	YgcFdz6ewckIO6Ir5gv4/V0Kchzqh4JqueoPcFSpp7XkR9j4kVEdX49YAi7/k4J43otTp7yKtcvgK
	4vLw3CCxUcYDKZ1gvBhdS9tFnO8EI1jjp5hAtDxTOx7gdNk4upFNLNsKFaqEo10C6lb1UTlZb9n+F
	cbsTRxt7vYs35CiJKakrlwLD8gUxnLCa+fFjzG0xSvwlsX/qG7zGD7rxNsq6YFJSYWIQTbxdSR2JN
	K9uHFfzdLrAxO0P5SZeGZEYYDYv26hLl3/ICe0vJE1xBBMT0XCKJPsIJV2fIUxGQcRG/YudL1Wwz5
	+KNrsiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNIC-00000006gQV-2hC7;
	Tue, 17 Nov 2026 17:48:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNIA-00000006gP6-20TK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E581A00;
	Tue, 17 Nov 2026 09:48:20 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 599043F632;
	Tue, 17 Nov 2026 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794937703; bh=DW3UobvvF0aF2F6eNdFyHOGPEMTX8V9/vx7ipryBXiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=e5akOanXACtuTU4lhmdefCKfJWb1oSpNYfwd/eLcypSPjyRuUq3xdLIyUOON14LrZ
	 Kb/wJFKqw6Rz2pK2b+M5ZRLWC/OdZGewgx9kG/6qQkV4DkHnOl9QO++Yns6xyyvGTw
	 NgbydoI9pYvn4YRtXOwFIYTljtdAlLdzzmseGUm0=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 0/3] arm64: sdei: fix entry edge cases, pseudo-NMI
Date: Tue, 17 Nov 2026 17:48:11 +0000
Message-ID: <20261117174814.95936-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094826_556096_40CB1D0E 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

As discussed in [0], SDEI entry has a number of remaining issues.
This small series aims to fix the biggest potential issues :
 - Patch 1 : with KVM in VHE, VBAR_EL1 might not be correct
 - Patch 2 : PMR was not handled at all when using pseudo-NMI
 - Patch 3 : very early SDEI interrupt might end up with `current == NULL`

I have booted the patches, but I don't have an SDEI test setup yet,
so I would really appreciate real-world testing that nothing breaks while
I set up something, /especially/ with `CONFIG_ARM64_PSEUDO_NMI=y` and
`irqchip.gicv3_pseudo_nmi=1` given the new PMR handling !


Contrary to what I said in [0], patch 1 and 2 fix things in C rather than
in entry.S. SDEI is already a special case and very edge-case-y, so
as we cannot really hope to share code with the regular entry path,
we might as well handle the edge cases that we can in C.

I think everything should be easily backportable if needed, though patch 3
depends on commit 3d8c1a013d78 ("arm64: smp: initialize cpu offset
earlier") which I don't think is in the 5.10 tree.


There are a couple of possible un-addressed issues still:
 - SWPAN is not handled on SDEI entry, but users of both SDEI and SWPAN
   are quite unlikely. Given that SDEI can interrupt anything at any time,
   and SWPAN is already very fiddly because of non-atomic register
   accesses, we might disallow the combination if it causes issues ;
 - Pointer Authentication is not handled either, but is not covered here as
   it does not present an immediate functionnal issue.


Thanks in advance
Ada

Based on v7.4-rc3
[0]: https://lore.kernel.org/r/20261105120835.3321912-1-kirill@shutemov.name 

Ada Couprie Diaz (3):
  arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
  arm64: entry: sdei: save and restore PMR for pseudo-NMI
  arm64: head: set __entry_task along with task setup

 arch/arm64/kernel/entry-common.c | 40 ++++++++++++++++++++++----------
 arch/arm64/kernel/head.S         |  3 +++
 arch/arm64/kernel/process.c      |  3 ---
 3 files changed, 31 insertions(+), 15 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


