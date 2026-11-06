Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F11606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T+OaLB1a;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d95EKw/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=np0rBc7IjhEQu4p09VCEWlO9o9RBufgirnMcmCHN/No=; b=T+OaLB1aIZPxcjcZnvvLqZH+Xh
	eXCOcyKz+6Mc073Qk/TgJdGBijBPHe+xAVPkinXDJJoQqsLwx3u8PL9s76GQCQ1zfEAp6ySvWSD4C
	KhVrzUAXCLN+Qs06CZ+6C4iVIKj4ty+Fqo/CvSqy3gHJrc/mZ+53irr/dNzDgYfyG6JF8OVIZoDMS
	ZzmilXZ9tzUThr9UZ5/8e9x5nm1M1825gZcF6uA8MbGgOFSrWvUP2IRPPVikrRIpgQuYIOyT0s80U
	c9sfU2nJ0AIFhjM2kWh8i7EgFlWk5oIuOJy7uPISi/ibNJ8deI+R/E5mP9qIxeS0JY1wVCOuIlCWo
	aRES6bYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUO-0000000DN4q-0DBD;
	Fri, 06 Nov 2026 18:16:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUL-0000000DN2j-2snu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE0E1682;
	Fri,  6 Nov 2026 10:16:29 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F2B3F673;
	Fri,  6 Nov 2026 10:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988992; bh=E0Ux+rJXBJFRHQCF+PiknD1DijpMrELS0VMmKTqZ/Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d95EKw/c2iQCv93H00PxABDJ9kn1MVxtlxP3CD2v2pOefm8L8SnZROUPuT75jGECz
	 FiWX+xTnOiS0ChTukXnbcxOAwocaOMf2G6SdagNl8JqWw2/kjzCGqKv5pEh+lv5McW
	 HPQvygA8GlxZMRkHs5bw7kwl+PDlEUmoZ7rfAi8A=
Date: Fri, 6 Nov 2026 18:16:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: syzbot <syzbot@kernel.org>
Subject: Re: [PATCH] arm64: suspend: Only track cpuidle context for idle tasks
Message-ID: <au4Ze0u6L91ve4u7@arm.com>
References: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_101633_824218_CE88C1A5 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: mark.rutland@arm.com, syzbot@lists.linux.dev, Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>, ruanjinjie@huawei.com, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, vladimir.murzin@arm.com, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 08:19:45PM +0000, syzbot wrote:
> From: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>
> 
> Commit 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic") moved
> the calls to ct_cpuidle_enter() and ct_cpuidle_exit() into cpu_suspend() so
> that arm64 cpuidle could keep RCU watching longer and manage context
> tracking internally. However, cpu_suspend() is called not only by cpuidle
> via psci_cpu_suspend_enter() (which runs in the context of the idle task),
> but also during system suspend via psci_system_suspend_enter() (which runs
> in the context of the task initiating suspend, such as a process writing to
> /sys/power/state).
> 
> When entering system suspend, current is a non-idle task. Calling
> ct_cpuidle_enter() invokes ct_kernel_exit() from kernel space (!user) on a
> non-idle task. With CONFIG_RCU_EQS_DEBUG enabled, this violates context
> tracking invariants and triggers a warning:
> 
> WARNING: kernel/context_tracking.c:120 at ct_kernel_exit+0x1b4/0x1f4
> kernel/context_tracking.c:118
> Call trace:
>  ct_kernel_exit+0x1b4/0x1f4 kernel/context_tracking.c:118
>  ct_idle_enter+0x20/0x34 kernel/context_tracking.c:299
>  ct_cpuidle_enter include/linux/cpuidle.h:134 [inline]
>  cpu_suspend+0x264/0x474 arch/arm64/kernel/suspend.c:136
>  psci_system_suspend_enter+0x4c/0x80 drivers/firmware/psci/psci.c:544
>  suspend_enter kernel/power/suspend.c:468 [inline]
>  suspend_devices_and_enter+0x88c/0xd0c kernel/power/suspend.c:533
>  enter_state kernel/power/suspend.c:618 [inline]
>  pm_suspend+0x498/0x698 kernel/power/suspend.c:644
>  state_store+0x14c/0x1fc kernel/power/main.c:819
>  kobj_attr_store+0x6c/0x90 lib/kobject.c:842
>  sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
>  vfs_write+0x51c/0xa0c fs/read_write.c:687
>  ksys_write+0x12c/0x228 fs/read_write.c:739
> 
> A corresponding warning is subsequently triggered in ct_kernel_enter() via
> ct_cpuidle_exit() upon resume.
> 
> Fix this by checking is_idle_task(current) in cpu_suspend() and only
> invoking ct_cpuidle_enter() and ct_cpuidle_exit() when executing in the
> context of an idle task.
> 
> Fixes: 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic")
> Assisted-by: Gemini:gemini-3.8-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+79883955da3a62652a80@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=79883955da3a62652a80
> Link: https://syzkaller.appspot.com/ai_job?id=5359e16f-013b-4850-9cbc-ddfb3bac95e5
> Signed-off-by: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>

The patch looks fine to me but the authorship is confusing. It was sent
by a bot, also generated by a bot. Uladzislau tested the earlier RFC
(thanks!) and syzbot decided to make him author while dropping the
Tested-by. The original tested-by:

https://lore.kernel.org/all/3e92ccb0-2952-4317-af4c-45457c15efae@gmail.com/

I don't think #syz upstream should automatically translate to
Signed-off-by.

What do we even do with such bot-generated fixes (which may be correct,
so can't be entirely ignored)?

-- 
Catalin

