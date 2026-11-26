Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4774D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jUqrWKe+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JNB3n/3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I+ew5cOEbDh/QLeFMJP76BK0TfrUPvpXSZGqyop1UAM=; b=jUqrWKe+D8+Cim
	W9rGYCyvVcwXQ/vwuM4ZcTf2u5cMDV7bYrj/TsbfaMzMXsR9fZEZg8vWqP05S/Pw2zJGOFBNB77lk
	lOx1a804TBlvqzdSOtmdt86G+xXF/pv/2sVKKfUP5h0asXMBUKVw0TnUeKH9GNaU1484b3tspTT/9
	oH6DaByQPg69u845aV4x3IpeZ9/bSIvb2aEEI6QoRDCEYKgCAHJWI1EgPDxjLMR01ttR6CEmh587j
	NPUi9qA982mWy1eZvOBDCV3Ht8oGa6KyMvATq9Zu3WrPO13Bk3I8WhWFjI8O3dbY/3WRz9fDcDng9
	MK6FeOpy1zMaMnG9VL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWeN-0000000Ck4m-4By6;
	Thu, 26 Nov 2026 10:24:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWeL-0000000Ck3y-2BUa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:24:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63CD1BB0;
	Thu, 26 Nov 2026 02:24:17 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B8F3F86C;
	Thu, 26 Nov 2026 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795688660; bh=wQ9WA3KUKppIPPOGHeAfDQAVdxSATD/CsMT0ApV5e74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNB3n/3T4XoK8AOUq/tL2QQ0AwgNH3fpXW7vRZlP5hX6lAr6TM1j5mUGn9yobBTpn
	 06ma9Y1JdQzYArnaiB3L46VCBd+o+RqlAwLdvsVFK80A4d1Qthi3hiSnDMg+1Vbbhq
	 gw8GRnXrFDwhqHEXvE7WxGgxTFESpI331en0Zoho=
Message-ID: <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
Date: Thu, 26 Nov 2026 10:24:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_022421_600773_7C1067CB 
X-CRM114-Status: GOOD (  12.49  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Catalin, Will,


On 16/10/2026 17:54, Leo Yan wrote:
> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> but the sysreg description does not name its architected values. Define
> the five encodings as an unsigned enum so TRBE status handling can
> refer to each cause by name.
> 
> The values cover other events, Granule Protection Check faults,
> implementation-defined events, and stage 1 and stage 2 Data Aborts on
> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Are you ok with me taking this via the coresight tree ?

Cheers
Suzuki

> ---
>   arch/arm64/tools/sysreg | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -5834,7 +5834,13 @@ EndSysreg
>   Sysreg	TRBSR_EL1	3	0	9	11	3
>   Res0	63:56
>   Field	55:32	MSS2
> -Field	31:26	EC
> +UnsignedEnum	31:26	EC
> +	0b000000	OTHER
> +	0b011110	FAULT_GPC
> +	0b011111	IMP_DEF
> +	0b100100	FAULT_WRITE_S1
> +	0b100101	FAULT_WRITE_S2
> +EndEnum
>   Res0	25:24
>   Field	23	DAT
>   Field	22	IRQ
> 


