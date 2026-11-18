Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67FD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ajsHV8SY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MJ8AaDiH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LUsD5Csh3GIptL1Tq8/cMwSlA5TqieuaWNVvXB6pwtU=; b=ajsHV8SYWU1RiI
	9MLVv9cplJjk0bOzUnzbWdoAO1rRMDvgLR+Z5BjSDtMZy5YLr/lbOzyrdegYBMkI8Zhu1Zf/cPZWG
	5xmGRFdwRSYCYqm9eMK3CrSQuqkYc+C1Ee0reNp5yF2ymEK8WSG94vTHr0jnviF5Kj/GEueLn0eid
	JP2qVvuNRLeJu8vdaQUvEqC/Nc18pKEShSRrIUxr2BKYJZE41Rb9LkPIEJEGpi/9Cw8kSAgZeIm57
	LOaO/ceJXcR41rT75/oyftmW1cOt6T82Jf3yXPplKKXodL7XuF0Kr2h2rddBFJM6ay1V+LIt/fpPq
	VbBKIJ1YV+NXTb0wukJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkNb-00000009xhx-0qkB;
	Wed, 18 Nov 2026 18:27:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkNY-00000009xhL-2i4G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:27:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D5841477;
	Wed, 18 Nov 2026 10:27:29 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7B4E3F673;
	Wed, 18 Nov 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026452; bh=1MS5uybl7w1NZXxUxb0cnUerlsOo/zrS81uZ7LmgQT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJ8AaDiH6bW7WOVMGXyJxxrA5fuwJxSYqqycqW3zaHDN+7UoGX3AZnKUEQJ3y/kRB
	 ASJjs4e7xDN69fhDwWt18U+HspK9bXK6975kl3Sr6hahhJ1CBpmZvkCX1Q4Bc3sIaG
	 rGcHk/xvixRZhTKZcAwpfuLX6fYZn8qSTzWvqp98=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/6] arm64: BBML3 errata workarounds and cleanup
Date: Wed, 18 Nov 2026 18:27:08 +0000
Message-ID: <179502639862.2187887.16636130062052880342.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102732_722905_6513DF08 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, 13 Nov 2026 14:50:14 +0000, Ryan Roberts wrote:
> This series updates the BBML3 allow list following a review of Arm CPU errata
> and implementation support.
> 
> The first two patches remove Neoverse-V3/AE and Cortex-X4: their latest SDENs
> show that revisions previously treated as unaffected still suffer from
> BBM-related livelock errata. These patches are intended for stable backporting.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/6] arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
      https://git.kernel.org/arm64/c/4f9280c8db69
[2/6] arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list
      https://git.kernel.org/arm64/c/c6ba16d8157b

