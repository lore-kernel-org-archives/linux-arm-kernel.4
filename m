Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjEu8uJ0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrpxnUKZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YFZRmCfQkWp9l98IMbH5VkBf2tDBMZN1QOvzm/n0/Ek=; b=rjEu8uJ0PXXoO0RubDD6ORLF9n
	i99ItiwcsAjIQ64bcCFtlKxgAHL6RcIbqx/6FY6+UhKrTLJ3vvUcitmOfWs0nGbDaiJHZBOGDfs1C
	NYuBrvOcL80JPO0TqZrAkzTI9M6sd4OnxGTtBoYH0tN9VfCDW1t/JY6ntecDlTIF+US5jWIfECWO5
	gw/0UsqGdMRnQ8YagHNbI8acVOdoGpXGUlg27Hktbw4wvLRAAPMh43ZPTd7Ba/tiYOrE8Zy5BzEz8
	eWIDpqS5P+CNgI4XUFF7SyVKoAWrHoSx8CjSyMnB4g5FHYbGyvnD6fu/vdOq9Ok2NMkhfXK3LS3bb
	ipcc9TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPavw-0000000EKJ6-2ZI8;
	Sat, 07 Nov 2026 07:33:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPavu-0000000EKJ0-3uoW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 07:33:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1226460A50;
	Sat,  7 Nov 2026 07:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E091B1F0089F;
	Sat,  7 Nov 2026 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036829;
	bh=YFZRmCfQkWp9l98IMbH5VkBf2tDBMZN1QOvzm/n0/Ek=;
	h=From:To:Cc:Subject:Date;
	b=OrpxnUKZ9n9S2pN6xJmZV65t8uBDUFiJ4lH0YwEi2xm3FWo8q+0fcd+4HzXfczeoP
	 2uutuIREt3xoDSKJzOlrSJu2lZNdHg7uOQlMwzXOFkADgWCq3QCYGpCzHN2kNIAwdC
	 15u3DioQMCR41YjiXY/FKcKdcshWKH6myFG2ziGYD4OadAFCOyPVBCA6eYv21eZrPw
	 NMCP+FELW1efVOmW2gvhmW9pzkxozKYI6mjYSWgJkyJAcOXdNBt/s/cRPEl6TnKiib
	 k1lqCbtLnrA7K4/gdFk1diN7VwBaFIp70t3VuFWeikG5C6o8kHcvRhPIGU7hgoHNEQ
	 yFnbSQmlKpCqg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH 0/4] arm64: Fix instrumentation escapes from noinstr path
Date: Sat,  7 Nov 2026 15:13:35 +0800
Message-ID: <20261107071339.17467-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Code marked with noinstr can only safely call other noinstr or
__always_inline functions. When reading arm64 source code, I found
necessary noinstr markers is missing somewhere. So I asked AI to scan
the arm64, this series is the result.

Jisheng Zhang (4):
  arm64: percpu: Always inline helpers used by noinstr code
  arm64: entry: Always inline helpers used by non-instrumentable paths
  arm64: stacktrace: Always inline internal stack boundary helpers
  arm64: alternatives: Make branch and ADRP offset helpers noinst

 arch/arm64/include/asm/cpufeature.h        |  8 +--
 arch/arm64/include/asm/entry-common.h      |  2 +-
 arch/arm64/include/asm/fpsimd.h            |  4 +-
 arch/arm64/include/asm/mte-kasan.h         |  4 +-
 arch/arm64/include/asm/mte.h               |  6 +--
 arch/arm64/include/asm/percpu.h            |  6 +--
 arch/arm64/include/asm/stacktrace.h        | 16 +++---
 arch/arm64/include/asm/stacktrace/common.h | 12 ++---
 arch/arm64/lib/insn.c                      | 57 ++++++++++++++--------
 9 files changed, 66 insertions(+), 49 deletions(-)

-- 
2.55.0


