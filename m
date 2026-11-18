Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33F60A2612
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JiA45cel;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MKJv5w91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QXGQAan1vXB8Fh8B+GZljg8cnXQfywe3VvHaZl4o6AU=; b=JiA45celk5bITT668eiZS0zrFj
	omv7Uw161W1YYnprOi8b44YBDG03hWv/sE0pxyN3/B4UPZhPC4FwwVuyGcmqzvbxPinGxBUxXuEuF
	H+IYH69+Vu/P+/72tRd+21FwdMnwLRK1ThFM8K9LIOkDIdnGw2m3QAPuaI8k4MEsByt9RMFNIMH8I
	+9ja6e++j1uJbn13vi3beDzkA1x+r6laNSzXrBu46VxNE5T65VJ6i5/6FKF2tDQIoMwK4lw0YDsG+
	/2qPA6VXnS0S+6Z3WjuBbni2vRsGeeDBM1j7RZcq2BxFVvKjDrFjlAQ50dbGeFwf/rLb+oc3cIhM9
	Bj8WGz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTU-00000009yo4-3kBS;
	Wed, 18 Nov 2026 18:33:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTR-00000009ynC-35l4;
	Wed, 18 Nov 2026 18:33:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 171181477;
	Wed, 18 Nov 2026 10:33:34 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194873F673;
	Wed, 18 Nov 2026 10:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026817; bh=WR2rfmU+q6aN9Sc0uR33u2REPze10bCVVyPGykSpRuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKJv5w91roEUBwvnm+nqtg4/Uu1cpaWyicW1JKpCPkMIIsqtBXgzcMGlaE/rYz5im
	 7tzt0239acWp0fzK/LkAFOX/K4cY+ognAqh4dUGLPi5T9qPfmpPOd0xzDeJoqoCjm+
	 g5JC9RJghc9HtSlxkncDtm/e1/luGkQNRiO5mx5c=
Date: Wed, 18 Nov 2026 18:33:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Cressey <ben@cressey.dev>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, kexec@lists.infradead.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Jeson Gao <jeson.gao@unisoc.com>
Subject: Re: [PATCH v2 2/2] arm64: hibernate: use a typed entry to drop
 __nocfi
Message-ID: <av3vfAK-XHNzRnFI@arm.com>
References: <20261111-arm64-kexec-nocfi-v2-0-ddf0c4aa326f@cressey.dev>
 <20261111-arm64-kexec-nocfi-v2-2-ddf0c4aa326f@cressey.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-arm64-kexec-nocfi-v2-2-ddf0c4aa326f@cressey.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103337_816427_7A4C71D3 
X-CRM114-Status: GOOD (  14.61  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:26:05PM -0800, Ben Cressey wrote:
> swsusp_arch_resume() calls the safe page's copy of
> swsusp_arch_suspend_exit() indirectly, without a kCFI check. The MMU is
> on at the call and TTBR0 maps only that page. The copy starts at the
> page's first byte, so the check's load of the type hash in front of it
> would fault. SYM_CODE_START() also gives the routine no hash.
> Commit e2f8216ca2d8 ("arm64: Set __nocfi on swsusp_arch_resume()")
> disabled the check "for now", since the entry had to be first
> in .hibernate_exit.text.
> 
> SYM_TYPED_FUNC_START() emits the hash inside that section, and
> create_safe_exec_page() already copies the whole section, at most 4 KiB,
> to the page's start, so the page holds both hash and entry. Relax the
> linker script's ASSERT, so the entry need only be in the section.
> 
> Fix by typing the routine, with a C prototype, entering the copy at the
> symbol's offset in the section, and dropping __nocfi.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Link: https://lore.kernel.org/linux-arm-kernel/arZSe8hNnRPM5FqY@J2N7QTR9R3.cambridge.arm.com/
> Signed-off-by: Ben Cressey <ben@cressey.dev>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

