Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD55606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNKT0vwC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SToEQ51p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1hSbeFnc8+d5Z0x/UFRVTe10rpzfLBfRbN4gPTIS9fk=; b=lNKT0vwCndOS/E
	fZHMCTjNYIjg8chd4+YJwXpMoaLX+1HJ2QJijzwb/Xe3HhYxnMx3JLg51E810PIfIb64z7CECClMv
	Gvih4mivqOEMsNnuBdMe68aZpeJRjeFWVSYxFswnqXjBrleFM6T0/EYTje7oqDGePN082NITv7onJ
	CaFozYN1ZD47rwfI9A1JiML9mOGJ4bflcTaoL1EsxQqRquhdL8BlEZyvN3AENF1O+ddqewHhlpC03
	GDaVf0cHYfDTkI5AiMEyLbI+VU1H7sK8Pbqk6BiULNFfRbhvODKPm0cw8GRXf1pSJ+6m66x1yagiK
	9WJHkyI52wWtdALqBatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDdU-0000000A60c-1gUj;
	Wed, 25 Nov 2026 14:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDdO-0000000A5zt-1ycx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:06:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E032F;
	Wed, 25 Nov 2026 06:06:02 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C886B3F763;
	Wed, 25 Nov 2026 06:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615565; bh=SgBEXWU+2TsD5MMV11iwbgnJvcaWxOvL9xfPyuT/IAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SToEQ51p66zfIRihYfE3jYc9D6azHmLvk4e67s3BY3vktfKKqPdomhcowPqZj4+4H
	 HI5epbHGt4D/5k/bI2q0DcVamTAPe27+gXWb4N4RtdlDQtnkVv+jZ9DKL1ifZMAqNK
	 FAUDUdm0+JQma+qWx8BX+H+ZGIi10gbhY/8urd6E=
Message-ID: <89423d04-7201-413c-974d-a98db3a0e460@arm.com>
Date: Wed, 25 Nov 2026 14:06:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
 <av7Ly_iLyiOAXQUR@red-moon>
 <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060610_025153_8D7584D1 
X-CRM114-Status: UNSURE (   9.78  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19/11/2026 12:32, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
>>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>>> +                                         u32 device_id)
>>> +{
>>> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
>>
>> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
>> let's explicitly say so).
> 
> With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
> the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

Yup, that's what my new comment now says :)

> 
> nit: this helper has a single caller, so could you call
> __gicv5_its_device_cache_inv() directly from
> gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?

Done.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha

