Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92588606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pICOCaAe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=plGLeUba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGNVsEbGKNomdBc98c+1LmiFeN7goXWYJ/3zVzwKrcs=; b=pICOCaAeRpx0fg
	wmJjXpd/K5Od4GAh5EDreWZf6CuPSVfXNJWJtqYyG+Qt4U1v5vTz4jEsd2D9nzN4/vQufg8n10RPc
	paqxcn5ViYLFZfGC626XWozmqNBp6UxGTBwOSImlXsHksnupz1BsYE377A5XgJk8dVspFJJCJixML
	iPZfsHX/tmOl8mvnaaSt/5JFlwDrzO2Ne/pwD/y/Z5FbNbPt3Pry08iTtSZsH7pRTKtlN8TdkqcEu
	Z45xBwWQBpvnX424Q00h1747dOp3RC8TdAZilJhACosS5KWgZz7MvcdSfU6b4Jc0rdJqKop1Il9b3
	D+jWJ9yki6wJDXNqpArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWENL-0000000AFje-14lA;
	Wed, 25 Nov 2026 14:53:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWENI-0000000AFih-2LA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:53:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8B72F;
	Wed, 25 Nov 2026 06:53:28 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55CF23F632;
	Wed, 25 Nov 2026 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795618411; bh=LFtUhCKeVN8BjqTri7/eXQmnJk7/LL86eeHc7MG+q3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=plGLeUbaakSMO5OcrasMiSKLEPz250XkgAmvB65p19MxmhMpc+WAfzewe1ASooa+i
	 RlHnnHbcgKv6vUFmx+e588JBgeFdcERauB87hv4pZlKiywAlkOSYXHurNaoLwaJqY4
	 M58/s3lWepokPf3z+YdMlSijGf9/Ixxi3YbQEcCk=
Message-ID: <bfe76aea-0292-4734-b669-886834ce139b@arm.com>
Date: Wed, 25 Nov 2026 14:53:27 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/39] arm64/efi: Implement override for IRQ flags
 checks
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
 ruanjinjie@huawei.com, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com,
 maz@kernel.org
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <20261112132042.129062-18-vladimir.murzin@arm.com>
 <0ba986f0-0309-441a-af6c-279125924693@sirena.org.uk>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <0ba986f0-0309-441a-af6c-279125924693@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065332_802764_FFF208CE 
X-CRM114-Status: UNSURE (   9.27  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 13:22, Mark Brown wrote:
> On Thu, Nov 12, 2026 at 01:20:20PM +0000, Vladimir Murzin wrote:
> 
>> +#define arch_efi_check_flags(state_flags, caller)									\
>> +do {															\
>> +	arm64_exc_hwstate_t __actual = {.flags =  arch_local_save_flags() };						\
>> +	arm64_exc_hwstate_t __expected = {.flags=state_flags};								\
> The generic version has an:
> 
>         if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))
>                 break;
> 
> which will generate a backtrace the first time things go wrong, this
> doesn't.
> 

Good point! Sashiko also suggested restoring flags before continue with
prints (which also applies to generic version).

Cheers
Vladimir

