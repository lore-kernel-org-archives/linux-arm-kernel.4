Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91966606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3djZl2Fn;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vi2XcOX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7RGixTCgzsSlxkC99NGoPdbhFp+AvQL9jZysNiju/XE=; b=3djZl2FnNjMvmf
	RHXK2ShHIkDgD6xU4HLx42ZC5WoSQxxCs3FS11YeG2HeTOSNONkKkEjo/HMhlbeTyNuLu7vAu0qIs
	qE9MHc/137yHeriqZqT3B9AUh0aPpoAbVZhkrj8eE60l1TfAiKkBFwGTzOSo8T6LItR6ujvEuVWgg
	FeKu7c0GgpzQtdqBUl4BK046KYjZ2cqyWmZA8fVJ7Ls4WhLw+jvnNV4l+kF0Dwr0ooeZhcEQkIBhR
	XPJ/T5jdjMEl6NaHKjbWJFvoN469LWP/9Hksgv88VXcMMCI7vFaZqY/qK4L/0WrNMzNdSpks/JXBD
	6nneNHITR6QXtc33JZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaoW-0000000Ay66-0lJT;
	Thu, 12 Nov 2026 19:50:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaoS-0000000Ay5g-0cNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:50:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 807461516;
	Thu, 12 Nov 2026 11:50:19 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32D1A3F632;
	Thu, 12 Nov 2026 11:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513022; bh=FZAyPa/YmgZTqYnrEwVqlpbAp2XgXISE2pX5Y7rna8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vi2XcOX63cJmICBTAk87VbYkZgEcmYpH0QO8F2Zq+oWrs1a8JO2Lel1CCGgq2R6gM
	 +nhL2WsOFCNwLwe++RcLrV5Vr3l2Pg2j1Zv/I4kEIyUPT/FVY/DOjUioWjOh+aBjWF
	 L8qnQRGCSCwczSaV9rhHuBiwINTW9eITOalI029k=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: errata: Update AMU workarounds
Date: Thu, 12 Nov 2026 19:49:28 +0000
Message-ID: <179451296804.3304937.3878967781756339834.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111124005.2688820-1-beata.michalska@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115024_462162_80600C60 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, 11 Nov 2026 13:39:26 +0100, Beata Michalska wrote:
> This short series updates errata for AMU core & const counters.
> The last patch in the series tries to optimize a bit the paired
> readings of both counters, so that the workaround checks do not
> skew the results. It is also intentionally the last one, as it
> will not apply on older stable kernels.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! I left the 3rd patch to Will
for the upcoming merging window.

[1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      https://git.kernel.org/arm64/c/139a9b7d5a07
[2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
      https://git.kernel.org/arm64/c/be7771458582

