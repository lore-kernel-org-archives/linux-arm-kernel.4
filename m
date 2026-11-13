Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC4606D86F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPIscaV1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZaxXc6dg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wb1OXX+yliqJmjn2ESkgHuebZuic8EqdBrdlJXh89ms=; b=tPIscaV1anbA2SGHSZ0nLFisYU
	nh1sDUUww6hiNMqb9hQAXhBUL9+QEXnMXAUIh2HhD0V7NFEoFG2+JftaaJzhCFd4zikkmyD6zyrPM
	gK5p+UzqR5Mpqr/XLMO6H/XR2T3jtrrml28i29//QysTERi5sPYtuJE70q5bXct8ZEHPWiUR3LDdy
	PN/0Cs950PgB7HwVO3QjjviWVpyaLpWc9X9+04uP4u6P+xGeLxpL+NSjl9AfEBeS/CLSj7epF6FUo
	togpX/Yfy1D8Io3KXA/plGFacyU+MJfk5HTYShWkyFYuSXwqeAE1wzResKUB4Dsf5xFyGeiCwUX4X
	xGbfL+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvEg-0000000DlO3-39wK;
	Fri, 13 Nov 2026 17:38:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvEe-0000000DlNT-0ezT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:38:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D082E143D;
	Fri, 13 Nov 2026 09:38:43 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45503F8C6;
	Fri, 13 Nov 2026 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794591526; bh=p3PS1SVNPQdF2HUhwZLzdl6Jo2D89+v/wFidAgUFVFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaxXc6dgXkbZA2sirb0dK5VwB39J/16ShYuz27ReoHwmF9e4cB0MGPPYD2JomEZgb
	 QwIHeCl24QntfFH7fZNvp8tUf6tZ+srD+EdxYJpQuDZt6sIOQ7m0VihlmwQXCHShcO
	 rMccEIa1A551K79aXv8Q7YUe4erVYGZra3eVoBSs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: syzkaller-bugs@googlegroups.com,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	syzbot <syzbot@kernel.org>
Subject: Re: [PATCH] arm64: suspend: Only track cpuidle context for idle tasks
Date: Fri, 13 Nov 2026 17:38:41 +0000
Message-ID: <179459121446.3758917.12081688129224269638.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
References: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_093848_263249_B615247C 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: mark.rutland@arm.com, syzbot@lists.linux.dev, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, vladimir.murzin@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 20:19:45 +0000, syzbot wrote:
> Commit 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic") moved
> the calls to ct_cpuidle_enter() and ct_cpuidle_exit() into cpu_suspend() so
> that arm64 cpuidle could keep RCU watching longer and manage context
> tracking internally. However, cpu_suspend() is called not only by cpuidle
> via psci_cpu_suspend_enter() (which runs in the context of the idle task),
> but also during system suspend via psci_system_suspend_enter() (which runs
> in the context of the task initiating suspend, such as a process writing to
> /sys/power/state).
> 
> [...]

After some pondering, I decided to keep Uladzislau as author. The RFC
posted by syzbot does say that if you reply with "#syz upstream", you
adopted the patch and your sign-off will be added.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: suspend: Only track cpuidle context for idle tasks
      https://git.kernel.org/arm64/c/ad3fc05c7e65

