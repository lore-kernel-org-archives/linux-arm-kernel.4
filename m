Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsls8+HR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDoHQM6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I5IYt5lD0t4uzj8miQUAufXofOEz3QHtC3aQ7LCE8Bw=; b=bsls8+HRoFSM0n
	iGq2aDEBRaybEBrdq/HAcqKEU6x1suVPBsH1Qis1BAEpmEYdJ5g/2xsWJWZxi6InXk8tDqSKZdJvS
	aeU7+FV2VTvSD5/IXPul3S7rQ01VFhipzoVMXYsVxryTH53nD3wtW/zgEY0SLp6d7jEQWWl7X8/+R
	uod/49qhCQU4VDI5POV3oVJAWHHHZ7GQ3RcCG1gMC6tO1N+9n1iwGOYpSW6EqQbtoDpsw0f8P2gPI
	XO5r4F/IQLJHwgcZHrNYIbYAJsmveZNSx0j/A0Gm78Qpw8JfymQFNpK0055rHUfDk8uuDVQEVod16
	a0aUZAaBMqN6d/JonnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHj-00000005Rea-3QcU;
	Tue, 24 Nov 2026 03:33:35 +0000
Received: from out-159.mta1.migadu.com ([2001:41d0:203:375::9f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHf-00000005Rau-2FrN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SFcrls7zpUQel+GbWPMlPJigKtY/3Ba5jJ274MNY1KU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795491205; v=1; x=1796096005;
 b=LDoHQM6nbU+G4M565Q29Wvwmf3IzIV/k0LjbazbPfZ1FpHDxexHeAzkLtVy8IL9yW1DJZ3Ru
 VO10yhUwcHpWgUUFVFOa+YSjvEvtC/hUTrP6i7pXmsFuo+bPehnCNXTQGXlrpOEk/oujppeHgDo
 d3a2uYGL6pmh+AwrcyuXFZOs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5b1f3acdb92f82be;
	Tue, 24 Nov 2026 03:33:25 +0000
X-Mizu-Trace-ID: 5b1f3acdb92f82be
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd62d092-a90a-4711-a3aa-16caa03bc806@linux.dev>
Date: Tue, 24 Nov 2026 11:33:13 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry
 to N/A
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121083950.1957044-1-takano32@gmail.com>
 <20261121083950.1957044-2-takano32@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261121083950.1957044-2-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193332_614936_17AADA5E 
X-CRM114-Status: GOOD (  22.76  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/21/26 4:39 PM, TAKANO Mitsuhiro wrote:
> The GIC-700 #2941627 entry in the arm64 silicon-errata table names
> ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
> that symbol and no code refers to it.
> 
> The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
> passes the GICD_IIDR value to gic_enable_quirks(), which compares it
> against gic_quirks[]; the matching quirk,
> gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
> already records GIC-driver workarounds that have no Kconfig symbol as
> "N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
> likewise in the GIC driver.
> 
> Set the Kconfig column to "N/A" for this row.  Leave the row in place:
> only the Kconfig column is wrong, and the table should keep recording the
> erratum.
> 
> No functional change; this only touches Documentation, so no build was
> run.  The change and this changelog were written with the help of an LLM
> assistant (Hermes Agent); I reviewed both and am responsible for them.

Please ask your Agent for a more concise commit message. Most of the words
are not necessary to be kept in it.

> 
> Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
> v2: the change is the same as in v1; only the index and hunk line
> numbers moved with the rebase.  One changelog sentence is replaced in
> each patch: in 1/2 v1 called the table row the tree's only record of
> the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
> sentence about the symbol is reworded to name arch/arm64/Kconfig.
> Both changelogs now say that no build was run.
> v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
> A duplicate submission went out the same night with different subjects
> on 1/2 and 2/2 (20261106235616.1533003); please ignore it.
> 
>  Documentation/arch/arm64/silicon-errata.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index bffaa46c664b..4bb5707a880a 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -297,7 +297,7 @@ stable kernels.
>  | ARM            | MMU S3          | #3995052,       | N/A                         |
>  |                |                 | #3673557        |                             |
>  +----------------+-----------------+-----------------+-----------------------------+
> -| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
> +| ARM            | GIC-700         | #2941627        | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
>  +----------------+-----------------+-----------------+-----------------------------+

Otherwise,

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui

