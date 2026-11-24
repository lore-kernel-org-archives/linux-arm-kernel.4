Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nf5Xyeiy;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCMpY88q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qd4cLEjyU8p1fwdfC/RYTseQimM3+mbqD8vsSZXiXHU=; b=nf5XyeiyFjB9S+
	4rAQPWxwIOCi6uT0cfKoQtx5edsUDaZuw5J+GcwbePlVnSvCPfH9WIvUh/RJUPQt5aNdDdUYxoZwl
	PDqYJRZpNzy0TpcCDByM0NOuep+5+ytQFEzIcd18zS3KKbLkVCRxytx2wrWQnGQQavnHsCnrCQTOB
	mlgaZBrG4KFe8MsRQ8QnlQmvO8+dx2WPO7eWC6BqNLoTI8sF3Y+tboSo1Jo6mnddyeXy63VOVPPMA
	q0MiNr2xh2R/A1B1sNoY4SkLM2rfR0xJuFkOSySG8xScmkSWUEObQlgG2v2F8buRZkoVKqAk7DM7o
	tLqqtNXEUwkZnOqXcjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsb5-00000006v3d-2ACY;
	Tue, 24 Nov 2026 15:38:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsb3-00000006v2K-0OO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:38:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80EE339;
	Tue, 24 Nov 2026 07:38:12 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AEF43F763;
	Tue, 24 Nov 2026 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534695; bh=Fd8vAvfcXXUJHp0RFzy6EKEGVuJz1PGbur6GX4b46q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCMpY88q8IokCl8JSWWyoOLernXbaTyeGpFLmFA31Mdtr7s6Dsau12yvUwJAU9OrB
	 rnG4eljaVbqEwkgDncXWFMIfOrJO9IugcIiSWmF2P8CVb8HkhtWgnVeyecRb7tTsbM
	 kdA6dCBmCDDrOFg3q3cgBUZ/Tp6jee/Pt/M6gmfs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: Missing barriers in kernel page-table updates
Date: Tue, 24 Nov 2026 15:38:06 +0000
Message-ID: <179553468640.1023027.6271192454790662098.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_073817_173212_AD3D4431 
X-CRM114-Status: UNSURE (   9.86  )
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

On Fri, 20 Nov 2026 12:16:35 +0000, Fuad Tabba wrote:
> Three fixes for kernel mappings that are made valid and then used on
> the same CPU before an ISB, so the access can take a translation fault.
> 
> Tested on QEMU. The runtime changes to the linear map that patch 3
> covers were not exercised, since they require a CPU with BBML3.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25).
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: pi: Add an ISB after mapping the FDT in the initial ID map
      https://git.kernel.org/arm64/c/98032adcb615
[2/3] arm64: mm: Add an ISB after remapping the KPTI page-table slot
      https://git.kernel.org/arm64/c/bd63a4741f50
[3/3] arm64: mm: Don't defer the barriers when installing a fixmap entry
      https://git.kernel.org/arm64/c/bb60ce2c3674

