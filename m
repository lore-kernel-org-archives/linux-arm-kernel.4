Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53524606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxVY2BZC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PLL+l15Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G4/GlGn1WSKNq78/bfPKOJ1ydFGAlPHoJ0mvOnfpMMs=; b=qxVY2BZC2NoWKd
	konLjXB6xN03F8dIDqi+U/FmLu/SRsWTBEwfNs+aXMnIzfnFZSFLxXuEK+W1URrQHqzOuPKlbo6Oj
	MS1nB3tRBKsO+u5qKXUU3gJJslfR/dVBTbGYnJelv/UOHWTc8iK+6cX/SYwT3oavcpu6fPDcvmbdT
	tGd4mYHN/p3d3Jp5No/OPkJ9rtNvI5l026x0sRgsppVKbufUZIRVDVcV6ivq8qWx1dnBLztj1OJKI
	BeVlY8UdildqwFkcMqVzSoQT2w9GLwjsENfJAt6+vZzykkkmaYcxZZ2KliPnzpitZZqvinMIKrr3I
	KkFLJhqng5VX3MCxavUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxlN-0000000GkDR-0Zs2;
	Fri, 27 Nov 2026 15:21:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxki-0000000Gk8O-3VWT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:20:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59591169E;
	Fri, 27 Nov 2026 07:20:41 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A8F93F632;
	Fri, 27 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792844; bh=9X6qNP8rGJ7XVuJJDK+m554NPJ+xdXd4p41sM8qWzGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PLL+l15ZtmSx6ri5+DBurqMe/gMrlmxLuY8P3+iAaAvKG9uMgxsPr4snm3zz2CpkX
	 RCPuUwYXnWueE3pttnkeu1/4rKfCpUlrn/GsUb4joCC+7vQtuAE+u9m2j51gGFmfeY
	 oP2GetUE0Mh/kP3pXyXhcK5wrr+fXgQeeAi3tcRs=
Message-ID: <a4c8b947-0b3f-41ca-82c4-aef3704b4451@arm.com>
Date: Fri, 27 Nov 2026 15:20:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072044_931935_F64DA451 
X-CRM114-Status: UNSURE (   7.94  )
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

On 16/10/2026 17:55, Leo Yan wrote:
> After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
> unexpected stop reasons are handled before the WRAP check. And the
> erratum and pointer checks is no longer relevant when deciding the
> buffer wrap.
> 
> Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
> status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
> reported as an overflow instead of a spurious event, which prepares for
> for TRBE wrap mode where collection continues and a maintenance
> interrupt is raised on current write pointer wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



