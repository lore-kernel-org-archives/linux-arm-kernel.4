Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5F60A262E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cmQaiCaQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O8mbTamL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j7QUpc5QEE9kBpCKZyh0iyL6xxgGtTTl37sbWRN+Zw4=; b=cmQaiCaQ2Vg+e9
	J0uRLB4D/lMR28DNRHaUswFcA2hkV7vSIk3KadmB+K23sIKUk3ug1HgLUgTt/9lguBCg70zAUPKvl
	7b6q5W9QZC0Xjkx1ApUKnDGxEwv/sgmQmFUOKafrVwbqMy8UqdZvAQpifCPDV2O2tT5o5ayUwEjCp
	WdJlFFVyHbp3x3KgBzXsedPsyYClxrUNFrZPQH6A5HJ8U0W3puPaKBaeBFvUVy17+PVkzFPtdPuCG
	jiDCzG+wr9Y1w2YHXcTu1eVW+Xx5MZ55h/pQk6easlbUVzCNVJ0EMpex2DuaPaWhee5dQLCftdPoj
	FItjwjPDyC01B3tLyneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaq4-0000000AyCz-2Alm;
	Thu, 12 Nov 2026 19:52:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRapz-0000000AyCE-2B8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:52:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E6FB143D;
	Thu, 12 Nov 2026 11:51:55 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1180A3F632;
	Thu, 12 Nov 2026 11:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513118; bh=DQuepZdvb97HHTMPODLKmAYIFhr3Z/1G4UK+ckClajs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O8mbTamLisORL88fsLmFTt2aRZhz1miWAsT+CLuTMSMVY6pXAFFnQkgQLXuxEy+JA
	 pbWFbK5fKVmTncFtO6SNMds8Z25XwvT5DSn90RIcATtf8ZRj4FOVOgaN6uLqp95vdN
	 0f73Fi50k6g49hHehJUEH/pGrnRHnyOuWIoysuBA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64/gcs: Store the GCSCRE0_EL1 register value not userspace mode
Date: Thu, 12 Nov 2026 19:51:49 +0000
Message-ID: <179451296803.3304937.17452903421973790393.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
References: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115201_947565_61137C05 
X-CRM114-Status: UNSURE (   9.92  )
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

On Thu, 05 Nov 2026 13:00:11 +0000, Mark Brown wrote:
> At present we store the userspace GCS mode for a task using the prctl()
> value set by userspace rather than the mode configuration written to
> GCSCRE0_EL1 which means the register value needs to be generated on each
> task switch when the new task uses GCS.  Since the mapping between the
> two is easily reversable switch things around and store the value that
> we need in the context switch path.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64/gcs: Ignore attempts to change GCS mode during signal return
      https://git.kernel.org/arm64/c/d395db3dcd4c

