Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vuZemOZx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UigvgyQ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rBdL7/NEK0gS4E5sLQz6+qp95gj/p8G8f/44Hp03EyM=; b=vuZemOZxpvo4ZKkKkq1QmJEUmF
	6Qy1Unr+raDN0w+sS3FPfCZKKJvoYw3xlReghNYav9RbBdheYWRt1+sMNvroSbXH7nz/Rc/QxLe20
	AMH3bkCGIftV5Ono9uFT98FQocr03Oku94jfrtyf3BnvfkKTu+6KyLrvBFsLOGZtFEzJq2eiIGjyq
	XWjXvyU8Lgx0Kj19NyCGvgU/Nl4VubcRCvcuXLyxNjlFFZ0Ty7mIbexFcgWuAXj2Xl/tSUZgn67GN
	PRwd4sZn0KUD5yZ2UMoJY09jzeXcQS96ffCs3q8+JZb3t+CJr+HOMcsZcrOcvYnYlWfHI7Ftr7KHS
	LeGn3riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT14f-00000003Uqa-3z7t;
	Mon, 16 Nov 2026 18:05:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT14e-00000003Uq3-3zsg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3817D628A5;
	Mon, 16 Nov 2026 18:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D711F000C4;
	Mon, 16 Nov 2026 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852299;
	bh=rBdL7/NEK0gS4E5sLQz6+qp95gj/p8G8f/44Hp03EyM=;
	h=From:To:Cc:Subject:Date;
	b=UigvgyQ58nzOynrScpwhO+BChiVqk/6H+4dcLO3qaKG8AHX8h7B/NkUP4KleBJ1WG
	 +/IYDIZQjAnqSPWo0KZWFlJyTMEGGoZR4DI4d4ylD+nz6K7HRVkK6jbXaw2W4NlUPF
	 z/nSMg247MjcDBvk+T+8++bg/KG8TIJav9jIqAVu3d8HQy38/8Tf/yfH6tjzf8Cwjr
	 OV+sgSb2DfoCUB6C51RUWTe+0MCtg0gQIUNH70zjzULdiTdsDeKpHN579n1b21v6qa
	 03GclzTL+eZIoCKualLLGgFXpPrzvMA1sYWyIx9NZOvetMPFy8NNr71fh9Ilv9nsF0
	 e1coDjrEncyPg==
From: Sasha Levin <sashal@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: allocate the signal page at boot
Date: Mon, 16 Nov 2026 13:04:58 -0500
Message-ID: <20261116180458.3432038-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

arch_setup_additional_pages() allocates the signal page on the first
exec, without any locking:

	if (!signal_page)
		signal_page = get_signal_page();

get_signal_page() also picks the random offset of the sigreturn code
within the page and stores it in signal_return_offset.

If two tasks exec at the same time before the page exists, both allocate
one. When the task that picked its offset first is the last one to set
signal_page, signal_page points to that task's page while
signal_return_offset holds the offset used in the other one. Every
signal handler that returns through the signal page then lands in the
wrong place, nearly always on the poison that fills the rest of the
page, and the task gets a SIGILL.

Only handlers installed without SA_RESTORER return through the signal
page. glibc always sets SA_RESTORER, klibc doesn't. With an initramfs
that runs /init with klibc's sh, init dies on its first SIGCHLD:

	Run /init as init process
	Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

On i.MX6Q SABRE Lite the first execs come in parallel on every boot:
the two SD hosts probe at the same time, each requests ledtrig:mmcN, and
the two modprobe helpers exec together. KernelCI hits the panic in about
1 of 400 boots of that board with a klibc initramfs.

Allocate the page from an arch_initcall instead, which is what the other
architectures do for their signal trampoline and vdso pages, arm64's
sigpage for 32-bit tasks included.

Fixes: 48be69a026b2 ("ARM: move signal handlers into a vdso-like page")
Cc: stable@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

 arch/arm/kernel/process.c | 10 ++++++++--
 arch/arm/kernel/signal.c  |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index d7aa95225c70b..615a8fbd61bc7 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -379,6 +379,14 @@ static unsigned long sigpage_addr(const struct mm_struct *mm,
 static struct page *signal_page;
 extern struct page *get_signal_page(void);
 
+static int __init signal_page_init(void)
+{
+	signal_page = get_signal_page();
+
+	return signal_page ? 0 : -ENOMEM;
+}
+arch_initcall(signal_page_init);
+
 static int sigpage_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -401,8 +409,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	unsigned long hint;
 	int ret = 0;
 
-	if (!signal_page)
-		signal_page = get_signal_page();
 	if (!signal_page)
 		return -ENOMEM;
 
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 763e1930a1ea3..2b8ccebd33b65 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -648,7 +648,7 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 	return 0;
 }
 
-struct page *get_signal_page(void)
+struct page * __init get_signal_page(void)
 {
 	unsigned long ptr;
 	unsigned offset;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


