Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A0606D846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GVlD/yOt;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TxPzXIU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/vEQn84gAZPrHx4pAFpxWuvDduXv3rV+YnfJj0Im7Us=; b=GVlD/yOt9magCj
	bslVoo8dRJhQwJl62jB6wF3qvs9XPhIsFSqyMVB+Dvt48dgelo6PsyYtgNxo1Ypj9+xMn2Q1Ur/H7
	eNcG/R1JeAS9jLhKRZoRh+sRYh/n0ThuBbstUGuXR2t+TlEFMIg+ebkBqw9Zz5+BXjSlsROdNcjgU
	eTsRMwJsEP7QuWnIfBjWXBtOq5y95Q66+6U4UzB3cbwZejX1CNK4TY/nrnu7gQ6OBBldRKVTECbgb
	p5mRwhhZ1CD7454mtZBkh/6VbsWSnl+apKJdUv2kiKreRZ2b0by/XXEC/d9cZ7OJ6BYRBheMBA7xf
	t7c284VR8AJuSWlslKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvEO-0000000DlKP-2g3r;
	Fri, 13 Nov 2026 17:38:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvEM-0000000DlIT-1y1N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:38:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A50143D;
	Fri, 13 Nov 2026 09:38:18 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F1353F85F;
	Fri, 13 Nov 2026 09:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794591501; bh=Cjbcl8ElIDWqrJiJw2TSmOjKWxpV70lfEGVkWoLoSeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxPzXIU9otcEq3Hq6ZfjT/0vx7+pmj0aXDR3ihhQdaUmOCNXdHxAahFXi/KqssP6K
	 SmIf1LOcf32igdhKPHChMzTX3eN0bHR+2PHwAZZc4I3RPivqh4hsgGuorrIvI49767
	 a+SU2GJflKxi57gKxY1qxEybN1R+56/AllY0+JxM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: mark.rutland@arm.com,
	oleg@redhat.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
Date: Fri, 13 Nov 2026 17:38:16 +0000
Message-ID: <179459121445.3758917.849284373049044409.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105113051.97810-1-zhaogongyi@bytedance.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_093830_549830_D0F1E95D 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 19:30:51 +0800, Zhao Gongyi wrote:
> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> which calls ptrace_stop() without siginfo. If the tracer writes
> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> NO_SYSCALL before update_syscall_orig_x0_after_ptrace() checks
> last_siginfo. WARN_ON_ONCE(!info) then fires for a valid ptrace stop.
> 
> Keep the early return when siginfo is absent, but remove the warning.
> This leaves orig_x0 untouched at a non-seized group-stop and preserves
> the existing syscall-exit-stop handling.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! I modified the code comment
as per Will's suggestion.

[1/1] arm64: ptrace: don't warn on missing siginfo in a group-stop
      https://git.kernel.org/arm64/c/5306f124f317

