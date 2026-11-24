Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A50606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OS2EMmv6;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H5MXMBDM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SSz1UkrPYOtP7qjRzAhNmZAnsxclw+c33mPfbQ/t5hM=; b=OS2EMmv6HIVdpLmI1geTaHXk66
	0ybBwkFxd5rorZd7uB+FjScmokBj7Kb4j+qQEaO7wqdCR1KRoldOWCdq/MHt3KNNFi5JyYItDoISm
	L8lhyjZNrtqmtK2zynumcoYuFf54GZHkzuqD2WuX19xxpmnPbq0z+b5UlMn/Ng3bOurdxLWte3UrO
	hr5cO5lZmgy8HkS9hXjq0xjxUYvamWHwXQer4faNXlPw6KrHTQYtKdlOJ2g5S/EVi4bDnbUEjap3O
	ssTW5kYvT1wfXdzr6XIaQ1mIjkz0AdL+fT41Rc93Z0IRtN4bVDT0tWLkgUMD1BavPrnMTZyONMQJa
	YbMuADBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoli-00000006Mes-3hoQ;
	Tue, 24 Nov 2026 11:33:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVolf-00000006MeL-03hz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:33:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6785C339;
	Tue, 24 Nov 2026 03:32:55 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5906B3F86F;
	Tue, 24 Nov 2026 03:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519978; bh=v3Pi6dD8yf3tjc5InZwV+u8P5LclNlEmMiAiF4I5Szk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5MXMBDMJKVCFIyGahPkkVnBRk2zGUz5hPAU1GIsup9V1bpYv2c/A7RVEs05X4yR5
	 UHBKcGMJ/KeicUdin1Q4DVsFxIbV39gmdD3c9YRrru+iuVV9tAv9/9jegJT1JdBnxt
	 tOLjTds56EIfwL8EX+LGaPXSAno4XavXzNqROgUA=
Date: Tue, 24 Nov 2026 11:32:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: will@kernel.org, mark.rutland@arm.com, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, anshuman.khandual@arm.com, tabba@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Use symbolic constants for the ccmp NZCV
 immediates
Message-ID: <awV15Rv-caDclC9K@arm.com>
References: <20261009072147.474952-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009072147.474952-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_033259_177637_8D6D2469 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 09, 2026 at 08:21:47AM +0100, Fuad Tabba wrote:
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index f7dc5fb9427d6..15c381ef7d2c2 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -30,6 +30,10 @@
>  #define PSR_MODE_THREAD_BIT	(1 << 0)
>  #define PSR_IL_BIT		(1 << 20)
>  
> +/* CCMP NZCV immediates that make the named condition hold */
> +#define CCMP_NZCV_EQ		(PSR_Z_BIT >> 28)
> +#define CCMP_NZCV_LT		(PSR_N_BIT >> 28)
> +
>  /* AArch32-specific ptrace requests */
>  #define COMPAT_PTRACE_GETREGS		12
>  #define COMPAT_PTRACE_SETREGS		13

One nit: I'd place the definitions above (or below) the
ARM64_S390_COMMON block, the generated s390 header shouldn't need them.
Otherwise it greatly improves clarity.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

