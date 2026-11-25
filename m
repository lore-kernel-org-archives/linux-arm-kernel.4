Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1HjWd/e0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uCBnZchO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EOs7qtJ+FB/nym/d2H5YZjdIfgB+bpiO7MSd1vrCeM4=; b=1HjWd/e0whFBkv
	k/ycb5ZMZ1nLx5xoiArd9PxYj0qM4nmVe9m569kg0c4eOaBF8gSiA76UJ5R/nOamCjs0N6znN9D3V
	sUwdR4NRcq/DpepqYgtl5in9qDExkDnewnH0jd/+tiMvFGxZn1unNR6ovciLg53qVB53vAEVgmkzB
	l33tHmHC4BR+UK6PUOFZxFFKYZleHkTOUBvf+wUctyAwrtUxecNRmOLGCsWD5na2ttH2F5TPMeUn/
	PySLiqpLhe6IiN4mmja5irMxzZW9H6SCoUoIh+Kh9vs+fsPjAWzaHhsAG+AyKI14BEdmSxxNmdUFt
	OBNVF9DzAhBO69Y8G7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQl-0000000AGsY-1rHl;
	Wed, 25 Nov 2026 14:57:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQb-0000000AGmR-0nJl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24ABD2F;
	Wed, 25 Nov 2026 06:56:53 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2439F3F632;
	Wed, 25 Nov 2026 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795618616; bh=434131nFBmsUa14zzDub2gRRlN99OVBh/fgfgrfbkvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uCBnZchOiwCbJBy5+TYZLLh2z+GAtwn7uroda9iroKt3e4kn82lVp8uHT5PHGtl1g
	 aIxRw7KY2mQ4/JAg5I7zzKNUXEymkTZE1hXPXHmMBO4bdC+rUw7frX15EE6CpY411+
	 SkbAdaA2ehORiu8UsWfUonTYUF93VDRL+ZmddytE=
Message-ID: <1c38956d-2c8b-45b0-8f0e-2d28903bd208@arm.com>
Date: Wed, 25 Nov 2026 14:56:52 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] arm64: cpufeature: Detect PE support for
 FEAT_NMI
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com,
 ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org,
 ruanjinjie@huawei.com
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <20261112132042.129062-24-vladimir.murzin@arm.com>
 <303d8cc4-cb4a-443c-a74c-5c5db5588751@sirena.org.uk>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <303d8cc4-cb4a-443c-a74c-5c5db5588751@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065657_293260_5D1282BC 
X-CRM114-Status: GOOD (  12.24  )
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

On 11/12/26 15:37, Mark Brown wrote:
> On Thu, Nov 12, 2026 at 01:20:26PM +0000, Vladimir Murzin wrote:
> 
>> As KVM does not care about the host kernel supporting FEAT_NMI or not
>> to allow guests to use it, split the CPU cap in two : ARM64_HAS_NMI is
>> the hardware support, ARM64_NMI is the kernel making use of it.
> The split still makes sense but for nVHE (well, realistically pKVM) I
> think the hypervisor does have to care about host NMI usage, it has
> inject_host_exception() which sets up a fully synthesized exception
> state and returns to host EL1.  Unless I'm missing something this path
> needs to account for ALLINT/SPINTMASK since otherwise a superpriority
> interrupt can be delivered during exception entry which will confuse
> things.
> 

Nice catch! Indeed, we need to account for ALLINT/SPINTMASK when injecting
exception.

Cheers
Vladimir

