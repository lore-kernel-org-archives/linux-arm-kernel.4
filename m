Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129B6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8ivHwcO;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K0vBSuRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7M4wAkcRkb6dvf/wF5/1Lb5K43+ciQ6wkAeFxRT0J/A=; b=N8ivHwcOCouN59
	qpZtzqmWBTRY7UOkNfLNTgUNjvAbnhuh9N8Xli1AvkXOkxKLBQz0iJr340vHXxWSGNfuw3n9saNF7
	jJ1IzT8gP3Cz8OpE8t7Go2F2gwTojey9jwJyrQKvRwiWKRW3qrDSEr0a4wakoKvRhTwwCavcPbxM7
	beBMN2ZVQVcJA+LmiyAh609Qp3cASxHUiktSxDAA3fnQgX0Slhs5ppntd5s0bYcPvi/tS3T5B09U7
	hUsW6m48ypRtpN8XXwXKJlwdhVWOwSxYLOAbBdMXv0jx9sZiiALTS/jTUHeLISQNbH8uJow/GJHC/
	+iSLFaALWx0NUXJYC8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhRP-00000005Sha-1ELY;
	Tue, 24 Nov 2026 03:43:35 +0000
Received: from out-31.mta0.migadu.com ([2001:41d0:1004:224b::1f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhRM-00000005Sh9-2L00
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:43:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yaQ1iSL0Ettiz67uSnxASSrVErm3nTbgg2wSpt+Ygks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795491806; v=1; x=1796096606;
 b=K0vBSuRGn4tW61FNQC5SoK/IU3uOMA3cYNrWCEuG1q9fVy9B29yTJd/VVOmROlAJPAZfebrp
 +xjzUMuvjEQOQTU7qXR72p86YnR6tfoHcPJ9e2iiadFWUCmUmRD7s/IOv451dZXxuXqDOq1gN4u
 UxJ65fccPhGe9RyctcnfL4lc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 900d51c335235986;
	Tue, 24 Nov 2026 03:43:26 +0000
X-Mizu-Trace-ID: 900d51c335235986
X-Migadu-Flow: FLOW_OUT
Message-ID: <094948ff-cd86-4f20-865e-ee78b908db23@linux.dev>
Date: Tue, 24 Nov 2026 11:43:20 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121083950.1957044-1-takano32@gmail.com>
 <20261121083950.1957044-3-takano32@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261121083950.1957044-3-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_194333_272845_2349870A 
X-CRM114-Status: GOOD (  20.59  )
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
> The Falkor E1041 entry in the arm64 silicon-errata table names
> QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
> is defined in arch/arm64/Kconfig and used in
> arch/arm64/include/asm/assembler.h.  Correct the name in the table.
> 
> The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
> QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
> symbol name, so an E-less name in the E1041 row looked consistent.
> QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.
> 
> The symbol in arch/arm64/Kconfig is spelled correctly; only the table
> entry is wrong.
> 
> No functional change; this only touches Documentation, so no build was
> run.  The change and this changelog were written with the help of an LLM
> assistant (Hermes Agent); I reviewed both and am responsible for them.

Again, please use a concise commit message.

> 
> Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
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
> index 4bb5707a880a..cc7bf2b6a09b 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -378,7 +378,7 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
>  +----------------+-----------------+-----------------+-----------------------------+
> -| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
> +| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
>  +----------------+-----------------+-----------------+-----------------------------+

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui

