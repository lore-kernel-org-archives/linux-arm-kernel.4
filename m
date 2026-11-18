Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F874606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVOuyoHq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gOtf1/KA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1IbllusjMRCIaAIXLA41cjwGt2hmRdKFmrBTakj2Av0=; b=SVOuyoHqRzfHYB
	TWJdsV7zayYzoxEmd4R1leUBjt8PNOfs70Plf3r/z2yMr/ygV2LHzFy2YRJMNTC61t2QdxOVwpGKe
	fwvU6fR+sgbWKp9De8Bzd0Sb3LZRil5nN3pJcencLQN9CxQAjmj+yYXO3qHWi66X8cxsGgoXBdmnx
	RscBayY1v1W9U8vOTn9EyN0qt0k8v9JFVveeWJWNvj5AnsooZUMqQIw8ygLSkhS9rnnFUSdnWdtNp
	z+pTs1xAij/f1r2D79iNqLmb9fXgK7RXJbRY+8QNGbzmkfoDDQK5rQCEat2ybk2BUgDwRSFUtWg1Z
	ZA/He42XpnKActpQcWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiHd-00000009QJX-2Nxt;
	Wed, 18 Nov 2026 16:13:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiHX-00000009QIA-1u8C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:13:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0561E1596;
	Wed, 18 Nov 2026 08:13:08 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C54163F673;
	Wed, 18 Nov 2026 08:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795018390; bh=nK7TBcSEp2JbydJ2xoCE0lvuJ2Yl2LRjmtzjJylPKjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gOtf1/KAKZj0LMreurjK+QC939uTJvImRh1Xm/OujjEONs/gFKqLMkCFvInwO66+E
	 urAh8koJGsYtsUadAI9jgqq8h9ix5b0q6/3JxMcNYtb277lkuF12K29garixfPWOYV
	 9zDoYMbQFXlvdFTnpzct0re30aKTlLViMKjThLAg=
Message-ID: <6f0f15ef-37c5-491c-9b71-f78ff5b50a23@arm.com>
Date: Wed, 18 Nov 2026 16:12:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] KVM: arm64: Handle attributes in
 stage2_unmap_range
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-4-steven.price@arm.com>
 <CA+EHjTyeE0gbLgfiDePPVRR88GFVa7G-G8sr8k6vzM7v_uHxdA@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTyeE0gbLgfiDePPVRR88GFVa7G-G8sr8k6vzM7v_uHxdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081311_538160_99CCC967 
X-CRM114-Status: UNSURE (   7.70  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 14:16, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 16:43:49 +0000, Steven Price <steven.price@arm.com> wrote:
> [...]
>> With the introduction of private memory support, we need to
>> handle invalidation requests with filters for a given type.
>> Add support for passing the attributes down.
> 
> nit: what this passes down is a filter rather than attributes, in both
> the subject and the message.

True - I'll update the commit message.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!
Steve

> Cheers,
> /fuad


