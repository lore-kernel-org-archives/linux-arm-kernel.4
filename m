Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB2606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZRj7P/n2;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=KfIrpmdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:Cc
	:To:Subject:From:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=; b=ZRj7P/n2Byg39KKYa7XlLEjWIv
	XHDgyrwtHGKjqos7cWHXaguHkiIup4iX6TENZB4RN7bsqx7pgQONUncGFGwKq/mHTV0jXDYBS5Di1
	sSRErMvy2x0CWWh/a3Kf562KFq2enC+3ZPTq0QLMD1xaOuvvy5fYWHQ366ai65LReZ2zbGIqblB7v
	ZprtZw/7R5T2JRF8ewL4igc370LNkE3vVE0npJBGs6B+nmeJAYmMNZ14wlxajMySMtnhNsbjQTXDS
	aKdLrZnwCPlKpiZqmO+jTiWJAZNSIVIBf1hCed1p4BoUHjTekletqzglgXKIM6vWVrYrWlBxDrCKp
	GxNL90Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmp-0000000C5Lc-0w9n;
	Fri, 13 Nov 2026 08:37:34 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmd-0000000C5GT-1gM5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:21 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ed0cabf65fso3069315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559038; x=1795163838; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=KfIrpmdg9C2+0dh+bLNjz2AcK24KKKL6s09LtE9ro11KnXkvcz+rvSJaPFSKJgCDIa
         Ktg++zMcWT+gbewqbh1ilGIgDxB6JVb/6AZEB3LpiwYh8f2rAodCOil1eaPQokqwccZ+
         Y3BJAok/Mn+aY1AhOeWjna70EyqC+bkIReuLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559038; x=1795163838;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=CEZtPtwzmvaQgcpD3hb5wohOTk7xiFuEtjG8qAaksQIFhFtfZIYWKwJtFMQ2vMiKWN
         rglTS+HQPj1rjZUZlAKQ7OFgsMDDSMLLzfSSRf6mlOVrVf3r2fmmeJC7HHd2tATQ0KP6
         qPf4434f2W1rvf2uWLBtfqiz4Wi9HGx3a7mC3cf6M6sRCv+bLTexcVMvJQwEqAvBeJ1N
         tOsRSrJWJEm/w3+Q9zHWHXpvxi9UH6kxl3fL93MUEd6rL+uA/GBtdr8v+OeU80KrxK+4
         e70ny0G14aWqMZQ+EWJeVz7E9uc+ud9DIULeWdCIwupqmaTOBZ6gOEbCZHuoWVwx5r2J
         LQtQ==
X-Forwarded-Encrypted: i=1; AL+hErEduWPkJH8oXsxAbVrOsxBBECjuyT3UC6+lrp8OD4+jMOD2my+xDdyVtEQNRBLkcbs+eugqeA+3OyPc+kcTzvm3@lists.infradead.org
X-Gm-Message-State: APuU4Z/QsJ3svuQNA2/PQlxd/u76k8S2VoslHY6JAduJipOpuhsYkDKz
	AjgGmDiDwVc18qWD6ea7sgMK21jj7MDoU+6ieD/JZQrJamJ2Guvci6SpNoHT6kBnOSI=
X-Gm-Gg: AYBFou1xnfn2BcKajc8UF9VN7vfyvUVuV5+BmiuWi0yDrsi59lJ9CCuAYx//r0QLld6
	wl0uPU+31bunJrvgMHkeKj2aCYf5l5sANPh6jrbM1z15sCWov44/4/jbDIw7WetsInJNCL1/OZx
	ebMILeEkddj5HjCL7OJ/dvkRReADXvPbloSDUXEGy1IjuY7PwYE7ELnyslyOgTXnaxfUh0sWDoA
	nuMbpcEBKMF2SihlivXy16wAMkvm2nzM90ZpKxL03FCs4+j5NeFoh8h/NZL7PEuJPcNQFbCnrPw
	HYL3uKXWWAb0zFn0KDS0AUUpy724UJ4+A7DBnklZ7zPE7DePktNtzConG9n4Ggczk1+Md+ZXPI0
	FO/bwULqTvXMe5rbYuKW0qsuxgPwM3EVMhv6at3dGy+1OR/QdULMj5tiLUvhmnu2GzwNMEEumOv
	GOtDrxLe9l20o0c4NXYmG5j/XpAgIQMW4Vt6hZGE82B3y+sQXTShOifEZU6xx/Z5D1VE+R7EkTd
	tV70RRidHnnFjWhF33hJh9IKLMTDAcy1y1FSrTlRh74/KDoDKv5jL1InRtfbSj6uornkChNoqNu
	9lpWzyBHKpMF7gm2FKJNQWt1cmfP4NccigWW4TyoWPb02KZv/BjoKZqqBnhR89gpAyQ4ye+tg0r
	jJScQOz1/P5aqyDwzgGacKuCbt5ER7737VIfB2to079PY85v+iBprPUgVejmECRecNc++CWE3Yi
	768SWmcJEKvjyiGp4NnIlgeuW9GSNJczgL/Gu69Y4Hf0xnYUqVosJmko/ytkE=
X-Received: by 2002:a17:903:120d:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2ee0dd14181mr18456195ad.41.1794559038435;
        Fri, 13 Nov 2026 00:37:18 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm6731535ad.54.2026.11.13.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:17 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:14 -0800
Message-ID: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/3] Make the scheduler stack end check selectable at boot
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003719_666601_D9957C82 
X-CRM114-Status: GOOD (  13.05  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

v2:

- Check scs_is_enabled() inside task_scs_end_corrupted() rather than in
  schedule_debug() (Peter)
- Return 1 when sched_stack_end_check= can't be parsed (Randy)
- Say in the changelog why the other task_stack_end_corrupted() callers
  are left alone (Peter)
- Rebase onto tip/sched/core

v1: https://lore.kernel.org/r/cover.1793082868.git.chris@chrisdown.name

Chris Down (3):
  scs: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 include/linux/scs.h                           | 19 ++++++-----
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 5 files changed, 68 insertions(+), 14 deletions(-)


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.56.1


